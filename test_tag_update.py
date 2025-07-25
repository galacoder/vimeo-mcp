#!/usr/bin/env python3

import asyncio
import sys
import os
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

async def test_tag_update():
    """Test updating tags using the MCP tool directly"""
    
    # Test video (July 25 AI Agents video)
    video_id = "1104516203"
    test_tags = [
        "1M journey",
        "vimeo automation", 
        "mcp servers",
        "ai agents",
        "claude code",
        "api integration",
        "viral titles",
        "content optimization",
        "coding session",
        "automation workflow"
    ]
    
    print(f"🧪 Testing tag update for video {video_id}")
    print(f"📏 Tags to add: {test_tags}")
    
    # Import after sys.path modification
    try:
        # Use subprocess to call the MCP server directly
        import subprocess
        import json
        
        # Create the MCP request
        request = {
            "jsonrpc": "2.0",
            "method": "tools/call",
            "params": {
                "name": "vimeo_update_video",
                "arguments": {
                    "video_id": video_id,
                    "tags": test_tags
                }
            },
            "id": 1
        }
        
        # Run the MCP server with the request
        env = os.environ.copy()
        
        # Execute using node directly
        process = subprocess.Popen(
            ["node", "dist/index.js"],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            env=env,
            text=True
        )
        
        # Send request and get response
        stdout, stderr = process.communicate(input=json.dumps(request))
        
        if stderr:
            print(f"❌ Error output: {stderr}")
        
        if stdout:
            print(f"✅ Response: {stdout}")
            
    except Exception as e:
        print(f"❌ Test failed: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    asyncio.run(test_tag_update())