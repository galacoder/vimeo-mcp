#!/bin/bash

# Vimeo Video Bulk Update Script - July 13-25, 2025
# With rate limiting protection (5 second delays)

# Load API token from .env file
export VIMEO_API_TOKEN=$(grep VIMEO_ACCESS_TOKEN .env | cut -d'=' -f2 | tr -d '"' | tr -d "'")

if [ -z "$VIMEO_API_TOKEN" ]; then
    echo "❌ Error: VIMEO_ACCESS_TOKEN not found in .env file"
    exit 1
fi

# Rate limit delay (in seconds)
DELAY=5

echo "🚀 Starting Vimeo video updates with rate limiting..."
echo "⏱️  Delay between updates: ${DELAY} seconds"
echo "================================================"

# Counter for tracking updates
UPDATE_COUNT=0
TOTAL_VIDEOS=20

# Function to update a video with error handling
update_video() {
    local VIDEO_ID=$1
    local TITLE=$2
    local DESCRIPTION=$3
    local TAGS=$4
    
    echo -e "\n📹 Updating video $VIDEO_ID..."
    echo "   Title: $TITLE"
    
    RESPONSE=$(curl -s -w "\n%{http_code}" -X PATCH "https://api.vimeo.com/videos/$VIDEO_ID" \
        -H "Authorization: Bearer $VIMEO_API_TOKEN" \
        -H "Content-Type: application/json" \
        -d "{
            \"name\": \"$TITLE\",
            \"description\": \"$DESCRIPTION\",
            \"privacy\": {\"view\": \"anybody\"},
            \"tags\": $TAGS
        }")
    
    # Extract HTTP status code
    HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
    BODY=$(echo "$RESPONSE" | sed '$d')
    
    if [[ "$HTTP_CODE" == "200" ]]; then
        echo "   ✅ Successfully updated!"
        ((UPDATE_COUNT++))
    else
        echo "   ❌ Failed to update (HTTP $HTTP_CODE)"
        echo "   Response: $BODY"
    fi
    
    # Progress indicator
    echo "   Progress: $UPDATE_COUNT/$TOTAL_VIDEOS updated"
    
    # Rate limiting delay
    if [ $UPDATE_COUNT -lt $TOTAL_VIDEOS ]; then
        echo "   ⏳ Waiting $DELAY seconds before next update..."
        sleep $DELAY
    fi
}

# Start updates
echo -e "\n📅 Processing July 25 videos..."

# July 25 - Video 1: Building AI Agents
update_video "1104516203" \
"Day 195 - 1M Journey - Coding - Building AI Agents to Automate My Vimeo Workflow" \
"🚀 Day 195 of my journey to \$1M in revenue/impact

In this episode:
• Building Vimeo MCP server for video automation
• Creating AI agents to generate viral titles
• Automating metadata optimization workflow
• Real-time API integration demonstration

🔥 What you'll learn:
- How to build MCP servers from scratch
- Vimeo API integration techniques
- AI-powered content optimization
- Automation workflow design patterns

💡 Key timestamps:
00:00 - Introduction to Vimeo automation
05:30 - Setting up MCP server structure
15:45 - Implementing API endpoints
28:20 - Testing AI title generation

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 Drop your automation challenges in the comments

#1MJourney #VimeoAutomation #MCPServers #AIAgents #CodingJourney #StartupLife" \
'["1M journey", "vimeo automation", "mcp servers", "ai agents", "claude code", "api integration", "viral titles", "content optimization", "coding session", "automation workflow"]'

# July 25 - Video 2: 3 AM Morning Routine
update_video "1104484316" \
"Day 195 - 1M Journey - Motivation - Why I Wake Up at 3 AM (The \$1M Morning Routine)" \
"🚀 Day 195 of my journey to \$1M in revenue/impact

In this episode:
• The power of 3 AM wake-ups for entrepreneurs
• My exact morning routine for maximum productivity
• Why early mornings = competitive advantage
• The psychology behind successful morning habits

🔥 What you'll learn:
- How to build an unstoppable morning routine
- The 3 AM advantage for business growth
- Productivity hacks that actually work
- Mental frameworks for early rising

💡 Key moments:
00:00 - Why 3 AM changes everything
02:30 - My exact morning routine breakdown
05:00 - The competitive edge of early rising
08:00 - How to make it sustainable

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 Share your morning routine in the comments

#1MJourney #MorningRoutine #3AMClub #Entrepreneurship #ProductivityHacks #MillionDollarHabits" \
'["1M journey", "morning routine", "3am club", "productivity", "entrepreneur mindset", "success habits", "motivation", "daily routine", "business growth", "competitive advantage"]'

