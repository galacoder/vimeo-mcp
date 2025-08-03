# Vimeo MCP Server Setup Guide

## Prerequisites

1. **Node.js**: Version 18 or higher
2. **Vimeo Developer Account**: With API access
3. **Claude Desktop** or **Claude Code**: For MCP integration

## Step 1: Get Vimeo API Credentials

### Option A: Personal Access Token (Recommended)

1. Go to [Vimeo Developer Settings](https://developer.vimeo.com/apps)
2. Create a new app or use an existing one
3. Generate a Personal Access Token with these scopes:
   - `private` - Access private videos
   - `edit` - Edit video metadata
   - `upload` - Upload transcripts
   - `stats` - View video statistics

### Option B: OAuth2 Application

1. Create a Vimeo app at [Vimeo Developer Portal](https://developer.vimeo.com/apps)
2. Note your Client ID and Client Secret
3. Set up OAuth2 flow (more complex, recommended for production apps)

## Step 2: Install Dependencies

```bash
cd vimeo-mcp
npm install
npm run build
```

## Step 3: Set Environment Variables

### For Personal Access Token:
```bash
export VIMEO_ACCESS_TOKEN="your_access_token_here"
```

### For OAuth2:
```bash
export VIMEO_CLIENT_ID="your_client_id"
export VIMEO_CLIENT_SECRET="your_client_secret"
```

## Step 4: Configure Claude Desktop

Add to your Claude Desktop configuration file:

**macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
**Windows**: `%APPDATA%\Claude\claude_desktop_config.json`

```json
{
  "mcpServers": {
    "vimeo": {
      "command": "node",
      "args": ["/absolute/path/to/vimeo-mcp/dist/index.js"],
      "env": {
        "VIMEO_ACCESS_TOKEN": "your_access_token_here"
      }
    }
  }
}
```

## Step 5: Test the Setup

### Health Check
Once configured, you can test the connection:
```
Use the vimeo_health_check tool to verify server status
```

This will return:
- Server information
- Credential status
- Connection status
- Timestamp

### Basic Operations
Try these operations to confirm everything works:
```
List my recent videos
Get details for video [video_id]
Check server health
```

## File Storage Configuration

The server now uses relative paths by default:
- Default download path: `./downloads/vimeo`
- Files are organized by date: `./downloads/vimeo/2024-01-15/`
- Transcripts saved in: `transcripts/` subfolder
- Analysis files in: `suggestions/` subfolder

## Troubleshooting

### Common Issues:

1. **"Vimeo credentials not configured"**
   - Ensure environment variables are set correctly
   - Check that the access token has proper scopes

2. **"Connection failed"**
   - Verify your access token is valid and not expired
   - Check your internet connection
   - Confirm Vimeo API is accessible

3. **"Permission denied"**
   - Ensure your access token has the required scopes
   - Check that you have access to the requested videos

4. **File save errors**
   - Ensure the download directory exists and is writable
   - Check available disk space

### Debug Mode:
Run with debug logging:
```bash
DEBUG=vimeo* node dist/index.js
```

## Available Tools

- `vimeo_health_check` - Server health and connectivity check
- `vimeo_list_videos` - List videos with filtering options
- `vimeo_list_videos_minimal` - Minimal video listing (token-optimized)
- `vimeo_get_video_details` - Get detailed video information
- `vimeo_update_video` - Update video metadata
- `vimeo_download_transcript` - Download video transcripts
- `vimeo_upload_transcript` - Upload new transcripts
- `vimeo_download_transcript_to_file` - Save transcripts to files
- `vimeo_generate_content_analysis` - Generate content analysis reports
- `vimeo_validate_video` - Validate video (for screen recordings)

## Advanced Configuration

### Custom Download Paths
You can override the default download path by setting the `base_path` parameter in tools that support it.

### Rate Limiting
The server automatically handles Vimeo's rate limits and will provide retry information when limits are hit.

### Token Optimization
Use `compact: true` mode for video listings to reduce token usage and prevent overflow.

## Support

For issues specific to this MCP server, check:
1. Environment variables are correctly set
2. Access token permissions and expiration
3. Network connectivity to Vimeo API
4. File system permissions for downloads

For Vimeo API issues, refer to the [official documentation](https://developer.vimeo.com/api/reference).