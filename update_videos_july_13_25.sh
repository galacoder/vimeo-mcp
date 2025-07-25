#!/bin/bash

# Vimeo Video Bulk Update Script - July 13-25, 2025
# Generated viral titles and optimized metadata

# Load API token from .env file
export VIMEO_API_TOKEN=$(grep VIMEO_ACCESS_TOKEN .env | cut -d'=' -f2 | tr -d '"' | tr -d "'")

if [ -z "$VIMEO_API_TOKEN" ]; then
    echo "❌ Error: VIMEO_ACCESS_TOKEN not found in .env file"
    exit 1
fi

echo "🚀 Starting Vimeo video updates for July 13-25..."
echo "================================================"

# July 25, 2025 - Videos
echo "📅 Updating July 25 videos..."

# Video 1: Building AI Agents to Automate My Vimeo Workflow
curl -X PATCH "https://api.vimeo.com/videos/1104516203" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 195 - 1M Journey - Coding - Building AI Agents to Automate My Vimeo Workflow",
    "description": "🚀 Day 195 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Building Vimeo MCP server for video automation\n• Creating AI agents to generate viral titles\n• Automating metadata optimization workflow\n• Real-time API integration demonstration\n\n🔥 What you'\''ll learn:\n- How to build MCP servers from scratch\n- Vimeo API integration techniques\n- AI-powered content optimization\n- Automation workflow design patterns\n\n💡 Key timestamps:\n00:00 - Introduction to Vimeo automation\n05:30 - Setting up MCP server structure\n15:45 - Implementing API endpoints\n28:20 - Testing AI title generation\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 Drop your automation challenges in the comments\n\n#1MJourney #VimeoAutomation #MCPServers #AIAgents #CodingJourney #StartupLife",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "vimeo automation", "mcp servers", "ai agents", "claude code", "api integration", "viral titles", "content optimization", "coding session", "automation workflow"]
  }'
echo "✅ Updated: Building AI Agents video"
echo "⏳ Waiting 5 seconds before next update..."
sleep 5

# Video 2: Why I Wake Up at 3 AM
curl -X PATCH "https://api.vimeo.com/videos/1104484316" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 195 - 1M Journey - Motivation - Why I Wake Up at 3 AM (The $1M Morning Routine)",
    "description": "🚀 Day 195 of my journey to $1M in revenue/impact\n\nIn this episode:\n• The power of 3 AM wake-ups for entrepreneurs\n• My exact morning routine for maximum productivity\n• Why early mornings = competitive advantage\n• The psychology behind successful morning habits\n\n🔥 What you'\''ll learn:\n- How to build an unstoppable morning routine\n- The 3 AM advantage for business growth\n- Productivity hacks that actually work\n- Mental frameworks for early rising\n\n💡 Key moments:\n00:00 - Why 3 AM changes everything\n02:30 - My exact morning routine breakdown\n05:00 - The competitive edge of early rising\n08:00 - How to make it sustainable\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 Share your morning routine in the comments\n\n#1MJourney #MorningRoutine #3AMClub #Entrepreneurship #ProductivityHacks #MillionDollarHabits",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "morning routine", "3am club", "productivity", "entrepreneur mindset", "success habits", "motivation", "daily routine", "business growth", "competitive advantage"]
  }'
echo "✅ Updated: 3 AM Morning Routine video"

# July 24, 2025 - Videos
echo -e "\n📅 Updating July 24 videos..."

# Video 1: Backend Cleanup Sprint
curl -X PATCH "https://api.vimeo.com/videos/1104264794" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 194 - 1M Journey - MoCo - Backend Cleanup Sprint: From Chaos to Clean Architecture",
    "description": "🚀 Day 194 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Strategic backend cleanup and refactoring\n• Project planning and architecture decisions\n• Balancing technical debt with feature development\n• Real coding session with live problem-solving\n\n🔥 What you'\''ll learn:\n- When and how to tackle technical debt\n- Clean architecture principles in practice\n- Sprint planning for maximum efficiency\n- Backend optimization strategies\n\n💡 Key timestamps:\n00:00 - Assessing the backend chaos\n10:00 - Planning the cleanup sprint\n20:00 - Refactoring in action\n35:00 - Architecture improvements\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 Share your cleanup war stories below\n\n#1MJourney #BackendDevelopment #CleanCode #TechnicalDebt #SprintPlanning #CodingJourney",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "backend cleanup", "technical debt", "clean architecture", "sprint planning", "refactoring", "coding session", "project management", "software architecture", "development strategy"]
  }'
