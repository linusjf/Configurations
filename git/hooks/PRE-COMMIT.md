# Pre-commit Hook Dependencies

This document lists all the dependencies required by the pre-commit hook.

## Core Dependencies

These are the essential dependencies that must be installed:

- `shellcheck` - Static analysis tool for shell scripts
- `ggshield` - GitGuardian secret scanning tool
- `git` - Version control system
- `parallel` - GNU parallel for parallel execution
- `jpegoptim` - JPEG optimization tool
- `stat` - File status utility
- `find` - File search utility
- `head` - Output the first part of files
- `tidy` - HTML/XML validator and reformatter
- `rm` - Remove files/directories
- `wscheck` - Whitespace checker
- `file` - Determine file type
- `mktemp` - Create temporary files/directories
- `shfmt` - Shell script formatter
- `jq` - Command-line JSON processor
- `sponge` - Soak up standard input and write to a file
- `expand` - Convert tabs to spaces
- `sed` - Stream editor
- `prettier` - Code formatter (for markdown)

## Dependencies by File Types

These dependencies are used for specific file types:

- For shell scripts:

  - `shellcheck`
  - `shfmt`

- For JPEG files:

  - `jpegoptim`

- For XML/HTML files:

  - `tidy`

- For JSON files:

  - `jq`

- For Markdown files:

  - `prettier`

- For Go files:

  - `gofmt` (included with Go installation)

- For secret scanning:
  - `ggshield`

## Installation on Termux

### Step 1: Update and Upgrade

Before installing any packages, ensure your Termux environment is up to date:

```bash
pkg update && pkg upgrade -y
```

### Step 2: Install Core Dependencies

Run the following command to install the essential dependencies:

```bash
pkg install git parallel jpegoptim findutils coreutils jq sed tidy
```

This installs:

- `git` - Version control system
- `parallel` - GNU parallel for parallel execution
- `jpegoptim` - JPEG optimization tool
- `findutils` - Includes `find`, `xargs`, etc.
- `coreutils` - Includes `stat`, `head`, `rm`, `mktemp`, `expand`, `file`, etc.
- `jq` - Command-line JSON processor
- `sed` - Stream editor
- `tidy` - HTML/XML validator and reformatter

### Step 3: Install Additional Utilities

Some dependencies require manual installation or alternative methods.

#### 1. Install `shellcheck`

```bash
pkg install shellcheck
```

#### 2. Install `shfmt`

```bash
pkg install shfmt
```

#### 3. Install `ggshield` (GitGuardian)

GitGuardian requires `pip`. Install it as follows:

```bash
pkg install python
pip install --upgrade pip
pip install ggshield
```

#### 4. Install `prettier`

Prettier requires `nodejs`. Install it using:

```bash
pkg install nodejs
npm install -g prettier
```

#### 5. Install `sponge`

`moreutils` provides `sponge`:

```bash
pkg install moreutils
```

### Step 4: Verify Installation

Run the following command to confirm all tools are installed:

```bash
command -v shellcheck ggshield git parallel jpegoptim find head tidy rm jq shfmt sponge expand sed prettier gofmt
```

If any tool is missing, re-run the installation commands.

---

This ensures all dependencies are available for your pre-commit hooks in Termux. 🚀

## Installation on Arch Linux

### Step 1: Update System

Before installing any packages, ensure your system is up to date:

```bash
sudo pacman -Syu
```

### Step 2: Install Core Dependencies

Run the following command to install the essential dependencies:

```bash
sudo pacman -S git parallel jpegoptim findutils coreutils jq sed tidy
```

This installs:

- `git` - Version control system
- `parallel` - GNU parallel for parallel execution
- `jpegoptim` - JPEG optimization tool
- `findutils` - Includes `find`, `xargs`, etc.
- `coreutils` - Includes `stat`, `head`, `rm`, `mktemp`, `expand`, `file`, etc.
- `jq` - Command-line JSON processor
- `sed` - Stream editor
- `tidy` - HTML/XML validator and reformatter

### Step 3: Install Additional Utilities

Some dependencies require manual installation or alternative methods.

#### 1. Install `shellcheck`

```bash
sudo pacman -S shellcheck
```

#### 2. Install `shfmt`

```bash
sudo pacman -S shfmt
```

#### 3. Install `ggshield` (GitGuardian)

GitGuardian requires `pip`. Install it as follows:

```bash
sudo pacman -S python
pip install --upgrade pip
pip install ggshield
```

#### 4. Install `prettier`

Prettier requires `nodejs`. Install it using:

```bash
sudo pacman -S nodejs npm
npm install -g prettier
```

#### 5. Install `sponge`

`moreutils` provides `sponge`:

```bash
sudo pacman -S moreutils
```

### Step 4: Verify Installation

Run the following command to confirm all tools are installed:

```bash
command -v shellcheck ggshield git parallel jpegoptim find head tidy rm jq shfmt sponge expand sed prettier gofmt
```

If any tool is missing, re-run the installation commands.

---

This ensures all dependencies are available for your pre-commit hooks in Arch Linux. 🚀

## Installation on Ubuntu

### Step 1: Update System

Before installing any packages, ensure your system is up to date:

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install Core Dependencies

Run the following command to install the essential dependencies:

```bash
sudo apt install -y git parallel jpegoptim findutils coreutils jq sed tidy
```

This installs:

- `git` - Version control system
- `parallel` - GNU parallel for parallel execution
- `jpegoptim` - JPEG optimization tool
- `findutils` - Includes `find`, `xargs`, etc.
- `coreutils` - Includes `stat`, `head`, `rm`, `mktemp`, `expand`, `file`, etc.
- `jq` - Command-line JSON processor
- `sed` - Stream editor
- `tidy` - HTML/XML validator and reformatter

### Step 3: Install Additional Utilities

Some dependencies require manual installation or alternative methods.

#### 1. Install `shellcheck`

```bash
sudo apt install -y shellcheck
```

#### 2. Install `shfmt`

```bash
sudo apt install -y shfmt
```

#### 3. Install `ggshield` (GitGuardian)

GitGuardian requires `pip`. Install it as follows:

```bash
sudo apt install -y python3 python3-pip
pip3 install --upgrade pip
pip3 install ggshield
```

#### 4. Install `prettier`

Prettier requires `nodejs`. Install it using:

```bash
sudo apt install -y nodejs npm
npm install -g prettier
```

#### 5. Install `sponge`

`moreutils` provides `sponge`:

```bash
sudo apt install -y moreutils
```

### Step 4: Verify Installation

Run the following command to confirm all tools are installed:

```bash
command -v shellcheck ggshield git parallel jpegoptim find head tidy rm jq shfmt sponge expand sed prettier gofmt
```

## If any tool is missing, re-run the installation commands.

This ensures all dependencies are available for your pre-commit hooks in Ubuntu. 🚀
