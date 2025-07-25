#!/usr/bin/env node

/**
 * Test transcript functionality with our fixed VimeoClient
 */

import { config } from 'dotenv';
import { VimeoClient } from './dist/vimeo-client.js';

config();

const accessToken = process.env.VIMEO_ACCESS_TOKEN;
const TEST_VIDEO_ID = '1104257902';

if (!accessToken) {
  console.error('❌ VIMEO_ACCESS_TOKEN not found');
  process.exit(1);
}

const client = new VimeoClient({ accessToken });

async function testTranscript() {
  console.log('🔍 Testing transcript download with fixed VimeoClient');
  console.log(`📹 Video ID: ${TEST_VIDEO_ID}`);
  
  try {
    console.log('\n📋 Attempting to download transcript for language "en"...');
    const transcript = await client.downloadTranscript(TEST_VIDEO_ID, 'en', 'webvtt');
    
    console.log('✅ SUCCESS! Transcript downloaded');
    console.log(`📄 Transcript length: ${transcript.length} characters`);
    console.log('📝 First 500 characters:');
    console.log('─'.repeat(50));
    console.log(transcript.substring(0, 500));
    console.log('─'.repeat(50));
    
  } catch (error) {
    console.log('❌ ERROR downloading transcript:');
    console.log(`   Message: ${error.message}`);
    console.log(`   Status: ${error.statusCode || 'N/A'}`);
  }
}

testTranscript().catch(console.error);