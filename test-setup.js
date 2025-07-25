#!/usr/bin/env node

/**
 * Test script to verify Vimeo MCP server setup
 * Run with: node test-setup.js
 */

require('dotenv').config();

console.log("Vimeo MCP Server Setup Test\n");

// Check Node.js version
const nodeVersion = process.version;
console.log(`✓ Node.js version: ${nodeVersion}`);

// Check for required environment variables
const accessToken = process.env.VIMEO_ACCESS_TOKEN;
const clientId = process.env.VIMEO_CLIENT_ID;
const clientSecret = process.env.VIMEO_CLIENT_SECRET;

console.log("\nAuthentication Configuration:");
if (accessToken) {
  console.log("✓ VIMEO_ACCESS_TOKEN is set");
  console.log(`  Token preview: ${accessToken.substring(0, 10)}...`);
} else if (clientId && clientSecret) {
  console.log("✓ OAuth2 credentials are set");
  console.log(`  Client ID: ${clientId}`);
  console.log(`  Client Secret: ${clientSecret.substring(0, 5)}...`);
} else {
  console.log("✗ No authentication credentials found!");
  console.log("  Please set either:");
  console.log("  - VIMEO_ACCESS_TOKEN for Personal Access Token auth");
  console.log("  - VIMEO_CLIENT_ID and VIMEO_CLIENT_SECRET for OAuth2");
  process.exit(1);
}

// Try to load the Vimeo client
try {
  const VimeoModule = require("@vimeo/vimeo");
  console.log("\n✓ @vimeo/vimeo package is installed");
} catch (error) {
  console.log("\n✗ @vimeo/vimeo package not found");
  console.log("  Run: npm install");
  process.exit(1);
}

// Check if TypeScript is compiled
const fs = require("fs");
const path = require("path");

const distPath = path.join(__dirname, "dist", "index.js");
if (fs.existsSync(distPath)) {
  console.log("✓ TypeScript build exists");
} else {
  console.log("✗ TypeScript not built");
  console.log("  Run: npm run build");
}

console.log("\n✅ Setup test complete!");
console.log("\nTo use with Claude Desktop, add the configuration from example-config.json");
console.log("to your Claude Desktop config file.");