# AZZAR MCP Server Suite

A collection of Model Context Protocol (MCP) servers developed by Azzar, designed to enhance AI assistant capabilities across development, research, project management, and system operations.

## Overview

The AZZAR MCP Server Suite provides a collection of specialized MCP servers that work together to create an effective AI assistant toolkit. Each server focuses on specific domains while maintaining interoperability through the MCP protocol.

### Core Servers

| Server                                                                                  | Purpose                        | Key Features                                                    |
| --------------------------------------------------------------------------------------- | ------------------------------ | --------------------------------------------------------------- |
| [**Chaining MCP**](https://github.com/1999AZZAR/chaining-mcp-server)                 | Intelligent tool orchestration | Route optimization, sequential thinking, workflow orchestration |
| [**Filesystem MCP**](https://github.com/1999AZZAR/filesystem-mcp-server)             | Advanced file operations       | File manipulation, directory operations, search capabilities    |
| [**Google Search MCP**](https://github.com/1999AZZAR/Google-Search-MCP)       | Web research and analysis      | Search, content extraction, fact checking, research assistance  |
| [**Project Guardian MCP**](https://github.com/1999AZZAR/project-guardian-mcp-server) | Project memory management      | Knowledge graphs, task tracking, database operations            |
| [**Terminal MCP**](https://github.com/1999AZZAR/terminal-mcp-server)                 | System command execution       | Remote execution, session management, cross-platform support    |
| [**Wikipedia MCP**](https://github.com/1999AZZAR/wikipedia-mcp-server)               | Knowledge base access          | Article search, content extraction, language support            |

## Quick Start

### Prerequisites

- Node.js >= 18.0.0
- npm or yarn
- Git

### Installation

1. **Clone the AZZAR MCP Server Suite repository:**

   ```bash
   git clone https://github.com/1999AZZAR/azzar-mcp-suite.git
   cd azzar-mcp-suite
   ```
2. **Run the setup script:**

   ```bash
   ./setup.sh
   ```

   This will clone all individual MCP server repositories and install their dependencies.
3. **Configure your MCP client:**

   Choose your preferred MCP client and follow the configuration instructions below.

### MCP Client Configuration

#### For Cursor IDE

Add the following to `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "chaining": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/chaining-mcp-server/dist/index.js"],
      "env": {
        "SEQUENTIAL_THINKING_AVAILABLE": "true",
        "AWESOME_COPILOT_ENABLED": "true"
      }
    },
    "filesystem": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/filesystem-mcp-server/dist/index.js"]
    },
    "google-search": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/google-search-mcp-server/dist/index.js"],
      "env": {
        "GOOGLE_API_KEY": "your-api-key",
        "GOOGLE_SEARCH_ENGINE_ID": "your-search-engine-id"
      }
    },
    "project-guardian": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/Project-Guardian-mcp-server/dist/index.js"]
    },
    "terminal": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/terminal-mcp-server/dist/index.js"]
    },
    "wikipedia": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/wikipedia-mcp-server/dist/index.js"]
    }
  }
}
```

#### For Claude Desktop

Add the following to your `claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "chaining": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/chaining-mcp-server/dist/index.js"],
      "env": {
        "SEQUENTIAL_THINKING_AVAILABLE": "true",
        "AWESOME_COPILOT_ENABLED": "true"
      }
    },
    "filesystem": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/filesystem-mcp-server/dist/index.js"]
    },
    "google-search": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/google-search-mcp-server/dist/index.js"],
      "env": {
        "GOOGLE_API_KEY": "your-api-key",
        "GOOGLE_SEARCH_ENGINE_ID": "your-search-engine-id"
      }
    },
    "project-guardian": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/Project-Guardian-mcp-server/dist/index.js"]
    },
    "terminal": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/terminal-mcp-server/dist/index.js"]
    },
    "wikipedia": {
      "command": "node",
      "args": ["/path/to/mcp-ecosystem/wikipedia-mcp-server/dist/index.js"]
    }
  }
}
```

## Server Details

### Chaining MCP Server

**Repository:** [chaining-mcp-server](https://github.com/1999AZZAR/chaining-mcp-server)

Intelligent tool orchestration and workflow management server featuring:

- Server discovery and tool analysis
- Route optimization with complexity assessment
- Sequential thinking and brainstorming capabilities
- Multi-server workflow orchestration
- Time zone management and conversion
- Awesome Copilot integration for development guidance

### Filesystem MCP Server

**Repository:** [filesystem-mcp-server](https://github.com/1999AZZAR/filesystem-mcp-server)

Advanced file system operations server providing:

- File and directory operations
- Content reading with encoding support
- File search and filtering capabilities
- Archive creation and extraction
- File system monitoring and change detection

### Google Search MCP Server

**Repository:** [Google-Search-MCP](https://github.com/1999AZZAR/Google-Search-MCP)

Web research and content analysis server offering:

- Google Custom Search integration
- Content extraction and summarization
- Fact checking with credibility analysis
- Academic research capabilities
- News monitoring and trend analysis
- Multi-site search functionality

### Project Guardian MCP Server

**Repository:** [project-guardian-mcp-server](https://github.com/1999AZZAR/project-guardian-mcp-server)

Project memory and knowledge management server featuring:

- Knowledge graph for project entities and relationships
- Task tracking and progress management
- SQLite database operations
- Data import/export capabilities
- Project management workflows

### Terminal MCP Server

**Repository:** [terminal-mcp-server](https://github.com/1999AZZAR/terminal-mcp-server)

System command execution server with:

- Local and remote command execution
- SSH session management
- Cross-platform compatibility
- Command timeout and error handling
- Environment variable support

### Wikipedia MCP Server

**Repository:** [wikipedia-mcp-server](https://github.com/1999AZZAR/wikipedia-mcp-server)

Knowledge base access server providing:

- Article search and content retrieval
- Multi-language support
- Category browsing and navigation
- Geographic search capabilities
- Content sections and metadata access

## Development

### Repository Structure

```
azzar-mcp-suite/
├── README.md                    # This file
├── setup.sh                     # Automated setup script
├── update.sh                    # Update all servers script
├── config/                      # Configuration examples
│   ├── cursor-example.json      # Cursor IDE configuration
│   ├── claude-example.json      # Claude Desktop configuration
│   └── docker-compose.yml       # Docker deployment example
├── docs/                        # Additional documentation
│   ├── architecture.md          # System architecture overview
│   ├── integration.md           # Integration guides
│   └── troubleshooting.md       # Common issues and solutions
└── scripts/                     # Utility scripts
    ├── build-all.sh            # Build all servers
    ├── test-all.sh             # Run tests for all servers
    └── clean-all.sh            # Clean build artifacts
```

### Individual Server Development

Each MCP server maintains its own repository for focused development:

1. **Independent Development:** Each server can be developed, tested, and deployed independently
2. **Version Management:** Individual versioning allows for flexible updates and rollbacks
3. **Specialization:** Focused repositories enable domain-specific optimizations
4. **Community Contributions:** Easier for contributors to focus on specific server improvements

### Building All Servers

```bash
# Build all servers
./scripts/build-all.sh

# Run tests for all servers
./scripts/test-all.sh

# Clean all build artifacts
./scripts/clean-all.sh
```

## Contributing

We welcome contributions to the AZZAR MCP Server Suite! Here's how you can help:

### For New Contributors

1. **Choose a Server:** Pick a server that interests you from the list above
2. **Check Issues:** Look for open issues in the respective repository
3. **Fork and Clone:** Fork the repository and create a feature branch
4. **Make Changes:** Implement your improvements
5. **Test Thoroughly:** Run the test suite and ensure all tests pass
6. **Submit PR:** Create a pull request with a clear description

### Development Guidelines

- **Code Quality:** Follow TypeScript best practices and maintain test coverage
- **Documentation:** Update README and documentation for any new features
- **Compatibility:** Ensure MCP protocol compliance and cross-platform compatibility
- **Security:** Follow security best practices, especially for network operations

### Adding New Servers

To propose a new MCP server for the ecosystem:

1. **Create Repository:** Develop the server in its own repository
2. **Follow Standards:** Implement MCP protocol correctly with proper error handling
3. **Add Documentation:** Provide README and usage examples
4. **Submit Proposal:** Open an issue in this repository with server details

## License

The AZZAR MCP Server Suite is licensed under the MIT License. Individual servers may have their own licenses - please check each repository for specific licensing information.

## Support

- **Issues:** Report bugs and request features in individual server repositories
- **Discussions:** Join community discussions in the respective GitHub repositories
- **Documentation:** Check individual server READMEs for detailed usage instructions

## Updates

To update all servers to their latest versions:

```bash
./update.sh
```

This will pull the latest changes from all server repositories and rebuild them.

---
