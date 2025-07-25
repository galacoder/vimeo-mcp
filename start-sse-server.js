#!/usr/bin/env node

/**
 * SSE Server wrapper for Vimeo MCP
 * Starts an SSE server that wraps the stdio-based MCP server
 */

require('dotenv').config();

const { spawn } = require('child_process');
const express = require('express');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 5173;

// Enable CORS for SSE
app.use(cors());
app.use(express.json());

// SSE endpoint
app.get('/sse', (req, res) => {
  console.log('📡 SSE client connected');

  // Set SSE headers
  res.writeHead(200, {
    'Content-Type': 'text/event-stream',
    'Cache-Control': 'no-cache',
    'Connection': 'keep-alive',
    'X-Accel-Buffering': 'no'
  });

  // Start the MCP server process
  const mcpProcess = spawn('node', [__dirname + '/dist/index.js'], {
    env: {
      ...process.env,
      VIMEO_ACCESS_TOKEN: process.env.VIMEO_ACCESS_TOKEN
    }
  });

  // Forward stdout to SSE
  mcpProcess.stdout.on('data', (data) => {
    const message = data.toString();
    res.write(`data: ${message}\n\n`);
  });

  // Forward stderr for debugging
  mcpProcess.stderr.on('data', (data) => {
    console.error('MCP Error:', data.toString());
  });

  // Handle stdin from client
  req.on('data', (data) => {
    mcpProcess.stdin.write(data);
  });

  // Cleanup on disconnect
  req.on('close', () => {
    console.log('📡 SSE client disconnected');
    mcpProcess.kill();
  });

  mcpProcess.on('exit', (code) => {
    console.log(`MCP process exited with code ${code}`);
    res.end();
  });
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'ok', server: 'vimeo-mcp-sse' });
});

// Start server
app.listen(PORT, () => {
  console.log(`🚀 Vimeo MCP SSE Server running on http://localhost:${PORT}`);
  console.log(`📡 SSE endpoint: http://localhost:${PORT}/sse`);
  console.log(`🏥 Health check: http://localhost:${PORT}/health`);
});