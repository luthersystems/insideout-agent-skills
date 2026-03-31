# InsideOut by Luther Systems

> Cloud infrastructure automation. Describe your application in natural language and InsideOut will design, configure, deploy, and manage production-ready backend infrastructure -- in minutes, not weeks.

Works standalone or integrated directly into AI app builders via MCP.

---

## Quick Install (30 seconds)

```bash
npx skills add luthersystems/insideout-agent-skills
```

Works with **Claude Code**, **Codex**, **Cursor**, **Kiro**, **Windsurf**, and [30+ other tools](https://agentskills.io).

**[Try the web app](https://insideout.luthersystemsapp.com/)** -- no install required.

---

## What Problem Does InsideOut Solve?

Setting up cloud infrastructure is slow, error-prone, and requires deep DevOps expertise. Teams spend weeks on plumbing -- networking, security, storage, scaling configuration -- before writing a single line of product code.

InsideOut eliminates this. You describe your application; InsideOut handles the rest: architecture design, Terraform generation, cost estimation, deployment, and ongoing management.

**Before InsideOut:** Weeks of manual infrastructure setup, Terraform authoring, and cloud configuration.
**With InsideOut:** Backend infrastructure deployed in minutes, managed continuously.

| Capability | Manual Terraform | InsideOut |
|---|---|---|
| Time to deploy | Days to weeks | Minutes |
| Security defaults | Manual | Automatic |
| Cost visibility | Post-deploy billing | Pre-deploy estimates |
| Observability setup | Manual | Day one |
| AI app builder integration | None | Native (Claude Code, Codex, Kiro, Antigravity) |
| Terraform ownership | Yes | Yes (generated, exportable) |

---

## What You Can Do

- Design AWS/GCP architectures conversationally
- Get real-time cost estimates before deploying
- Generate production-ready Terraform
- Deploy infrastructure directly from your tool
- Inspect environments and detect drift
- Monitor logs and manage resources over time

---

## Quick Start

Once installed, just ask:

> "Build me a scalable backend for my golang microservices app on AWS with a DB and auth."

InsideOut will:
1. Propose an architecture (ECS, RDS, Cognito, ALB, VPC...)
2. Estimate monthly cost
3. Generate production-ready Terraform
4. Deploy to your AWS or GCP account

```
You: "I need infrastructure for an e-commerce platform, 1k monthly users on AWS"

Riley: "I'd recommend ECS for your containers, RDS PostgreSQL for your database,
        ElastiCache Redis for sessions, and an ALB. Estimated cost: ~$350/month.
        Want me to adjust anything?"

You: "Looks good, generate the Terraform"

[Generates production-ready Terraform files]

You: "Deploy it"

[Deploys to AWS, streams logs in real-time]
```

---

## Who Is This For?

| User | Use case |
|---|---|
| **Solo developers** | Ship a production backend without DevOps expertise |
| **Startup engineering teams** | Move from idea to deployed infrastructure in minutes |
| **AI app builders** | Integrate infrastructure automation directly into AI-native development workflows |
| **Enterprise teams** | Standardise infrastructure with best practices and cost controls |
| **DevOps / platform engineers** | Faster architecture and IaC workflows |

If you'd rather describe what you want than manually wire it together -- this is for you.

---

## Choose Your Path

| Path | Best for | Install |
|------|----------|---------|
| **This repo** (recommended for Codex) | Portable skill across multiple AI tools | `npx skills add luthersystems/insideout-agent-skills` |
| **[Claude Code plugin](https://github.com/luthersystems/insideout-claude-code)** | Best native Claude Code experience | `/plugin marketplace add luthersystems/insideout-claude-code` |
| **[Kiro power](https://github.com/luthersystems/insideout-power)** | Best native Kiro experience | Add power from GitHub: `luthersystems/insideout-power` |
| **[Web app](https://insideout.luthersystemsapp.com/)** | No install required | Open in browser |

---

## Installation (Detailed)

### Recommended: Skills CLI

```bash
npx skills add luthersystems/insideout-agent-skills
```

### Claude Code

For the full plugin experience (slash commands, agents, hooks, auto-approve):

```
/plugin marketplace add luthersystems/insideout-claude-code
/plugin install insideout
```

### Codex

```bash
npx skills add luthersystems/insideout-agent-skills --agent codex
```

Activate by typing `$insideout` -- Codex will detect the missing MCP server and prompt you to install it automatically.

> **Fallback:** If the auto-install doesn't trigger, run: `codex mcp add insideout --url https://app.luthersystems.com/v1/insideout-mcp`

### Cursor

```bash
npx skills add luthersystems/insideout-agent-skills --agent cursor
```

Then add the MCP server to your Cursor MCP config:

```json
{
  "mcpServers": {
    "insideout": {
      "type": "http",
      "url": "https://app.luthersystems.com/v1/insideout-mcp"
    }
  }
}
```

### Windsurf

```bash
npx skills add luthersystems/insideout-agent-skills --agent windsurf
```

Add MCP via Windsurf MCP Marketplace or manually in settings.

### Kiro

For the full power experience (steering files, design pattern guides, auto-approve):

1. Open the Powers panel
2. Click **Add power from GitHub**
3. Enter: `luthersystems/insideout-power`

### Antigravity

```bash
npx skills add luthersystems/insideout-agent-skills --agent antigravity
```

Then add the MCP server in Antigravity: "..." menu → MCP Servers → Manage MCP Servers → View raw config:

```json
{
  "mcpServers": {
    "insideout": {
      "serverUrl": "https://app.luthersystems.com/v1/insideout-mcp"
    }
  }
}
```

> **Note:** Antigravity uses `serverUrl`, not `url`.

### Manual Installation

```bash
git clone https://github.com/luthersystems/insideout-agent-skills.git
cp -r insideout-agent-skills ~/.agents/skills/insideout
```

The `~/.agents/skills/` directory is the standard cross-tool location. Most AI coding tools will detect skills here automatically.

---

## Supported Services (60+)

| Category | AWS | GCP |
|----------|-----|-----|
| **Compute** | EC2, ECS, EKS, Lambda | Compute Engine, Cloud Run, GKE, Cloud Functions |
| **Database** | RDS PostgreSQL, DynamoDB, ElastiCache, OpenSearch | Cloud SQL, Firestore, Memorystore |
| **Networking** | VPC, ALB, CloudFront, API Gateway | VPC, Load Balancing, Cloud CDN, API Gateway |
| **Storage** | S3 | Cloud Storage |
| **Security** | WAF, KMS, Secrets Manager, Cognito | Cloud Armor, Cloud KMS, Secret Manager, Identity Platform |
| **Messaging** | SQS, MSK (Kafka) | Pub/Sub |
| **Observability** | CloudWatch, Managed Grafana | Cloud Logging, Cloud Monitoring |
| **AI/ML** | Bedrock | Vertex AI |
| **CI/CD** | CodePipeline, GitHub Actions | Cloud Build |
| **Backup** | AWS Backup | GCP Backups |

Architecture patterns: AI Stack, Microservices, Serverless. Azure support is upcoming.

---

## Core Capabilities

### Infrastructure from Description
Describe your application in natural language. InsideOut generates the architecture, configuration, and Terraform. Review, tweak, and deploy -- all from one place.

### Cost Visibility Before Deployment
Get cost estimates for your exact stack before committing. No surprise bills; pricing is surfaced at design time.

### Secure and Observable by Default
Security best practices applied automatically. Observability configured from day one -- no retroactive setup needed.

### Full Terraform Ownership
You own the generated Terraform files. Use InsideOut defaults or override any setting. No lock-in; the output is standard infrastructure-as-code.

### Managed Operations
Luther Systems sets up and manages critical infrastructure. Ongoing updates, patching, and operational support included.

---

## How It Works

InsideOut uses a multi-agent AI system behind a single MCP server:

| Agent | Role |
|-------|------|
| **Riley** | Infrastructure advisor -- leads the design conversation |
| **Hippo** | Cost estimation and pricing optimization |
| **Joy** | User experience and requirement gathering |
| **Etch** | Terraform code generation |
| **Core** | Architecture validation and best practices |
| **Axel** | Deployment orchestration |

From your perspective, you're talking to Riley. The other agents work behind the scenes. These capabilities are exposed as tools inside your AI environment, so you use them conversationally.

## Security & Auth Model

- No API key required to install or use the skill
- The MCP server runs remotely over HTTPS -- no local binary needed
- Cloud credentials are only required at deployment time, via a browser-based connect flow
- You control what gets deployed into your cloud accounts
- You can review all generated Terraform before deploying

See [SECURITY.md](SECURITY.md) for detailed data flow documentation.

---

## Terraform Presets and Modules

InsideOut uses a library of battle-tested, standard Terraform modules composed for common infrastructure patterns.

- [Terraform Presets](https://github.com/luthersystems/insideout-terraform-presets) -- the pre-built modules InsideOut composes
- [Standard Modules](https://github.com/luthersystems/tf-modules) -- underlying Luther Enterprise infrastructure modules

---

## FAQ

**Can I use InsideOut without the InsideOut UI?**
Yes. InsideOut integrates with Claude Code, Codex, Kiro, Antigravity, and any MCP-compatible AI development environment, allowing you to design, price, and deploy infrastructure directly from your editor without opening the InsideOut interface.

**Do I own the generated Terraform?**
Yes. InsideOut generates standard Terraform files that you own and can export, modify, or use independently of the platform.

**Can I override the default configuration?**
Yes. InsideOut applies best-practice defaults but every setting is overridable. You control the final configuration before deployment.

**What clouds does InsideOut support?**
AWS and Google Cloud Platform. AWS has the deepest support with the widest range of resource types. Azure support is upcoming.

**Is InsideOut suitable for AI application backends?**
Yes. InsideOut explicitly supports AI stack architectures and is designed to work within AI-native development environments like Claude Code, Codex, Kiro, Antigravity, and other MCP-compatible tools.

**How does pricing work?**
Cost estimates for your exact stack are surfaced before deployment. Contact Luther Systems for platform pricing: contact@luthersystems.com

---

## Resources

- [InsideOut Platform](https://insideout.luthersystems.com)
- [Web App](https://insideout.luthersystemsapp.com/) -- try InsideOut without any IDE
- [Demo Video](https://insideout.luthersystems.com/demo-video)
- [Documentation](https://docs.luthersystems.com)
- [Terraform Presets](https://github.com/luthersystems/insideout-terraform-presets)
- [Agent Skills Standard](https://agentskills.io)
- [Subreddit](https://www.reddit.com/r/luthersystems/)
- [llms.txt](llms.txt) -- machine-readable product summary for LLM discovery

### MCP Server Integrations

- [Confluent (Kafka)](https://github.com/luthersystems/mcp-confluent)
- [Google Drive](https://github.com/luthersystems/mcp-server-google-drive)
- [SAP HANA](https://github.com/luthersystems/mcp-server-hana)

---

## About Luther Systems

Luther Systems is an enterprise infrastructure and automation company founded in 2015, headquartered in London, UK. Our mission is to accelerate the advent of the automated enterprise.

Founded by a team who spent years automating complex processes for some of the world's largest financial institutions, Luther Systems builds platforms that bring enterprise-grade infrastructure and operations to teams of every size.

- [Luther Systems](https://luthersystems.com)
- [InsideOut](https://insideout.luthersystems.com)
- [GitHub](https://github.com/luthersystems)
- [Documentation](https://docs.luthersystems.com)

---

## Get Help

- [Discord](https://insideout.luthersystems.com/discord) -- chat with the devs and InsideOut users
- [Book a Call](https://insideout.luthersystems.com/general-call) -- talk with us
- [Tech Call](https://insideout.luthersystems.com/tech-call) -- talk with the devs
- Email: [contact@luthersystems.com](mailto:contact@luthersystems.com)

---

## License

[Apache License 2.0](LICENSE)
