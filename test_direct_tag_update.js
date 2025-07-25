#!/usr/bin/env node

import { config } from "dotenv";
config();

import { VimeoClient } from "./dist/vimeo-client.js";

async function testTagUpdate() {
  const client = new VimeoClient({
    accessToken: process.env.VIMEO_ACCESS_TOKEN
  });

  const videoId = "1104516203";
  const tagsWithSpaces = [
    "1M journey",
    "vimeo automation", 
    "mcp servers",
    "ai agents",
    "claude code"
  ];

  console.log("🧪 Testing tag update with spaces...");
  console.log("📹 Video ID:", videoId);
  console.log("🏷️  Tags:", tagsWithSpaces);

  try {
    const result = await client.setVideoTags(videoId, tagsWithSpaces);
    console.log("✅ Success! Tags updated:", result);
  } catch (error) {
    console.error("❌ Error updating tags:", error);
  }
}

testTagUpdate();