#!/usr/bin/env node

/**
 * Direct video metadata update for video ID 1104516203
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
const videoId = '1104516203';

const updateData = {
  name: 'Day 30 - 1M Journey - Building AI Content Automation - Custom Vimeo MCP Server',
  description: `🚀 **Day 30 of my journey to 1 million building automated content systems!**

Today I'm going deep into the technical infrastructure - building a custom Vimeo MCP server that will automatically generate video titles, descriptions, and metadata using AI. This is the behind-the-scenes tooling that powers the journey.

⚡ **What You'll See:**
• Complete API research and documentation deep-dive for Vimeo integration
• Authentication setup and credential configuration for secure API access
• MCP server architecture planning and initial development setup
• Real-time problem-solving and technical decision-making process

💡 **Key Takeaways:**
- Building automation tools is essential for scaling content creation efficiently
- API research and proper authentication setup are critical for reliable integrations
- MCP servers provide powerful frameworks for AI-driven tool development

💡 **Key Timestamps:**
00:00 - Project Introduction: Decision to build Vimeo MCP automation server
01:20 - API Research Phase: Exploring Vimeo developer documentation and capabilities
02:30 - Authentication Setup: Configuring API credentials and security protocols
10:40 - MCP Development: Setting up server structure and development environment
01:34:42 - Session Wrap-up: Confident next steps and implementation roadmap

🎯 Building automated content systems is a crucial part of my documented journey to $1 million in revenue. Every tool, every automation, every technical decision - captured in real-time as I build the infrastructure that will scale the business.

**What automation tools do you think are most important for scaling a content business?** Drop your thoughts below! 👇

#Journey1M #VimeoMCP #AutomationTools #MCPServer #TechEntrepreneur

---
*This is part of my daily documentation series as I work towards 1 million in revenue. Raw, real, unfiltered technical development.*`
};

const tags = [
  'Journey1M',
  'VimeoMCP', 
  'AutomationTools',
  'TechEntrepreneur',
  'MCPServer',
  'APIIntegration',
  'StartupJourney',
  'DeveloperTools',
  'ContentAutomation',
  'InfrastructureBuild',
  'VimeoAPI',
  'ModelContextProtocol',
  'AuthenticationSetup',
  'DeveloperDeepDive',
  'TechnicalSession'
];

console.log(`\n🎬 Updating video ${videoId}...`);
console.log('📝 Title:', updateData.name);
console.log('📄 Description length:', updateData.description.length, 'characters');
console.log('🏷️  Tags count:', tags.length);

// First update title and description
client.request({
  method: 'PATCH',
  path: `/videos/${videoId}`,
  query: {
    name: updateData.name,
    description: updateData.description
  }
}, async (error, body, statusCode, headers) => {
  if (error) {
    console.error('❌ Error updating video metadata:', error);
    console.error('Status:', statusCode);
    return;
  }

  console.log('✅ Video metadata updated successfully');
  console.log('📊 Response status:', statusCode);
  
  // Now update tags
  console.log('\n🏷️  Updating tags...');
  
  // First, get existing tags
  client.request({
    method: 'GET',
    path: `/videos/${videoId}/tags`
  }, (error, existingTagsBody) => {
    if (error) {
      console.error('❌ Error fetching existing tags:', error);
      return;
    }

    console.log('📋 Found', existingTagsBody.data?.length || 0, 'existing tags');

    // Remove existing tags first
    if (existingTagsBody.data && existingTagsBody.data.length > 0) {
      console.log('🗑️  Removing existing tags...');
      
      let removePromises = existingTagsBody.data.map(tag => {
        return new Promise((resolve, reject) => {
          client.request({
            method: 'DELETE',
            path: `/videos/${videoId}/tags/${encodeURIComponent(tag.tag)}`
          }, (error, body, statusCode) => {
            if (error) {
              console.error(`❌ Error removing tag "${tag.tag}":`, error);
              reject(error);
            } else {
              console.log(`   ✅ Removed: ${tag.tag}`);
              resolve();
            }
          });
        });
      });

      Promise.allSettled(removePromises).then(() => {
        // Add new tags
        addNewTags();
      });
    } else {
      // No existing tags, just add new ones
      addNewTags();
    }

    function addNewTags() {
      console.log('\n➕ Adding new tags...');
      
      let addPromises = tags.map(tag => {
        return new Promise((resolve, reject) => {
          client.request({
            method: 'PUT',
            path: `/videos/${videoId}/tags/${encodeURIComponent(tag)}`
          }, (error, body, statusCode) => {
            if (error) {
              console.error(`❌ Error adding tag "${tag}":`, error);
              reject(error);
            } else {
              console.log(`   ✅ Added: ${tag}`);
              resolve();
            }
          });
        });
      });

      Promise.allSettled(addPromises).then((results) => {
        const successful = results.filter(r => r.status === 'fulfilled').length;
        const failed = results.filter(r => r.status === 'rejected').length;
        
        console.log(`\n🎉 Tag update complete: ${successful} added, ${failed} failed`);
        
        // Final verification
        console.log('\n🔍 Verifying final video state...');
        client.request({
          method: 'GET',
          path: `/videos/${videoId}`,
          query: {
            fields: 'uri,name,description,tags'
          }
        }, (error, finalBody) => {
          if (error) {
            console.error('❌ Error fetching final video state:', error);
            return;
          }

          console.log('\n📊 Final Update Report:');
          console.log('🎬 Video ID:', videoId);
          console.log('📝 Title Updated:', finalBody.name === updateData.name ? '✅' : '❌');
          console.log('📄 Description Updated:', finalBody.description === updateData.description ? '✅' : '❌');
          console.log('🏷️  Tags Applied:', finalBody.tags?.length || 0, 'of', tags.length);
          
          if (finalBody.tags && finalBody.tags.length > 0) {
            console.log('📋 Current tags:', finalBody.tags.map(t => t.tag).join(', '));
          }

          console.log('\n🎯 Video metadata update completed!');
          console.log('🔗 Video URL: https://vimeo.com/' + videoId);
        });
      });
    }
  });
});