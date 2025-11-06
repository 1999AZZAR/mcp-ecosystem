#!/bin/bash

# AZZAR MCP Server Suite Setup Script
# This script clones all MCP server repositories and sets them up

set -e  # Exit on any error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to setup a single server
setup_server() {
    local repo_name=$1
    local repo_url=$2

    print_status "Setting up $repo_name..."

    if [ -d "$repo_name" ]; then
        print_warning "$repo_name directory already exists. Pulling latest changes..."
        cd "$repo_name"
        git pull origin main 2>/dev/null || git pull origin master 2>/dev/null || true
        cd ..
    else
        print_status "Cloning $repo_name..."
        if git clone "$repo_url" "$repo_name"; then
            print_success "Cloned $repo_name successfully"
        else
            print_error "Failed to clone $repo_name"
            return 1
        fi
    fi

    # Enter the server directory
    cd "$repo_name"

    # Check if package.json exists
    if [ ! -f "package.json" ]; then
        print_warning "No package.json found in $repo_name. Skipping npm operations."
        cd ..
        return 0
    fi

    # Install dependencies
    print_status "Installing dependencies for $repo_name..."
    if npm install; then
        print_success "Dependencies installed for $repo_name"
    else
        print_error "Failed to install dependencies for $repo_name"
        cd ..
        return 1
    fi

    # Build the project
    print_status "Building $repo_name..."
    if npm run build; then
        print_success "Built $repo_name successfully"
    else
        print_error "Failed to build $repo_name"
        cd ..
        return 1
    fi

    # Go back to the ecosystem root
    cd ..
}

# Main setup function
main() {
    print_status "Starting AZZAR MCP Server Suite setup..."

    # Check if git is available
    if ! command -v git &> /dev/null; then
        print_error "Git is not installed. Please install git first."
        exit 1
    fi

    # Check if node is available
    if ! command -v node &> /dev/null; then
        print_error "Node.js is not installed. Please install Node.js >= 18.0.0 first."
        exit 1
    fi

    # Check Node.js version
    NODE_VERSION=$(node --version | sed 's/v//' | cut -d. -f1)
    if [ "$NODE_VERSION" -lt 18 ]; then
        print_error "Node.js version 18.0.0 or higher is required. Current version: $(node --version)"
        exit 1
    fi

    print_success "Prerequisites check passed. Node.js version: $(node --version)"

    # Define the servers to setup
    declare -a servers=(
        "chaining-mcp-server:https://github.com/1999AZZAR/chaining-mcp-server.git"
        "filesystem-mcp-server:https://github.com/1999AZZAR/filesystem-mcp-server.git"
        "google-search-mcp-server:https://github.com/1999AZZAR/google-search-mcp-server.git"
        "Project-Guardian-mcp-server:https://github.com/1999AZZAR/project-guardian-mcp-server.git"
        "terminal-mcp-server:https://github.com/1999AZZAR/terminal-mcp-server.git"
        "wikipedia-mcp-server:https://github.com/1999AZZAR/wikipedia-mcp-server.git"
    )

    # Track success/failure
    local success_count=0
    local total_count=${#servers[@]}

    # Setup each server
    for server_info in "${servers[@]}"; do
        IFS=':' read -r repo_name repo_url <<< "$server_info"

        if setup_server "$repo_name" "$repo_url"; then
            ((success_count++))
        fi
    done

    # Print summary
    echo
    print_status "Setup completed!"
    print_success "Successfully set up $success_count out of $total_count servers"

    if [ "$success_count" -eq "$total_count" ]; then
        echo
        print_success "🎉 All MCP servers have been successfully set up!"
        echo
        print_status "Next steps:"
        echo "1. Configure your MCP client (Cursor IDE or Claude Desktop)"
        echo "2. Copy the configuration from config/cursor-example.json or config/claude-example.json"
        echo "3. Update the paths in the configuration to point to your local directories"
        echo "4. Restart your MCP client"
        echo
        print_status "For detailed configuration instructions, see the README.md file"
    else
        print_warning "Some servers failed to setup. Please check the errors above and try again."
        exit 1
    fi
}

# Run main function
main "$@"
