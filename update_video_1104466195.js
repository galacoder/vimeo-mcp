#!/usr/bin/env node

import { config } from "dotenv";
config();

import { VimeoClient } from "./dist/vimeo-client.js";

async function updateVideoMetadata() {
  const client = new VimeoClient({
    accessToken: process.env.VIMEO_ACCESS_TOKEN
  });

  const videoId = "1104466195";
  const title = "Day 191 - 1M Journey - First Time Seeing My App's UI After 85% Test Success";
  const description = `🚀 **Day 191 of my journey to 1 million building ProX!**

This is THE moment - after hitting 85% test success last night at midnight, I'm finally ready to see the UI of my app for the first time! Plus, I'm setting up something incredible: Claude Code running in Docker so AI can literally code for me while I sleep.

⚡ **What You'll See:**
• First-time UI deployment after months of backend work
• Setting up autonomous AI development with Claude Code + Docker
• 85% test success milestone (production-ready threshold!)
• Strategic discussion on scaling through AI automation
• ProX business logic and finance tracking implementation

💡 **Key Takeaways:**
- How to set up Claude Code for overnight autonomous development
- Why 85% test coverage is the sweet spot for production deployment
- The relationship between knowledge investment and financial growth
- Docker environment configuration for AI-powered development

💡 **Key Timestamps:**
00:00 - Day 191 introduction and major goals
01:30 - Technical planning: AI automation setup
02:30 - Business strategy: Knowledge vs Finance relationship
04:00 - Claude Code subagent configuration walkthrough

🎯 Building ProX is part of my documented journey to $1 million in revenue. Every test, every deployment, every breakthrough - all captured in real-time as I scale through AI automation.

**Are you ready to let AI code while you sleep?** Share your thoughts on autonomous development! 👇

#Journey1M #ProX #ClaudeCode #AIAutomation #Entrepreneur

---
*This is part of my daily documentation series as I work towards 1 million in revenue. Raw, real, unfiltered.*`;

  const tags = [
    "Journey1M", "ProX", "ClaudeCode", "Entrepreneur", "AIAutomation",
    "Docker", "StartupJourney", "TechEntrepreneur", "TestSuccess", "DailyProgress",
    "AutonomousCoding", "ProductionDeploy", "AIWorkflow", "BusinessStrategy", "TechFounder"
  ];

  console.log("🎬 Updating video metadata for:", videoId);
  console.log("📝 Title:", title);
  console.log("🏷️  Tags count:", tags.length);
  console.log("📄 Description length:", description.length, "characters");
  console.log();

  const results = {
    video_id: videoId,
    update_timestamp: new Date().toISOString(),
    metadata_applied: {
      title: title,
      description_length: description.length,
      tags_count: tags.length
    },
    update_status: {
      overall: "pending",
      title: "pending",
      description: "pending", 
      tags: "pending"
    },
    errors: {},
    source_file: "/Users/sangle/Dev/action/projects/mcp-servers/@download/vimeo/2025-07-25/suggestions/2025-07-25_new-recording-7252025-85816-am_1104466195_suggestions.md"
  };

  try {
    // Update title
    console.log("🔄 Updating title...");
    await client.updateVideoTitle(videoId, title);
    console.log("✅ Title updated successfully");
    results.update_status.title = "success";

    // Update description  
    console.log("🔄 Updating description...");
    await client.updateVideoDescription(videoId, description);
    console.log("✅ Description updated successfully");
    results.update_status.description = "success";

    // Update tags
    console.log("🔄 Updating tags...");
    await client.setVideoTags(videoId, tags);
    console.log("✅ Tags updated successfully");
    results.update_status.tags = "success";

    results.update_status.overall = "success";
    
    console.log();
    console.log("🎉 All metadata updated successfully!");
    console.log("📊 Final Status:", JSON.stringify(results, null, 2));

  } catch (error) {
    console.error("❌ Error updating video metadata:", error);
    
    // Determine which operation failed and update results accordingly
    if (error.message?.includes("title") || error.message?.includes("name")) {
      results.update_status.title = "error";
      results.errors.title = error.message;
    } else if (error.message?.includes("description")) {
      results.update_status.description = "error"; 
      results.errors.description = error.message;
    } else if (error.message?.includes("tag")) {
      results.update_status.tags = "error";
      results.errors.tags = error.message;
    } else {
      // General error - mark all as failed
      results.update_status.title = "error";
      results.update_status.description = "error";
      results.update_status.tags = "error";
      results.errors.general = error.message;
    }
    
    results.update_status.overall = "error";
    console.log("📊 Error Status:", JSON.stringify(results, null, 2));
  }

  return results;
}

updateVideoMetadata();