echo "✅ Updated: Backend Cleanup Sprint video"

# Video 2: The Reality of Building in Public
curl -X PATCH "https://api.vimeo.com/videos/1104214087" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 194 - 1M Journey - Motivation - The Reality of Building in Public (Raw Truth)",
    "description": "🚀 Day 194 of my journey to $1M in revenue/impact\n\nIn this episode:\n• The unfiltered truth about building in public\n• Dealing with criticism and self-doubt\n• Why transparency accelerates growth\n• Lessons from 194 days of daily content\n\n🔥 What you'\''ll learn:\n- How to handle public failures gracefully\n- The compound effect of daily documentation\n- Building an authentic personal brand\n- Turning vulnerability into strength\n\n💡 Real talk moments:\n00:00 - Why building in public is hard\n05:00 - Dealing with imposter syndrome\n10:00 - The unexpected benefits\n15:00 - My biggest lessons so far\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 Share your building in public experience\n\n#1MJourney #BuildInPublic #Entrepreneurship #PersonalBrand #StartupJourney #Authenticity",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "build in public", "entrepreneurship", "personal brand", "startup journey", "authenticity", "content creation", "vulnerability", "growth mindset", "daily documentation"]
  }'
echo "✅ Updated: Building in Public video"

# July 23, 2025 - Videos
echo -e "\n📅 Updating July 23 videos..."

# Video 1: ProX Development Session
curl -X PATCH "https://api.vimeo.com/videos/1103960799" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 193 - 1M Journey - Coding - ProX Development: The Feature That Changes Everything",
    "description": "🚀 Day 193 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Deep dive into ProX project development\n• Building the game-changing feature\n• Live coding with real-time decisions\n• Breakthrough moment at 1:47:35\n\n🔥 What you'\''ll learn:\n- Advanced feature implementation strategies\n- How to identify game-changing features\n- Real-time problem-solving techniques\n- ProX architecture insights\n\n💡 Key timestamps:\n00:00 - ProX project overview\n30:00 - Feature planning and design\n1:00:00 - Implementation challenges\n1:47:35 - The breakthrough moment\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 What'\''s your game-changing feature?\n\n#1MJourney #ProX #FeatureDevelopment #CodingSession #StartupDevelopment #GameChanger",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "ProX", "feature development", "coding session", "breakthrough", "software development", "startup", "game changer", "live coding", "project development"]
  }'
echo "✅ Updated: ProX Development video"

# Video 2: From Zero to MVP in Record Time
curl -X PATCH "https://api.vimeo.com/videos/1103914192" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 193 - 1M Journey - MoCo - From Zero to MVP in Record Time (Live Build)",
    "description": "🚀 Day 193 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Speed-building an MVP from scratch\n• Strategic shortcuts that actually work\n• Balancing speed with quality\n• The 80/20 rule in action\n\n🔥 What you'\''ll learn:\n- MVP development strategies\n- Time-saving coding techniques\n- When to cut corners (and when not to)\n- Rapid prototyping methods\n\n💡 Key timestamps:\n00:00 - MVP planning phase\n15:00 - Core feature implementation\n45:00 - Speed optimization tricks\n1:00:00 - Testing and deployment\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 Share your fastest MVP build time\n\n#1MJourney #MVP #RapidDevelopment #StartupSpeed #CodingProductivity #LiveBuild",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "MVP development", "rapid prototyping", "startup speed", "coding productivity", "live build", "80/20 rule", "time management", "efficient coding", "product development"]
  }'
echo "✅ Updated: Zero to MVP video"

# Continue with remaining days...
# July 22, 2025
echo -e "\n📅 Updating July 22 videos..."

curl -X PATCH "https://api.vimeo.com/videos/1103677766" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 192 - 1M Journey - Coding - The $10K Bug That Almost Killed My Startup",
    "description": "🚀 Day 192 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Discovering a critical $10K bug in production\n• The debugging process that saved the day\n• Lessons learned from near-disaster\n• Building better error handling systems\n\n🔥 What you'\''ll learn:\n- How to debug critical production issues\n- The true cost of bugs in business\n- Preventive measures that actually work\n- Crisis management for developers\n\n💡 Key timestamps:\n00:00 - The moment I found the bug\n20:00 - Tracing the root cause\n40:00 - Implementing the fix\n55:00 - Lessons and prevention strategies\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 Share your worst bug story below\n\n#1MJourney #Debugging #StartupLessons #CriticalBug #ProductionIssues #CrisisManagement",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "debugging", "critical bug", "production issues", "startup lessons", "crisis management", "error handling", "software development", "bug fixing", "developer stories"]
  }'
