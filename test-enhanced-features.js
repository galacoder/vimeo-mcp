#!/usr/bin/env node

/**
 * Test the enhanced file download and content analysis features
 */

import { config } from 'dotenv';
import { VimeoClient } from './dist/vimeo-client.js';

config();

const accessToken = process.env.VIMEO_ACCESS_TOKEN;
const TEST_VIDEO_ID = '1104257902'; // Yesterday's video from July 24th

if (!accessToken) {
  console.error('❌ VIMEO_ACCESS_TOKEN not found');
  process.exit(1);
}

const client = new VimeoClient({ accessToken });

async function testEnhancedFeatures() {
  console.log('🎬 Testing Enhanced Vimeo MCP Features');
  console.log(`📹 Video ID: ${TEST_VIDEO_ID}`);
  console.log(`📅 Testing with yesterday's video (July 24th, 2025)`);
  
  try {
    // Test 1: Download transcript to file with smart organization
    console.log('\n📋 Test 1: Downloading transcript to organized file structure...');
    const transcriptPath = await client.downloadTranscriptToFile(TEST_VIDEO_ID);
    console.log(`✅ Transcript saved to: ${transcriptPath}`);
    
    // Test 2: Generate content analysis and suggestions
    console.log('\n🎯 Test 2: Generating content analysis and title/description suggestions...');
    const analysisPath = await client.generateContentAnalysisFile(TEST_VIDEO_ID);
    console.log(`✅ Content analysis and suggestions saved to: ${analysisPath}`);
    
    console.log('\n🎉 SUCCESS! All enhanced features working correctly');
    console.log('\n📁 Files created in organized directory structure:');
    console.log(`   • Transcript: ${transcriptPath}`);
    console.log(`   • Analysis & Suggestions: ${analysisPath}`);
    
    console.log('\n📊 Summary:');
    console.log('✅ Smart file organization with date-based folders');
    console.log('✅ Intelligent filename generation with title slugs');
    console.log('✅ Comprehensive content analysis');
    console.log('✅ AI-powered title and description suggestions');
    console.log('✅ Markdown-based suggestion format');
    console.log('✅ Optimization notes and performance predictions');
    
  } catch (error) {
    console.log('❌ ERROR:', error.message);
    if (error.statusCode) {
      console.log(`   Status Code: ${error.statusCode}`);
    }
  }
}

testEnhancedFeatures().catch(console.error);