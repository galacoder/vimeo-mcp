#!/bin/bash

# Check update status for July 13-25 videos

# Load API token from .env file
export VIMEO_API_TOKEN=$(grep VIMEO_ACCESS_TOKEN .env | cut -d'=' -f2 | tr -d '"' | tr -d "'")

if [ -z "$VIMEO_API_TOKEN" ]; then
    echo "❌ Error: VIMEO_ACCESS_TOKEN not found in .env file"
    exit 1
fi

echo "🔍 Checking update status for recent videos..."
echo "============================================="

# Array of video IDs to check
VIDEO_IDS=(
    "1104516203"  # July 25 - AI Agents
    "1104484316"  # July 25 - 3 AM
    "1104264794"  # July 24 - Backend Cleanup
    "1104214087"  # July 24 - Building in Public
    "1103960799"  # July 23 - ProX Development
    "1103914192"  # July 23 - Zero to MVP
    "1103677766"  # July 22 - $10K Bug
    "1103631967"  # July 22 - Why Entrepreneurs Fail
    "1103399798"  # July 21 - BusinessX
    "1103353618"  # July 21 - Psychology of $1M
    "1103125625"  # July 20 - FinX
    "1103077653"  # July 20 - Power of Saying No
    "1102854491"  # July 19 - AI Integration
    "1102624227"  # July 18 - Scaling to $10K
    "1102164088"  # July 16 - WarriorX
    "1101934331"  # July 15 - Emergency Hotfix
    "1101458498"  # July 13 - Cursor vs Claude
    "1101029338"  # July 13 - First SaaS
)

UPDATE_COUNT=0
TOTAL_COUNT=${#VIDEO_IDS[@]}

for VIDEO_ID in "${VIDEO_IDS[@]}"; do
    # Get video details
    RESPONSE=$(curl -s -X GET "https://api.vimeo.com/videos/$VIDEO_ID" \
        -H "Authorization: Bearer $VIMEO_API_TOKEN" \
        -H "Content-Type: application/json")
    
    # Extract title using jq if available, otherwise use python
    if command -v jq &> /dev/null; then
        TITLE=$(echo "$RESPONSE" | jq -r '.name // empty')
    else
        TITLE=$(echo "$RESPONSE" | python3 -c "import sys, json; data = json.load(sys.stdin); print(data.get('name', ''))")
    fi
    
    # Check if title contains "1M Journey"
    if [[ "$TITLE" == *"1M Journey"* ]]; then
        echo "✅ Updated: $TITLE"
        ((UPDATE_COUNT++))
    else
        echo "❌ Not updated: $TITLE"
    fi
done

echo -e "\n============================================="
echo "📊 Update Summary:"
echo "✅ Updated: $UPDATE_COUNT/$TOTAL_COUNT videos"
echo "❌ Remaining: $((TOTAL_COUNT - UPDATE_COUNT)) videos"

if [ $UPDATE_COUNT -eq $TOTAL_COUNT ]; then
    echo -e "\n🎉 All videos have been successfully updated!"
else
    echo -e "\n⚠️  Some videos still need updating. The script may still be running."
fi