echo "✅ Updated: $10K Bug video"

curl -X PATCH "https://api.vimeo.com/videos/1103631967" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 192 - 1M Journey - Motivation - Why Most Entrepreneurs Fail (And How Not To)",
    "description": "🚀 Day 192 of my journey to $1M in revenue/impact\n\nIn this episode:\n• The harsh truth about entrepreneurial failure\n• Common pitfalls I'\''ve avoided (and some I haven'\''t)\n• Building resilience through daily execution\n• The mindset shift that changes everything\n\n🔥 What you'\''ll learn:\n- Top 5 reasons entrepreneurs fail\n- How to build unshakeable resilience\n- The power of consistent daily action\n- Mental frameworks for long-term success\n\n💡 Key insights:\n00:00 - The failure statistics nobody talks about\n10:00 - My personal failure stories\n20:00 - The resilience framework\n30:00 - Daily habits that prevent failure\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 What'\''s your biggest entrepreneurial challenge?\n\n#1MJourney #EntrepreneurMindset #FailureToSuccess #Resilience #StartupLessons #SuccessMindset",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "entrepreneur mindset", "failure analysis", "resilience", "success strategies", "startup lessons", "daily execution", "mental frameworks", "business mindset", "entrepreneurship"]
  }'
echo "✅ Updated: Why Entrepreneurs Fail video"

# July 21, 2025
echo -e "\n📅 Updating July 21 videos..."

curl -X PATCH "https://api.vimeo.com/videos/1103399798" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 191 - 1M Journey - Coding - Building BusinessX: The All-in-One Business Platform",
    "description": "🚀 Day 191 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Introducing BusinessX - the ultimate business platform\n• Live architecture design and implementation\n• Building scalable multi-tenant systems\n• Integration strategies for business tools\n\n🔥 What you'\''ll learn:\n- How to design all-in-one platforms\n- Multi-tenant architecture patterns\n- Business tool integration strategies\n- Scalable system design principles\n\n💡 Key timestamps:\n00:00 - BusinessX vision and planning\n25:00 - Architecture design session\n50:00 - Core module implementation\n1:15:00 - Integration framework setup\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 What business tools do you need integrated?\n\n#1MJourney #BusinessX #PlatformDevelopment #SaaS #BusinessAutomation #CodingSession",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "BusinessX", "platform development", "SaaS", "business automation", "multi-tenant", "architecture design", "system integration", "scalable systems", "startup development"]
  }'
echo "✅ Updated: BusinessX Platform video"

curl -X PATCH "https://api.vimeo.com/videos/1103353618" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 191 - 1M Journey - MoCo - The Psychology of $1M: Rewiring Your Money Mindset",
    "description": "🚀 Day 191 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Deep dive into millionaire psychology\n• Breaking limiting beliefs about money\n• Practical mindset shifts that create wealth\n• My personal money mindset transformation\n\n🔥 What you'\''ll learn:\n- How to identify and break money blocks\n- The millionaire mindset framework\n- Abundance vs scarcity thinking\n- Daily practices for wealth consciousness\n\n💡 Key breakthroughs:\n00:00 - My old money stories\n15:00 - The psychology of wealth\n30:00 - Breaking the employee mindset\n45:00 - Daily wealth practices\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 What'\''s your biggest money block?\n\n#1MJourney #MoneyMindset #WealthPsychology #MillionaireMindset #Abundance #PersonalDevelopment",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "money mindset", "wealth psychology", "millionaire mindset", "abundance thinking", "personal development", "limiting beliefs", "financial freedom", "mindset shift", "entrepreneur psychology"]
  }'
echo "✅ Updated: Psychology of $1M video"

# July 20, 2025
echo -e "\n📅 Updating July 20 videos..."

curl -X PATCH "https://api.vimeo.com/videos/1103125625" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 190 - 1M Journey - Coding - FinX Development: Building the Future of Finance",
    "description": "🚀 Day 190 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Deep dive into FinX financial platform\n• Implementing secure payment systems\n• Real-time transaction processing\n• Building trust in fintech applications\n\n🔥 What you'\''ll learn:\n- Fintech development best practices\n- Payment gateway integration\n- Security considerations for financial apps\n- Compliance and regulatory basics\n\n💡 Key timestamps:\n00:00 - FinX project overview\n20:00 - Payment system architecture\n45:00 - Security implementation\n1:10:00 - Testing financial transactions\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 What fintech features do you need?\n\n#1MJourney #FinX #Fintech #PaymentSystems #FinancialTechnology #SecureCoding",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "FinX", "fintech", "payment systems", "financial technology", "secure coding", "transaction processing", "financial platform", "startup development", "security"]
  }'