echo -e "\n📅 Processing July 24 videos..."

# July 24 - Video 1: Backend Cleanup Sprint
update_video "1104264794" \
"Day 194 - 1M Journey - MoCo - Backend Cleanup Sprint: From Chaos to Clean Architecture" \
"🚀 Day 194 of my journey to \$1M in revenue/impact

In this episode:
• Strategic backend cleanup and refactoring
• Project planning and architecture decisions
• Balancing technical debt with feature development
• Real coding session with live problem-solving

🔥 What you'll learn:
- When and how to tackle technical debt
- Clean architecture principles in practice
- Sprint planning for maximum efficiency
- Backend optimization strategies

💡 Key timestamps:
00:00 - Assessing the backend chaos
10:00 - Planning the cleanup sprint
20:00 - Refactoring in action
35:00 - Architecture improvements

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 Share your cleanup war stories below

#1MJourney #BackendDevelopment #CleanCode #TechnicalDebt #SprintPlanning #CodingJourney" \
'["1M journey", "backend cleanup", "technical debt", "clean architecture", "sprint planning", "refactoring", "coding session", "project management", "software architecture", "development strategy"]'

# July 24 - Video 2: Building in Public
update_video "1104214087" \
"Day 194 - 1M Journey - Motivation - The Reality of Building in Public (Raw Truth)" \
"🚀 Day 194 of my journey to \$1M in revenue/impact

In this episode:
• The unfiltered truth about building in public
• Dealing with criticism and self-doubt
• Why transparency accelerates growth
• Lessons from 194 days of daily content

🔥 What you'll learn:
- How to handle public failures gracefully
- The compound effect of daily documentation
- Building an authentic personal brand
- Turning vulnerability into strength

💡 Real talk moments:
00:00 - Why building in public is hard
05:00 - Dealing with imposter syndrome
10:00 - The unexpected benefits
15:00 - My biggest lessons so far

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 Share your building in public experience

#1MJourney #BuildInPublic #Entrepreneurship #PersonalBrand #StartupJourney #Authenticity" \
'["1M journey", "build in public", "entrepreneurship", "personal brand", "startup journey", "authenticity", "content creation", "vulnerability", "growth mindset", "daily documentation"]'

echo -e "\n📅 Processing July 23 videos..."

# July 23 - Video 1: ProX Development
update_video "1103960799" \
"Day 193 - 1M Journey - Coding - ProX Development: The Feature That Changes Everything" \
"🚀 Day 193 of my journey to \$1M in revenue/impact

In this episode:
• Deep dive into ProX project development
• Building the game-changing feature
• Live coding with real-time decisions
• Breakthrough moment at 1:47:35

🔥 What you'll learn:
- Advanced feature implementation strategies
- How to identify game-changing features
- Real-time problem-solving techniques
- ProX architecture insights

💡 Key timestamps:
00:00 - ProX project overview
30:00 - Feature planning and design
1:00:00 - Implementation challenges
1:47:35 - The breakthrough moment

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 What's your game-changing feature?

#1MJourney #ProX #FeatureDevelopment #CodingSession #StartupDevelopment #GameChanger" \
'["1M journey", "ProX", "feature development", "coding session", "breakthrough", "software development", "startup", "game changer", "live coding", "project development"]'

# July 23 - Video 2: Zero to MVP
update_video "1103914192" \
"Day 193 - 1M Journey - MoCo - From Zero to MVP in Record Time (Live Build)" \
"🚀 Day 193 of my journey to \$1M in revenue/impact

In this episode:
• Speed-building an MVP from scratch
• Strategic shortcuts that actually work
• Balancing speed with quality
• The 80/20 rule in action

🔥 What you'll learn:
- MVP development strategies
- Time-saving coding techniques
- When to cut corners (and when not to)
- Rapid prototyping methods

💡 Key timestamps:
00:00 - MVP planning phase
15:00 - Core feature implementation
45:00 - Speed optimization tricks
1:00:00 - Testing and deployment

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 Share your fastest MVP build time

#1MJourney #MVP #RapidDevelopment #StartupSpeed #CodingProductivity #LiveBuild" \
'["1M journey", "MVP development", "rapid prototyping", "startup speed", "coding productivity", "live build", "80/20 rule", "time management", "efficient coding", "product development"]'

echo -e "\n📅 Processing July 22 videos..."

