#!/usr/bin/env node

/**
 * Test Vimeo MCP Server integration with Claude Code
 * This script simulates Claude Code's stdio communication
 */

import { config } from 'dotenv';
import { spawn } from 'child_process';
import readline from 'readline';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Test configuration
const TEST_VIDEO_ID = '1039208523'; // Replace with your video ID

async function sendRequest(mcpProcess, method, params = {}) {
  return new Promise((resolve, reject) => {
    const id = Date.now();
    const request = {
      jsonrpc: '2.0',
      id,
      method,
      params
    };

    console.log(`\n📤 Sending: ${method}`);
    mcpProcess.stdin.write(JSON.stringify(request) + '\n');

    const handleResponse = (data) => {
      try {
        const lines = data.toString().split('\n').filter(line => line.trim());
        for (const line of lines) {
          const response = JSON.parse(line);
          if (response.id === id) {
            if (response.error) {
              reject(new Error(response.error.message));
            } else {
              resolve(response.result);
            }
            mcpProcess.stdout.removeListener('data', handleResponse);
            break;
          }
        }
      } catch (e) {
        // Not JSON, might be initialization output
      }
    };

    mcpProcess.stdout.on('data', handleResponse);

    // Timeout after 10 seconds
    setTimeout(() => {
      mcpProcess.stdout.removeListener('data', handleResponse);
      reject(new Error('Request timeout'));
    }, 10000);
  });
}

async function testMCPServer() {
  console.log('🚀 Testing Vimeo MCP Server (Claude Code Integration)\n');

  // Start the MCP server
  const mcpProcess = spawn('node', ['dist/index.js'], {
    env: {
      ...process.env,
      VIMEO_ACCESS_TOKEN: process.env.VIMEO_ACCESS_TOKEN
    },
    cwd: __dirname
  });

  // Capture stderr for debugging
  mcpProcess.stderr.on('data', (data) => {
    console.error('❌ Error:', data.toString());
  });

  // Wait for server to initialize
  await new Promise(resolve => setTimeout(resolve, 1000));

  try {
    // Initialize connection
    console.log('🔌 Initializing connection...');
    const initResult = await sendRequest(mcpProcess, 'initialize', {
      protocolVersion: '2024-11-05',
      capabilities: {},
      clientInfo: {
        name: 'test-client',
        version: '1.0.0'
      }
    });
    console.log('✅ Initialized:', initResult.protocolVersion);

    // List tools
    console.log('\n📋 Listing available tools...');
    const toolsResult = await sendRequest(mcpProcess, 'tools/list');
    console.log(`✅ Found ${toolsResult.tools.length} tools:`);
    toolsResult.tools.forEach(tool => {
      console.log(`  - ${tool.name}`);
    });

    // Test 1: List videos
    console.log('\n🎬 Test 1: List Videos');
    const listResult = await sendRequest(mcpProcess, 'tools/call', {
      name: 'vimeo_list_videos',
      arguments: {
        per_page: 3
      }
    });
    const videos = JSON.parse(listResult.content[0].text);
    console.log(`✅ Found ${videos.data.length} videos`);
    if (videos.data.length > 0) {
      console.log(`  First video: "${videos.data[0].name}"`);
    }

    // Test 2: Get video details
    console.log('\n📊 Test 2: Get Video Details');
    const detailsResult = await sendRequest(mcpProcess, 'tools/call', {
      name: 'vimeo_get_video_details',
      arguments: {
        video_id: TEST_VIDEO_ID
      }
    });
    const videoDetails = JSON.parse(detailsResult.content[0].text);
    console.log(`✅ Video: "${videoDetails.name}"`);
    console.log(`  Duration: ${Math.round(videoDetails.duration / 60)} minutes`);
    console.log(`  Plays: ${videoDetails.stats?.plays || 0}`);

    // Test 3: Update video
    console.log('\n✏️ Test 3: Update Video Metadata');
    const updateResult = await sendRequest(mcpProcess, 'tools/call', {
      name: 'vimeo_update_video',
      arguments: {
        video_id: TEST_VIDEO_ID,
        title: videoDetails.name, // Keep same title
        description: `Updated via MCP test on ${new Date().toLocaleString()}`,
        tags: ['mcp-test', 'claude-code']
      }
    });
    console.log('✅ Video updated successfully');

    // Test 4: Get video stats
    console.log('\n📈 Test 4: Get Video Statistics');
    const statsResult = await sendRequest(mcpProcess, 'tools/call', {
      name: 'vimeo_get_video_stats',
      arguments: {
        video_id: TEST_VIDEO_ID
      }
    });
    const stats = JSON.parse(statsResult.content[0].text);
    console.log('✅ Stats retrieved');
    console.log(`  Total plays: ${stats.plays || 0}`);

    console.log('\n🎉 All tests passed!');

  } catch (error) {
    console.error('\n❌ Test failed:', error.message);
  } finally {
    // Clean up
    mcpProcess.kill();
    process.exit(0);
  }
}

// Run the test
testMCPServer().catch(console.error);