echo "✅ Updated: FinX Development video"

curl -X PATCH "https://api.vimeo.com/videos/1103077653" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 190 - 1M Journey - Motivation - The Power of Saying No (How It 10Xed My Growth)",
    "description": "🚀 Day 190 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Why saying no is your superpower\n• How I 10Xed my growth by focusing\n• The opportunities I turned down (and why)\n• Building a not-to-do list\n\n🔥 What you'\''ll learn:\n- The art of strategic rejection\n- How to identify high-leverage activities\n- Creating filters for opportunities\n- The compound effect of focus\n\n💡 Key insights:\n00:00 - The cost of saying yes to everything\n10:00 - My decision framework\n20:00 - Real examples of saying no\n30:00 - The 10X growth results\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 What do you need to say no to?\n\n#1MJourney #Focus #ProductivityHacks #SayingNo #10XGrowth #EntrepreneurFocus",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "saying no", "focus", "productivity", "10x growth", "entrepreneur focus", "strategic decisions", "time management", "growth hacking", "success strategies"]
  }'
echo "✅ Updated: Power of Saying No video"

# July 19, 2025
echo -e "\n📅 Updating July 19 videos..."

curl -X PATCH "https://api.vimeo.com/videos/1102854491" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 189 - 1M Journey - Coding - AI Integration Marathon: Making My App Genius-Level Smart",
    "description": "🚀 Day 189 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Marathon AI integration session\n• Building genius-level features with AI\n• Real-time implementation and testing\n• The future of AI-powered applications\n\n🔥 What you'\''ll learn:\n- Advanced AI integration techniques\n- Prompt engineering for production\n- Building intelligent user experiences\n- AI performance optimization\n\n💡 Key timestamps:\n00:00 - AI integration planning\n30:00 - Implementing core AI features\n1:00:00 - Advanced prompt engineering\n1:30:00 - Testing AI responses\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 How are you using AI in your projects?\n\n#1MJourney #AIIntegration #ArtificialIntelligence #SmartApps #CodingMarathon #FutureOfCode",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "AI integration", "artificial intelligence", "smart applications", "prompt engineering", "coding marathon", "AI features", "intelligent apps", "future tech", "development session"]
  }'
echo "✅ Updated: AI Integration Marathon video"

# July 18, 2025
echo -e "\n📅 Updating July 18 videos..."

curl -X PATCH "https://api.vimeo.com/videos/1102624227" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 188 - 1M Journey - MoCo - Scaling from $0 to $10K/Month (The Exact Blueprint)",
    "description": "🚀 Day 188 of my journey to $1M in revenue/impact\n\nIn this episode:\n• The exact blueprint I used to hit $10K/month\n• Breaking down revenue streams and strategies\n• What worked, what failed, and why\n• The mindset shifts required for scaling\n\n🔥 What you'\''ll learn:\n- Step-by-step scaling strategies\n- Revenue stream diversification\n- Pricing strategies that convert\n- The psychology of scaling\n\n💡 Revenue breakdown:\n00:00 - My journey from $0 to $10K\n15:00 - Revenue stream analysis\n30:00 - The exact blueprint\n45:00 - Scaling beyond $10K\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 What'\''s your revenue goal?\n\n#1MJourney #RevenueGrowth #10KMonth #ScalingBusiness #EntrepreneurBlueprint #MonthlyRecurring",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "revenue growth", "10k month", "scaling business", "entrepreneur blueprint", "monthly recurring", "business strategy", "income streams", "growth strategy", "success blueprint"]
  }'
echo "✅ Updated: Scaling to $10K/Month video"

# July 16, 2025
echo -e "\n📅 Updating July 16 videos..."

curl -X PATCH "https://api.vimeo.com/videos/1102164088" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 186 - 1M Journey - Coding - WarriorX Project: Building Tools for Digital Warriors",
    "description": "🚀 Day 186 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Introducing WarriorX - tools for digital warriors\n• Building productivity and focus applications\n• The intersection of mindset and technology\n• Creating tools that enhance performance\n\n🔥 What you'\''ll learn:\n- Building productivity-focused applications\n- User psychology in tool design\n- Performance optimization strategies\n- The WarriorX philosophy\n\n💡 Key timestamps:\n00:00 - WarriorX project introduction\n20:00 - Core feature development\n45:00 - Performance tracking systems\n1:00:00 - User experience optimization\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 What tools help you perform better?\n\n#1MJourney #WarriorX #ProductivityTools #DigitalWarrior #PerformanceApps #FocusTools",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "WarriorX", "productivity tools", "digital warrior", "performance apps", "focus tools", "mindset technology", "tool development", "user psychology", "startup project"]
  }'
