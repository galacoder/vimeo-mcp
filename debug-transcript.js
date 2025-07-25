#!/usr/bin/env node

/**
 * Debug Vimeo Text Tracks API
 * Step-by-step debugging of transcript access
 */

import { config } from 'dotenv';
import { Vimeo } from '@vimeo/vimeo';
import { fileURLToPath } from 'url';
import { dirname } from 'path';

config();

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const accessToken = process.env.VIMEO_ACCESS_TOKEN;
const TEST_VIDEO_ID = '1104257902'; // Yesterday's video with AI transcript

if (!accessToken) {
  console.error('❌ VIMEO_ACCESS_TOKEN not found');
  process.exit(1);
}

console.log('🔍 Debugging Vimeo Text Tracks API');
console.log(`📹 Testing with video ID: ${TEST_VIDEO_ID}`);
console.log(`🔑 Token: ${accessToken.substring(0, 10)}...\n`);

const client = new Vimeo(null, null, accessToken);

async function debugStep(stepName, apiCall) {
  console.log(`\n🔧 ${stepName}`);
  console.log('─'.repeat(50));
  
  try {
    const result = await apiCall();
    console.log('✅ Success');
    console.log('📊 Response:', JSON.stringify(result, null, 2));
    return result;
  } catch (error) {
    console.log('❌ Error');
    console.log('📊 Error details:', {
      message: error.message,
      statusCode: error.statusCode || 'N/A',
      headers: error.headers || 'N/A',
      stack: error.stack?.split('\n')[0]
    });
    return null;
  }
}

async function makeApiRequest(method, path, query = {}) {
  return new Promise((resolve, reject) => {
    console.log(`🌐 API Call: ${method} ${path}`);
    if (Object.keys(query).length > 0) {
      console.log(`🔍 Query params:`, query);
    }
    
    const callback = (error, body, statusCode, headers) => {
      console.log(`📡 Response: ${statusCode}`);
      console.log(`📋 Headers:`, JSON.stringify(headers, null, 2));
      
      if (error) {
        error.statusCode = statusCode;
        error.headers = headers;
        reject(error);
      } else {
        console.log(`📄 Body type: ${typeof body}`);
        console.log(`📄 Body length: ${JSON.stringify(body).length} characters`);
        resolve(body);
      }
    };

    if (method === "GET") {
      client.request({ method, path, query }, callback);
    } else {
      client.request({ method, path, ...query }, callback);
    }
  });
}

async function debugTranscriptAccess() {
  
  // Step 1: Verify video exists and get details
  await debugStep('Step 1: Get Video Details', async () => {
    return makeApiRequest('GET', `/videos/${TEST_VIDEO_ID}`, {
      fields: 'uri,name,description,duration,created_time,privacy'
    });
  });

  // Step 2: List all text tracks for the video
  await debugStep('Step 2: List Text Tracks', async () => {
    return makeApiRequest('GET', `/videos/${TEST_VIDEO_ID}/texttracks`);
  });

  // Step 3: Try with different field specifications
  await debugStep('Step 3: List Text Tracks with Fields', async () => {
    return makeApiRequest('GET', `/videos/${TEST_VIDEO_ID}/texttracks`, {
      fields: 'uri,active,type,language,name,link'
    });
  });

  // Step 4: Check video metadata for transcript info
  await debugStep('Step 4: Check Video Metadata for Transcripts', async () => {
    return makeApiRequest('GET', `/videos/${TEST_VIDEO_ID}`, {
      fields: 'uri,name,metadata.connections'
    });
  });

  // Step 5: Try the alternative endpoint pattern
  await debugStep('Step 5: Try Alternative Text Track Endpoint', async () => {
    return makeApiRequest('GET', `/videos/${TEST_VIDEO_ID}/text_tracks`);
  });

  // Step 6: Check if there's a different endpoint for auto-generated captions
  await debugStep('Step 6: Check for Captions Endpoint', async () => {
    return makeApiRequest('GET', `/videos/${TEST_VIDEO_ID}/captions`);
  });

  // Step 7: Check comprehensive video data
  await debugStep('Step 7: Get Full Video Data', async () => {
    return makeApiRequest('GET', `/videos/${TEST_VIDEO_ID}`);
  });

  console.log('\n🎯 Debug Complete!');
  console.log('📝 Next steps based on results:');
  console.log('   - If Step 2 shows text tracks: Check access permissions');
  console.log('   - If no text tracks found: Auto-generated transcripts may use different endpoint');
  console.log('   - Check Step 7 for any transcript-related metadata');
}

// Run the debug
debugTranscriptAccess().catch(console.error);