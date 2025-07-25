#!/usr/bin/env node

/**
 * Generate title and description suggestions for video using transcript
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

async function generateSuggestions() {
  console.log('🎬 Generating title and description suggestions');
  console.log(`📹 Video ID: ${TEST_VIDEO_ID}`);
  
  try {
    // Get video details
    console.log('\n📋 Getting video details...');
    const videoDetails = await client.getVideoDetails(TEST_VIDEO_ID);
    console.log(`📄 Current title: "${videoDetails.name}"`);
    console.log(`⏱️  Duration: ${Math.floor(videoDetails.duration / 60)}:${(videoDetails.duration % 60).toString().padStart(2, '0')}`);
    console.log(`📅 Created: ${new Date(videoDetails.created_time).toLocaleDateString()}`);
    
    // Get transcript
    console.log('\n📋 Downloading transcript...');
    const transcript = await client.downloadTranscript(TEST_VIDEO_ID, 'en', 'webvtt');
    
    // Extract just the text content from WebVTT
    const textContent = transcript
      .split('\n')
      .filter(line => 
        line.trim() && 
        !line.includes('WEBVTT') && 
        !line.includes('-->') && 
        !/^\d+$/.test(line.trim())
      )
      .join(' ')
      .replace(/\s+/g, ' ')
      .trim();
    
    console.log(`📝 Transcript length: ${textContent.length} characters`);
    console.log('\n📊 First 200 characters of transcript:');
    console.log(`"${textContent.substring(0, 200)}..."`);
    
    // Analyze content for suggestions
    const content = textContent.toLowerCase();
    const words = content.split(' ');
    
    // Determine day number (you'll need to update this logic)
    const currentDate = new Date(videoDetails.created_time);
    const dayNumber = currentDate.getDate(); // Simplified - you may want to calculate actual day number in journey
    
    // Determine content type based on keywords
    let contentType = 'Both'; // Default
    const codingKeywords = ['code', 'coding', 'programming', 'function', 'variable', 'javascript', 'react', 'api', 'database', 'bug', 'debugging'];
    const motivationKeywords = ['motivation', 'journey', 'goal', 'success', 'challenge', 'progress', 'mindset', 'growth', 'inspiration'];
    
    const codingScore = codingKeywords.reduce((score, keyword) => 
      score + (content.includes(keyword) ? 1 : 0), 0);
    const motivationScore = motivationKeywords.reduce((score, keyword) => 
      score + (content.includes(keyword) ? 1 : 0), 0);
    
    if (codingScore > motivationScore && codingScore > 2) {
      contentType = 'Coding';
    } else if (motivationScore > codingScore && motivationScore > 2) {
      contentType = 'Motivation';
    }
    
    // Generate title suggestions based on content analysis
    const titleSuggestions = [];
    
    if (content.includes('marketing') || content.includes('proco')) {
      titleSuggestions.push(`Day ${dayNumber} - Journey to 1M - ${contentType} - Marketing Strategy Deep Dive`);
      titleSuggestions.push(`Day ${dayNumber} - Journey to 1M - ${contentType} - Building the Marketing Engine`);
      titleSuggestions.push(`Day ${dayNumber} - Journey to 1M - ${contentType} - Proco Pro XI Marketing Push`);
    }
    
    if (content.includes('hour') || content.includes('time')) {
      titleSuggestions.push(`Day ${dayNumber} - Journey to 1M - ${contentType} - Racing Against Time`);
      titleSuggestions.push(`Day ${dayNumber} - Journey to 1M - ${contentType} - One Hour Power Session`);
    }
    
    // Generic suggestions
    titleSuggestions.push(`Day ${dayNumber} - Journey to 1M - ${contentType} - Daily Progress Update`);
    titleSuggestions.push(`Day ${dayNumber} - Journey to 1M - ${contentType} - Building the Dream`);
    titleSuggestions.push(`Day ${dayNumber} - Journey to 1M - ${contentType} - Hustle & Flow`);
    
    // Generate description
    const description = `🚀 Day ${dayNumber} of my journey to 1 million!

📝 In this ${contentType.toLowerCase()} session, I dive into:
${content.includes('marketing') ? '• Marketing strategy development\\n' : ''}${content.includes('proco') ? '• Proco Pro XI project work\\n' : ''}• Progress updates and insights
• Real-time problem solving
• Building towards the 1M goal

💪 Every day counts on this journey! Follow along as I document the highs, lows, and everything in between.

🎯 Goal: 1 Million in revenue/followers/impact
📅 Journey Day: ${dayNumber}
⏱️ Session Length: ${Math.floor(videoDetails.duration / 60)} minutes

#Journey1M #Entrepreneur #${contentType} ${content.includes('marketing') ? '#Marketing' : ''} #Progress #Hustle

What would you like to see in tomorrow's session? Drop a comment below! 👇`;

    console.log('\n🎯 TITLE SUGGESTIONS:');
    console.log('─'.repeat(50));
    titleSuggestions.forEach((title, index) => {
      console.log(`${index + 1}. ${title}`);
    });
    
    console.log('\n📝 DESCRIPTION SUGGESTION:');
    console.log('─'.repeat(50));
    console.log(description);
    
    console.log('\n📊 CONTENT ANALYSIS:');
    console.log('─'.repeat(50));
    console.log(`Content Type: ${contentType}`);
    console.log(`Coding Keywords Found: ${codingScore}`);
    console.log(`Motivation Keywords Found: ${motivationScore}`);
    console.log(`Detected Topics: ${content.includes('marketing') ? 'Marketing ' : ''}${content.includes('proco') ? 'Proco Project ' : ''}`);
    
  } catch (error) {
    console.log('❌ ERROR:', error.message);
  }
}

generateSuggestions().catch(console.error);