#!/usr/bin/env node

/**
 * Direct test of Vimeo API to verify credentials
 */

import { config } from 'dotenv';
import { Vimeo } from '@vimeo/vimeo';

config();

const accessToken = process.env.VIMEO_ACCESS_TOKEN;

if (!accessToken) {
  console.error('❌ VIMEO_ACCESS_TOKEN not found in environment');
  process.exit(1);
}

console.log('🔑 Access token found:', accessToken.substring(0, 10) + '...');

const client = new Vimeo(null, null, accessToken);

// Test API connection
console.log('\n📡 Testing Vimeo API connection...');

client.request({
  method: 'GET',
  path: '/me'
}, (error, body, statusCode, headers) => {
  if (error) {
    console.error('❌ API Error:', error);
    console.error('Status:', statusCode);
    return;
  }

  console.log('✅ Connected to Vimeo API');
  console.log('👤 User:', body.name);
  console.log('📧 Account:', body.link);

  // Now list videos
  console.log('\n🎬 Fetching your videos...');
  
  client.request({
    method: 'GET',
    path: '/me/videos',
    query: {
      per_page: 5,
      fields: 'uri,name,duration,created_time,stats.plays'
    }
  }, (error, body, statusCode, headers) => {
    if (error) {
      console.error('❌ Error fetching videos:', error);
      return;
    }

    console.log(`✅ Found ${body.total} total videos`);
    console.log(`📹 Showing first ${body.data.length}:\n`);

    body.data.forEach((video, index) => {
      const videoId = video.uri.split('/').pop();
      console.log(`${index + 1}. "${video.name}"`);
      console.log(`   ID: ${videoId}`);
      console.log(`   Duration: ${Math.round(video.duration / 60)} minutes`);
      console.log(`   Plays: ${video.stats?.plays || 0}`);
      console.log('');
    });

    if (body.data.length > 0) {
      const firstVideoId = body.data[0].uri.split('/').pop();
      console.log(`💡 You can use video ID "${firstVideoId}" for testing`);
    }
  });
});