# July 22 - Video 1: $10K Bug
update_video "1103677766" \
"Day 192 - 1M Journey - Coding - The \$10K Bug That Almost Killed My Startup" \
"🚀 Day 192 of my journey to \$1M in revenue/impact

In this episode:
• Discovering a critical \$10K bug in production
• The debugging process that saved the day
• Lessons learned from near-disaster
• Building better error handling systems

🔥 What you'll learn:
- How to debug critical production issues
- The true cost of bugs in business
- Preventive measures that actually work
- Crisis management for developers

💡 Key timestamps:
00:00 - The moment I found the bug
20:00 - Tracing the root cause
40:00 - Implementing the fix
55:00 - Lessons and prevention strategies

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 Share your worst bug story below

#1MJourney #Debugging #StartupLessons #CriticalBug #ProductionIssues #CrisisManagement" \
'["1M journey", "debugging", "critical bug", "production issues", "startup lessons", "crisis management", "error handling", "software development", "bug fixing", "developer stories"]'

# July 22 - Video 2: Why Entrepreneurs Fail
update_video "1103631967" \
"Day 192 - 1M Journey - Motivation - Why Most Entrepreneurs Fail (And How Not To)" \
"🚀 Day 192 of my journey to \$1M in revenue/impact

In this episode:
• The harsh truth about entrepreneurial failure
• Common pitfalls I've avoided (and some I haven't)
• Building resilience through daily execution
• The mindset shift that changes everything

🔥 What you'll learn:
- Top 5 reasons entrepreneurs fail
- How to build unshakeable resilience
- The power of consistent daily action
- Mental frameworks for long-term success

💡 Key insights:
00:00 - The failure statistics nobody talks about
10:00 - My personal failure stories
20:00 - The resilience framework
30:00 - Daily habits that prevent failure

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 What's your biggest entrepreneurial challenge?

#1MJourney #EntrepreneurMindset #FailureToSuccess #Resilience #StartupLessons #SuccessMindset" \
'["1M journey", "entrepreneur mindset", "failure analysis", "resilience", "success strategies", "startup lessons", "daily execution", "mental frameworks", "business mindset", "entrepreneurship"]'

echo -e "\n📅 Processing July 21 videos..."

# July 21 - Video 1: BusinessX Platform
update_video "1103399798" \
"Day 191 - 1M Journey - Coding - Building BusinessX: The All-in-One Business Platform" \
"🚀 Day 191 of my journey to \$1M in revenue/impact

In this episode:
• Introducing BusinessX - the ultimate business platform
• Live architecture design and implementation
• Building scalable multi-tenant systems
• Integration strategies for business tools

🔥 What you'll learn:
- How to design all-in-one platforms
- Multi-tenant architecture patterns
- Business tool integration strategies
- Scalable system design principles

💡 Key timestamps:
00:00 - BusinessX vision and planning
25:00 - Architecture design session
50:00 - Core module implementation
1:15:00 - Integration framework setup

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 What business tools do you need integrated?

#1MJourney #BusinessX #PlatformDevelopment #SaaS #BusinessAutomation #CodingSession" \
'["1M journey", "BusinessX", "platform development", "SaaS", "business automation", "multi-tenant", "architecture design", "system integration", "scalable systems", "startup development"]'

# July 21 - Video 2: Psychology of $1M
update_video "1103353618" \
"Day 191 - 1M Journey - MoCo - The Psychology of \$1M: Rewiring Your Money Mindset" \
"🚀 Day 191 of my journey to \$1M in revenue/impact

In this episode:
• Deep dive into millionaire psychology
• Breaking limiting beliefs about money
• Practical mindset shifts that create wealth
• My personal money mindset transformation

🔥 What you'll learn:
- How to identify and break money blocks
- The millionaire mindset framework
- Abundance vs scarcity thinking
- Daily practices for wealth consciousness

💡 Key breakthroughs:
00:00 - My old money stories
15:00 - The psychology of wealth
30:00 - Breaking the employee mindset
45:00 - Daily wealth practices

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 What's your biggest money block?

#1MJourney #MoneyMindset #WealthPsychology #MillionaireMindset #Abundance #PersonalDevelopment" \
'["1M journey", "money mindset", "wealth psychology", "millionaire mindset", "abundance thinking", "personal development", "limiting beliefs", "financial freedom", "mindset shift", "entrepreneur psychology"]'

echo -e "\n📅 Processing July 20 videos..."

# July 20 - Video 1: FinX Development
update_video "1103125625" \
"Day 190 - 1M Journey - Coding - FinX Development: Building the Future of Finance" \
"🚀 Day 190 of my journey to \$1M in revenue/impact

