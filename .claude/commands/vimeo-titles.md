# Analyze Vimeo videos and generate viral titles for batch updating

**Process the following videos: $ARGUMENTS**

**Context: Journey to 1M Revenue/Impact Series**
**Known Projects**: ProX, FinX, BusinessX, WarriorX, Proco Pro XI

**⚡ Workflow Steps (Token-Optimized):**

1. **List Videos with Pagination (Avoid Token Overflow)**
   ```
   mcp__vimeo__vimeo_list_videos(
     compact: true,      # CRITICAL: Prevents 42K+ token responses
     per_page: 6,        # Max safe limit per request
     page: [1,2,3...],   # Paginate through all videos
     sort: "date",       # Get chronological order
     direction: "desc"   # Most recent first
   )
   ```
   - Parse timeframe from $ARGUMENTS (e.g., "July 13 to today")
   - Filter results by date range after retrieval
   - Group videos by date for organized processing

2. **Download Transcripts to Filesystem (Avoid Token Limits)**
   ```
   mcp__vimeo__vimeo_download_transcript_to_file(
     video_id: "[video_id]",
     base_path: "/Users/sangle/Dev/action/projects/mcp-servers/@download/vimeo",
     format: "webvtt",
     language: "en"
   )
   ```
   - Downloads to: `@download/vimeo/[date]/transcripts/[date]_[title]_[id].vtt`
   - Avoids 30K+ token responses from direct transcript reading
   - Enables local file analysis with pagination

3. **Read and Analyze Transcript Content**
   ```
   Read(
     file_path: "[transcript_path]",
     head: 1000  # Read in chunks if needed for large files
   )
   ```
   - Analyze content for:
     * Project names (ProX, FinX, BusinessX, WarriorX, Proco Pro XI, or detect new ones)
     * Technical tools mentioned (Claude, AI models, frameworks, specific tech stack)
     * Session type (coding, marketing, planning, strategy, sprint sessions)
     * Time constraints (1 hour, sprint sessions, race against time)
     * Key achievements, breakthroughs, or major progress
     * Specific features or functionality being built
     * Business goals and milestones mentioned

4. **Generate 5 Viral Title Options per Video** using standardized format:
   
   **Standard Format**: `Day [#] - [1M Journey] - [Motivation/Coding/Both(MoCo)] - [Viral Hook Title]`
   
   Examples:
   - `Day 25 - 1M Journey - Coding - Building AI Agents to Automate My Vimeo Workflow`
   - `Day 24 - 1M Journey - MoCo - Backend Cleanup Sprint: From Chaos to Clean Architecture`
   - `Day 13 - 1M Journey - Motivation - Why I Ditched Cursor for Claude Code (Real Numbers Inside)`

   **Engagement patterns to use**:
   - **Time pressure hooks**: "1-Hour Sprint", "Race Against Time", "30-Minute Build"
   - **Project-specific**: Include exact project names (ProX, FinX, etc.)
   - **Value proposition**: "How I Built", "The Strategy That", "Why I Chose"
   - **Curiosity gaps**: "What Happened When", "The Secret to", "What They Don't Tell You"
   - **Specificity**: Mention exact tools, results, timeframes, dollar amounts
   - **Social proof**: Reference "Journey to 1M" series consistently
   - **Problem/Solution**: "From Stuck to Success", "The Bug That Almost Killed"
   - **Behind the scenes**: "Real Talk:", "Unfiltered:", "Raw Process:"

5. **Create Optimized Descriptions** for each video:
   ```
   🚀 Day [#] of my journey to $1M in revenue/impact

   In this episode:
   • [Key achievement or breakthrough]
   • [Technical challenge solved]
   • [Tool or framework featured]
   • [Business lesson learned]

   🔥 What you'll learn:
   - [Specific technique or strategy]
   - [Problem-solving approach]
   - [Tool usage or integration]
   - [Time-saving method]

   💡 Key timestamps:
   00:00 - Introduction
   [XX:XX] - [Major topic 1]
   [XX:XX] - [Major topic 2]
   [XX:XX] - [Key breakthrough moment]

   🏆 Join the 1M Journey community
   👉 Subscribe for daily updates
   💬 Drop your biggest challenge in the comments

   #1MJourney #[ProjectName] #Entrepreneurship #CodingJourney #StartupLife
   ```

6. **Generate Optimized Tags** (10-15 per video):
   - Journey tags: "1M journey", "million dollar journey", "entrepreneur journey"
   - Tech tags: Based on tools mentioned in transcript
   - Project tags: "ProX", "FinX", "BusinessX", "WarriorX" as detected
   - Topic tags: "coding session", "startup lessons", "ai automation"
   - Platform tags: "claude code", "vimeo automation", "mcp servers"

7. **Create Bulk Update Commands** using API token from .env:
   ```bash
   # For each video, generate curl command:
   export VIMEO_API_TOKEN=$(grep VIMEO_API_TOKEN .env | cut -d'=' -f2)
   
   curl -X PATCH "https://api.vimeo.com/videos/[VIDEO_ID]" \
     -H "Authorization: Bearer $VIMEO_API_TOKEN" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "[Selected viral title]",
       "description": "[Optimized description]",
       "privacy": {"view": "anybody"},
       "tags": ["tag1", "tag2", "tag3"...]
     }'
   ```

