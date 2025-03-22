# Configurations

Configuration files for Termux, ArchLinux and Ubuntu installations.

[![Hits-of-Code](https://hitsofcode.com/github/linusjf/Configurations?branch=main)](https://hitsofcode.com/github/linusjf/Configurations/view?branch=main)

## Dependencies

The following dependencies are checked for in `.bash_profile`:

- `tty` - Display the terminal path
- `cat` - Concatenate and print files
- `rm` - Remove files
- `grep` - Search text using patterns
- `awk` - Text processing tool
- `fortune` - Display random quotes
- `lolcat` - Rainbow colorization for text
- `cowsay` - ASCII art cow that displays messages
- `updatedb` - Update database for mlocate
- `parallel` - Execute commands in parallel
- `pyenv` - Python version management
- `gh` - GitHub CLI
- `neofetch` - System information tool

## Installation

### Termux for Android

#### Installing Termux

##### F-Droid (Recommended)

1. Download and install Termux from F-Droid
2. Open Termux and run:

   ```bash
   apt update && apt upgrade -y
   ```

##### Google Play Store (Deprecated)

The Play Store version is outdated and should be avoided.

#### Installing Packages

Install required utilities using pkg or apt:

```bash
pkg install coreutils -y      # Includes tty, cat, rm, etc.
pkg install grep -y           # Install grep for searching text
pkg install gawk -y           # Install awk for text processing
pkg install fortune -y        # Install fortune for random quotes
pkg install cowsay -y         # ASCII cow that says messages
pkg install lolcat -y         # Rainbow color text
pkg install findutils -y      # Provides updatedb (locate command)
pkg install parallel -y       # Execute commands in parallel
pkg install pyenv -y          # Python version manager
pkg install gh -y             # GitHub CLI
pkg install neofetch -y       # System information tool
```

#### Verifying Installation

Check if commands work:

```bash
tty
cat /proc/version
rm --help
grep --version
awk --version
fortune | cowsay | lolcat
updatedb
parallel --version
pyenv --version
gh --version
neofetch
```

#### Additional Setup

Enable storage access if needed:

```bash
termux-setup-storage
```

Add neofetch to startup:

```bash
echo "neofetch" >> ~/.bashrc
```

Keep Termux updated:

```bash
apt update && apt upgrade -y
```

### Arch Linux

#### System Update

```bash
sudo pacman -Syu
```

#### Package Installation

```bash
sudo pacman -S coreutils grep gawk fortune-mod cowsay lolcat mlocate parallel pyenv github-cli neofetch
```

#### Pyenv Installation

```bash
curl -fsSL https://pyenv.run | bash
```

#### Enable mlocate

```bash
sudo updatedb
```

#### Verify Installation

```bash
tty
cat --version
rm --help
grep --version
awk --version
fortune | cowsay | lolcat
updatedb
parallel --version
pyenv --version
gh --version
neofetch
```

#### Storage Access

```bash
sudo chmod -R 755 /mnt
```

#### Neofetch on Login

```bash
echo "neofetch" >> ~/.bashrc
```

#### System Updates

```bash
sudo pacman -Syu
```

### Ubuntu

#### System Update for Ubuntu

```bash
sudo apt update && sudo apt upgrade -y
```

#### Package Installation for Ubuntu

```bash
sudo apt install coreutils grep gawk fortune cowsay lolcat mlocate parallel gh neofetch -y
```

#### Pyenv Installation for Ubuntu

```bash
curl -fsSL https://pyenv.run | bash
```

#### Enable mlocate for Ubuntu

```bash
sudo updatedb
```

#### Verify Installation for Ubuntu

```bash
tty
cat --version
rm --help
grep --version
awk --version
fortune | cowsay | lolcat
updatedb
parallel --version
pyenv --version
gh --version
neofetch
```

#### Storage Access in Ubuntu

```bash
sudo chmod -R 755 /mnt
```

#### Neofetch on Login in Ubuntu

```bash
echo "neofetch" >> ~/.bashrc
```

#### System Updates for Ubuntu

```bash
sudo apt update && sudo apt upgrade -y
```
