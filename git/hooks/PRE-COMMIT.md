# Pre-commit Hook Dependencies

This document lists all dependencies required by the pre-commit hook, with installation\
instructions for Termux, Arch Linux, and Ubuntu.

## Core Dependencies

These essential dependencies must be installed:

- `shellcheck` - Static analysis tool for shell scripts\
- `ggshield` - GitGuardian secret scanning tool\
- `git` - Version control system\
- `parallel` - GNU parallel for parallel execution\
- `jpegoptim` - JPEG optimization tool\
- `stat` - File status utility\
- `find` - File search utility\
- `head` - Output the first part of files\
- `tidy` - HTML/XML validator and reformatter\
- `rm` - Remove files/directories\
- `wscheck` - Whitespace checker\
- `file` - Determine file type\
- `mktemp` - Create temporary files/directories\
- `shfmt` - Shell script formatter\
- `jq` - Command-line JSON processor\
- `sponge` - Soak up standard input and write to a file\
- `expand` - Convert tabs to spaces\
- `sed` - Stream editor\
- `prettier` - Code formatter (for markdown)

## Dependencies by File Type

These dependencies are used for specific file types:

### Shell Scripts

- `shellcheck`\
- `shfmt`

### JPEG Files

- `jpegoptim`

### XML/HTML Files

- `tidy`

### JSON Files

- `jq`

### Markdown Files

- `prettier`

### Go Files

- `gofmt` (included with Go installation)

### Secret Scanning

- `ggshield`

## Installation Instructions

### Termux (Android)

1. Update and upgrade packages:

   ```bash
   pkg update && pkg upgrade -y
   ```

2. Install core dependencies:

   ```bash
   pkg install git parallel jpegoptim findutils coreutils jq sed tidy
   ```

3. Install additional utilities:

   ```bash
   pkg install shellcheck shfmt moreutils
   pip install ggshield
   npm install -g prettier
   ```

4. Verify installation:

   ```bash
   command -v shellcheck ggshield git parallel jpegoptim find head tidy rm \
     jq shfmt sponge expand sed prettier gofmt
   ```

### Arch Linux

1. Update system:

   ```bash
   sudo pacman -Syu
   ```

2. Install core dependencies:

   ```bash
   sudo pacman -S git parallel jpegoptim findutils coreutils jq sed tidy
   ```

3. Install additional utilities:

   ```bash
   sudo pacman -S shellcheck shfmt moreutils
   pip install ggshield
   npm install -g prettier
   ```

4. Verify installation:

   ```bash
   command -v shellcheck ggshield git parallel jpegoptim find head tidy rm \
     jq shfmt sponge expand sed prettier gofmt
   ```

### Ubuntu

1. Update system:

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. Install core dependencies:

   ```bash
   sudo apt install -y git parallel jpegoptim findutils coreutils jq sed tidy
   ```

3. Install additional utilities:

   ```bash
   sudo apt install -y shellcheck shfmt moreutils
   pip3 install ggshield
   npm install -g prettier
   ```

4. Verify installation:

   ```bash
   command -v shellcheck ggshield git parallel jpegoptim find head tidy rm \
     jq shfmt sponge expand sed prettier gofmt
   ```

---

This ensures all dependencies are available for your pre-commit hooks across platforms. 🚀