In this episode:
• Deep dive into FinX financial platform
• Implementing secure payment systems
• Real-time transaction processing
• Building trust in fintech applications

🔥 What you'll learn:
- Fintech development best practices
- Payment gateway integration
- Security considerations for financial apps
- Compliance and regulatory basics

💡 Key timestamps:
00:00 - FinX project overview
20:00 - Payment system architecture
45:00 - Security implementation
1:10:00 - Testing financial transactions

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 What fintech features do you need?

#1MJourney #FinX #Fintech #PaymentSystems #FinancialTechnology #SecureCoding" \
'["1M journey", "FinX", "fintech", "payment systems", "financial technology", "secure coding", "transaction processing", "financial platform", "startup development", "security"]'

# July 20 - Video 2: Power of Saying No
update_video "1103077653" \
"Day 190 - 1M Journey - Motivation - The Power of Saying No (How It 10Xed My Growth)" \
"🚀 Day 190 of my journey to \$1M in revenue/impact

In this episode:
• Why saying no is your superpower
• How I 10Xed my growth by focusing
• The opportunities I turned down (and why)
• Building a not-to-do list

🔥 What you'll learn:
- The art of strategic rejection
- How to identify high-leverage activities
- Creating filters for opportunities
- The compound effect of focus

💡 Key insights:
00:00 - The cost of saying yes to everything
10:00 - My decision framework
20:00 - Real examples of saying no
30:00 - The 10X growth results

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 What do you need to say no to?

#1MJourney #Focus #ProductivityHacks #SayingNo #10XGrowth #EntrepreneurFocus" \
'["1M journey", "saying no", "focus", "productivity", "10x growth", "entrepreneur focus", "strategic decisions", "time management", "growth hacking", "success strategies"]'

echo -e "\n📅 Processing July 19 videos..."

# July 19 - AI Integration Marathon
update_video "1102854491" \
"Day 189 - 1M Journey - Coding - AI Integration Marathon: Making My App Genius-Level Smart" \
"🚀 Day 189 of my journey to \$1M in revenue/impact

In this episode:
• Marathon AI integration session
• Building genius-level features with AI
• Real-time implementation and testing
• The future of AI-powered applications

🔥 What you'll learn:
- Advanced AI integration techniques
- Prompt engineering for production
- Building intelligent user experiences
- AI performance optimization

💡 Key timestamps:
00:00 - AI integration planning
30:00 - Implementing core AI features
1:00:00 - Advanced prompt engineering
1:30:00 - Testing AI responses

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 How are you using AI in your projects?

#1MJourney #AIIntegration #ArtificialIntelligence #SmartApps #CodingMarathon #FutureOfCode" \
'["1M journey", "AI integration", "artificial intelligence", "smart applications", "prompt engineering", "coding marathon", "AI features", "intelligent apps", "future tech", "development session"]'

echo -e "\n📅 Processing July 18 videos..."

# July 18 - Scaling to $10K/Month
update_video "1102624227" \
"Day 188 - 1M Journey - MoCo - Scaling from \$0 to \$10K/Month (The Exact Blueprint)" \
"🚀 Day 188 of my journey to \$1M in revenue/impact

In this episode:
• The exact blueprint I used to hit \$10K/month
• Breaking down revenue streams and strategies
• What worked, what failed, and why
• The mindset shifts required for scaling

🔥 What you'll learn:
- Step-by-step scaling strategies
- Revenue stream diversification
- Pricing strategies that convert
- The psychology of scaling

💡 Revenue breakdown:
00:00 - My journey from \$0 to \$10K
15:00 - Revenue stream analysis
30:00 - The exact blueprint
45:00 - Scaling beyond \$10K

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 What's your revenue goal?

#1MJourney #RevenueGrowth #10KMonth #ScalingBusiness #EntrepreneurBlueprint #MonthlyRecurring" \
'["1M journey", "revenue growth", "10k month", "scaling business", "entrepreneur blueprint", "monthly recurring", "business strategy", "income streams", "growth strategy", "success blueprint"]'

echo -e "\n📅 Processing July 16 videos..."

# July 16 - WarriorX Project
update_video "1102164088" \
"Day 186 - 1M Journey - Coding - WarriorX Project: Building Tools for Digital Warriors" \
"🚀 Day 186 of my journey to \$1M in revenue/impact

In this episode:
• Introducing WarriorX - tools for digital warriors
• Building productivity and focus applications
• The intersection of mindset and technology
• Creating tools that enhance performance