8. **Create comprehensive summary report** with:
   ```markdown
   # 🎬 Video Title Analysis Summary - [Date Range]

   ## Videos Processed: [Number]

   ### 📹 Video [N]: [Date] (ID: [VideoID])
   **Current**: "[Original Title]"
   **Duration**: [MM:SS] | **Project Detected**: [ProjectName]
   **Session Type**: [Type] | **Key Tools**: [Tools]

   **🔥 Viral Title Options (Ranked by Engagement Potential):**
   1. **[9.2/10]** [Title with strong hook and project context]
   2. **[8.8/10]** [Title with curiosity gap and specificity]  
   3. **[8.5/10]** [Title with time pressure and value prop]
   4. **[8.2/10]** [Title with behind-the-scenes angle]
   5. **[7.9/10]** [Title with problem/solution narrative]

   **💡 Content Insights**: [What makes this video unique, key moments, viral potential]
   **🎯 Target Audience**: [Entrepreneurs, developers, specific niches]
   
   **🛠️ Update Command**:
   ```
   mcp__vimeo__vimeo_update_video(video_id: "[VideoID]", title: "[Selected Title]")
   ```

   ---
   ```

9. **Offer actionable next steps:**
   - Provide all curl commands in a single executable script
   - Show specific MCP update commands as alternative: `mcp__vimeo__vimeo_update_video`
   - Include engagement score rationale for each title
   - Suggest best titles for different objectives (views vs. conversions vs. subscribers)
   - Include quick copy-paste commands for bulk updates

**💡 Token Optimization Tips:**
- Always use `compact: true` for listing videos
- Use `per_page: 6` maximum to avoid overflow
- Download transcripts to filesystem, don't read directly
- Read files with `head` or `tail` parameters for large transcripts
- Paginate through results rather than requesting all at once

**🔥 Success Metrics:**
- Token usage reduced from 42K+ to under 5K per operation
- Complete transcript analysis without overflow errors
- Viral titles based on actual content, not assumptions
- Bulk update commands ready for immediate execution
- Full workflow documented for future automation

**Focus**: Create viral, customer-hooking titles that:
- Use standardized format: `Day [#] - 1M Journey - [Type] - [Hook]`
- Include specific project context (ProX, FinX, BusinessX, WarriorX, Proco Pro XI)
- Create curiosity gaps that compel clicks
- Maintain "Journey to 1M" series branding
- Hook entrepreneurs, developers, and business builders
- Include specific details (timeframes, tools, achievements)
- Use proven viral title patterns that drive engagement

**Output Style**: Professional, actionable, with clear engagement scores and immediate execution commands.

## 📋 Complete Example Workflow

```bash
# Step 1: List videos (July 13-25 example)
mcp__vimeo__vimeo_list_videos(compact: true, per_page: 6, page: 1, sort: "date", direction: "desc")
# Continue with page: 2, 3, 4 until all videos retrieved

# Step 2: For each video, download transcript
mcp__vimeo__vimeo_download_transcript_to_file(
  video_id: "1104516203",
  base_path: "/Users/sangle/Dev/action/projects/mcp-servers/@download/vimeo"
)

# Step 3: Read and analyze transcript
Read(file_path: "/Users/sangle/Dev/action/projects/mcp-servers/@download/vimeo/2025-07-25/transcripts/2025-07-25_new-recording-7252025-113950-am_1104516203.vtt", head: 1000)

# Step 4: Generate viral metadata based on content
# Example output:
Title: "Day 25 - 1M Journey - Coding - Building AI Agents to Automate My Vimeo Workflow"
Description: "🚀 Day 25 of my journey to $1M in revenue/impact..."
Tags: ["1M journey", "vimeo automation", "ai agents", "mcp servers", "claude code", ...]

# Step 5: Create bulk update script
curl -X PATCH "https://api.vimeo.com/videos/1104516203" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 25 - 1M Journey - Coding - Building AI Agents to Automate My Vimeo Workflow",
    "description": "🚀 Day 25 of my journey to $1M in revenue/impact...",
    "tags": ["1M journey", "vimeo automation", "ai agents", "mcp servers", "claude code"]
  }'
```

**🎯 Result**: Videos optimized for viral reach with content-aware titles, engaging descriptions, and strategic tags!

## ⚠️ Important Lessons Learned

### 1. **Day Number Verification**
- **CRITICAL**: Always check the beginning of transcripts for actual day numbers
- The user may skip days, so calendar dates don't always match sequential day numbers
- Example: July 13 = Day 186, July 25 = Day 191 (only 6 day numbers for 13 calendar days)
- **Action**: Download and read first few lines of transcript to find "day [number]" announcement

### 2. **Tag Encoding Issue**
- **Problem**: Vimeo API requires URL encoding for tags with special characters
- **Solution**: Fixed in `vimeo-client.ts` by adding `encodeURIComponent()` to tag paths
- **Code**: `this.makeApiCall("DELETE", \`${path}/${encodeURIComponent(tag.tag)}\`)`

### 3. **Use MCP Tools Directly**
- **Preferred**: Use `mcp__vimeo__vimeo_update_video()` directly instead of bash scripts
- **Benefits**: Better error handling, automatic retries, integrated rate limiting
- **Example**:
  ```
  mcp__vimeo__vimeo_update_video(
    video_id: "1104516203",
    title: "Day 191 - 1M Journey - Coding - Building AI Agents"
  )
  ```

### 4. **Handle Video Not Found Errors**
- Some video IDs may return "The requested video couldn't be found"
- This could be due to privacy settings or deleted videos
- Always verify video exists before attempting updates

### 5. **Description Day Number Consistency**
- **Issue**: Descriptions often contain the old day number in the first line
- **Action**: When updating titles, consider updating descriptions to match
- **Example**: If title says "Day 191", description should also say "Day 191"