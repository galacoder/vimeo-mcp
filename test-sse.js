#!/usr/bin/env node

/**
 * Test Vimeo MCP Server with SSE transport
 * This tests all the essential features of the Vimeo MCP server
 */

require('dotenv').config();

const { Client } = require('@modelcontextprotocol/sdk/client/index.js');
const { SSEClientTransport } = require('@modelcontextprotocol/sdk/client/sse.js');

// Vimeo test configuration
const TEST_VIDEO_ID = '1039208523'; // Replace with a valid video ID from your account
const TEST_LANGUAGE = 'en';

async function testVimeoMCP() {
  console.log('🚀 Starting Vimeo MCP Server SSE Test\n');

  try {
    // Create SSE transport
    const transport = new SSEClientTransport(
      new URL('http://localhost:5173/sse')
    );

    // Create MCP client
    const client = new Client(
      {
        name: 'vimeo-test-client',
        version: '1.0.0'
      },
      {
        capabilities: {}
      }
    );

    // Connect to server
    await client.connect(transport);
    console.log('✅ Connected to Vimeo MCP Server via SSE\n');

    // List available tools
    const tools = await client.listTools();
    console.log('📋 Available Tools:');
    tools.tools.forEach(tool => {
      console.log(`  - ${tool.name}: ${tool.description}`);
    });
    console.log('');

    // Test 1: List Videos
    console.log('🎬 Test 1: Listing Videos');
    try {
      const listResult = await client.callTool('vimeo_list_videos', {
        per_page: 5
      });
      console.log(`  ✅ Found ${listResult.content[0].text.data.length} videos`);
      if (listResult.content[0].text.data.length > 0) {
        const firstVideo = listResult.content[0].text.data[0];
        console.log(`  📹 First video: "${firstVideo.name}" (ID: ${firstVideo.resource_key.split('/').pop()})`);
      }
    } catch (error) {
      console.log(`  ❌ Error: ${error.message}`);
    }

    // Test 2: Get Video Details
    console.log('\n📊 Test 2: Get Video Details');
    try {
      const detailsResult = await client.callTool('vimeo_get_video_details', {
        video_id: TEST_VIDEO_ID
      });
      const video = detailsResult.content[0].text;
      console.log(`  ✅ Video: "${video.name}"`);
      console.log(`  📈 Plays: ${video.stats.plays}`);
      console.log(`  🏷️  Tags: ${video.tags.map(t => t.name).join(', ') || 'None'}`);
    } catch (error) {
      console.log(`  ❌ Error: ${error.message}`);
    }

    // Test 3: Update Video Metadata
    console.log('\n✏️  Test 3: Update Video Metadata');
    try {
      const updateResult = await client.callTool('vimeo_update_video', {
        video_id: TEST_VIDEO_ID,
        description: `Updated via MCP on ${new Date().toISOString()}`,
        tags: ['mcp-test', 'automated']
      });
      console.log(`  ✅ Video metadata updated successfully`);
    } catch (error) {
      console.log(`  ❌ Error: ${error.message}`);
    }

    // Test 4: Download Transcript
    console.log('\n📝 Test 4: Download Transcript');
    try {
      const transcriptResult = await client.callTool('vimeo_download_transcript', {
        video_id: TEST_VIDEO_ID,
        language: TEST_LANGUAGE,
        format: 'srt'
      });
      console.log(`  ✅ Transcript downloaded (${transcriptResult.content[0].text.length} characters)`);
      console.log(`  📄 Preview: ${transcriptResult.content[0].text.substring(0, 100)}...`);
    } catch (error) {
      console.log(`  ❌ Error: ${error.message}`);
    }

    // Test 5: Get Video Stats
    console.log('\n📊 Test 5: Get Video Statistics');
    try {
      const statsResult = await client.callTool('vimeo_get_video_stats', {
        video_id: TEST_VIDEO_ID
      });
      const stats = statsResult.content[0].text;
      console.log(`  ✅ Stats retrieved`);
      console.log(`  👁️  Total Plays: ${stats.plays || 0}`);
    } catch (error) {
      console.log(`  ❌ Error: ${error.message}`);
    }

    // Disconnect
    await client.close();
    console.log('\n✅ All tests completed!');

  } catch (error) {
    console.error('❌ Test failed:', error);
    process.exit(1);
  }
}

// Run tests
testVimeoMCP().catch(console.error);