🔥 What you'll learn:
- Building productivity-focused applications
- User psychology in tool design
- Performance optimization strategies
- The WarriorX philosophy

💡 Key timestamps:
00:00 - WarriorX project introduction
20:00 - Core feature development
45:00 - Performance tracking systems
1:00:00 - User experience optimization

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 What tools help you perform better?

#1MJourney #WarriorX #ProductivityTools #DigitalWarrior #PerformanceApps #FocusTools" \
'["1M journey", "WarriorX", "productivity tools", "digital warrior", "performance apps", "focus tools", "mindset technology", "tool development", "user psychology", "startup project"]'

echo -e "\n📅 Processing July 15 videos..."

# July 15 - Emergency Hotfix
update_video "1101934331" \
"Day 185 - 1M Journey - Coding - Emergency Hotfix: When Production Goes Down at 2 AM" \
"🚀 Day 185 of my journey to \$1M in revenue/impact

In this episode:
• Real emergency production hotfix
• Debugging under extreme pressure
• The 2 AM crisis management playbook
• Lessons from production failures

🔥 What you'll learn:
- Emergency response procedures
- Debugging production issues fast
- Staying calm under pressure
- Post-mortem best practices

💡 Critical moments:
00:00 - The alert that woke me up
10:00 - Diagnosing the issue
25:00 - Implementing the hotfix
35:00 - Lessons learned

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 Share your production horror stories

#1MJourney #ProductionDown #EmergencyFix #Hotfix #CrisisManagement #DevOpsLife" \
'["1M journey", "production emergency", "hotfix", "crisis management", "debugging", "devops", "2am coding", "emergency response", "production issues", "lessons learned"]'

echo -e "\n📅 Processing July 13 videos..."

# July 13 - Video 1: Cursor vs Claude Code
update_video "1101458498" \
"Day 183 - 1M Journey - MoCo - Why I Ditched Cursor for Claude Code (Real Numbers Inside)" \
"🚀 Day 183 of my journey to \$1M in revenue/impact

In this episode:
• The \$160 Cursor subscription that disappointed
• Why I switched to Claude Code at \$250
• Real performance comparisons and metrics
• The tool that actually delivers value

🔥 What you'll learn:
- Honest tool comparison with real data
- Why expensive doesn't mean worse
- The true cost of developer productivity
- Making data-driven tool decisions

💡 Key comparisons:
00:00 - My Cursor frustrations
10:00 - Discovering Claude Code
20:00 - Side-by-side performance
30:00 - The ROI calculation

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 What's your favorite dev tool?

#1MJourney #ClaudeCode #CursorIDE #DeveloperTools #ToolComparison #ProductivityTools" \
'["1M journey", "claude code", "cursor ide", "tool comparison", "developer tools", "productivity", "real numbers", "tool review", "ide comparison", "developer productivity"]'

# July 13 - Video 2: First SaaS Development
update_video "1101029338" \
"Day 183 - 1M Journey - Coding - Building My First SaaS: Live Development Session" \
"🚀 Day 183 of my journey to \$1M in revenue/impact

In this episode:
• Starting my first SaaS product from scratch
• Live architecture and development decisions
• Building with monetization in mind
• The path from idea to revenue

🔥 What you'll learn:
- SaaS architecture fundamentals
- MVP feature prioritization
- Building for early revenue
- Technical stack decisions

💡 Key timestamps:
00:00 - SaaS idea validation
15:00 - Architecture planning
30:00 - Core feature development
45:00 - Payment integration setup

🏆 Join the 1M Journey community
👉 Subscribe for daily updates
💬 What SaaS are you building?

#1MJourney #SaaSDevelopment #FirstSaaS #LiveCoding #StartupDevelopment #MVPBuilding" \
'["1M journey", "saas development", "first saas", "live coding", "mvp building", "startup development", "architecture planning", "payment integration", "product development", "revenue focused"]'

# Final summary
echo -e "\n================================================"
echo "✅ Bulk update script completed!"
echo "📊 Attempted to update: $TOTAL_VIDEOS videos"
echo "⏱️  Total time: ~$(($TOTAL_VIDEOS * $DELAY / 60)) minutes"
echo -e "\n💡 Next steps:"
echo "1. Run ./check_update_status.sh to verify all updates"
echo "2. Check your Vimeo dashboard for changes"
echo "3. Monitor view counts and engagement"
echo "4. Share videos with new viral titles!"
echo -e "\n🎯 Remember: Consistency + viral metadata = growth!"