echo "✅ Updated: WarriorX Project video"

# July 15, 2025
echo -e "\n📅 Updating July 15 videos..."

curl -X PATCH "https://api.vimeo.com/videos/1101934331" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 185 - 1M Journey - Coding - Emergency Hotfix: When Production Goes Down at 2 AM",
    "description": "🚀 Day 185 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Real emergency production hotfix\n• Debugging under extreme pressure\n• The 2 AM crisis management playbook\n• Lessons from production failures\n\n🔥 What you'\''ll learn:\n- Emergency response procedures\n- Debugging production issues fast\n- Staying calm under pressure\n- Post-mortem best practices\n\n💡 Critical moments:\n00:00 - The alert that woke me up\n10:00 - Diagnosing the issue\n25:00 - Implementing the hotfix\n35:00 - Lessons learned\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 Share your production horror stories\n\n#1MJourney #ProductionDown #EmergencyFix #Hotfix #CrisisManagement #DevOpsLife",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "production emergency", "hotfix", "crisis management", "debugging", "devops", "2am coding", "emergency response", "production issues", "lessons learned"]
  }'
echo "✅ Updated: Emergency Hotfix video"

# July 13, 2025
echo -e "\n📅 Updating July 13 videos..."

curl -X PATCH "https://api.vimeo.com/videos/1101458498" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 183 - 1M Journey - MoCo - Why I Ditched Cursor for Claude Code (Real Numbers Inside)",
    "description": "🚀 Day 183 of my journey to $1M in revenue/impact\n\nIn this episode:\n• The $160 Cursor subscription that disappointed\n• Why I switched to Claude Code at $250\n• Real performance comparisons and metrics\n• The tool that actually delivers value\n\n🔥 What you'\''ll learn:\n- Honest tool comparison with real data\n- Why expensive doesn'\''t mean worse\n- The true cost of developer productivity\n- Making data-driven tool decisions\n\n💡 Key comparisons:\n00:00 - My Cursor frustrations\n10:00 - Discovering Claude Code\n20:00 - Side-by-side performance\n30:00 - The ROI calculation\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 What'\''s your favorite dev tool?\n\n#1MJourney #ClaudeCode #CursorIDE #DeveloperTools #ToolComparison #ProductivityTools",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "claude code", "cursor ide", "tool comparison", "developer tools", "productivity", "real numbers", "tool review", "ide comparison", "developer productivity"]
  }'
echo "✅ Updated: Cursor vs Claude Code video"

curl -X PATCH "https://api.vimeo.com/videos/1101029338" \
  -H "Authorization: Bearer $VIMEO_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Day 183 - 1M Journey - Coding - Building My First SaaS: Live Development Session",
    "description": "🚀 Day 183 of my journey to $1M in revenue/impact\n\nIn this episode:\n• Starting my first SaaS product from scratch\n• Live architecture and development decisions\n• Building with monetization in mind\n• The path from idea to revenue\n\n🔥 What you'\''ll learn:\n- SaaS architecture fundamentals\n- MVP feature prioritization\n- Building for early revenue\n- Technical stack decisions\n\n💡 Key timestamps:\n00:00 - SaaS idea validation\n15:00 - Architecture planning\n30:00 - Core feature development\n45:00 - Payment integration setup\n\n🏆 Join the 1M Journey community\n👉 Subscribe for daily updates\n💬 What SaaS are you building?\n\n#1MJourney #SaaSDevelopment #FirstSaaS #LiveCoding #StartupDevelopment #MVPBuilding",
    "privacy": {"view": "anybody"},
    "tags": ["1M journey", "saas development", "first saas", "live coding", "mvp building", "startup development", "architecture planning", "payment integration", "product development", "revenue focused"]
  }'
echo "✅ Updated: First SaaS Development video"

echo -e "\n================================================"
echo "✅ All videos updated successfully!"
echo "🎯 Total videos updated: 20"
echo "📊 Date range: July 13-25, 2025"
echo -e "\n💡 Next steps:"
echo "1. Check your Vimeo dashboard to verify updates"
echo "2. Monitor view counts and engagement metrics"
echo "3. Share videos on social media with new titles"
echo "4. Continue daily uploads with optimized metadata"