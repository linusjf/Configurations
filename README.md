# Configurations

[![Hits-of-Code](https://hitsofcode.com/github/linusjf/Configurations?branch=main)](https://hitsofcode.com/github/linusjf/Configurations/view?branch=main)

Configuration files for my Termux, ArchLinux and Ubuntu installations.

## Dependencies needed by .bash_profile

The following dependencies are checked for in .bash_profile:

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

## Installation Instructions

### Termux

#### Installing and Using the Listed Utilities in Termux

Termux is a powerful terminal emulator for Android that allows you to run a Linux-like environment. Here's how you can install and use the tools you listed.

#### Install Termux

##### Method 1: F-Droid (Recommended)

- Download and install Termux from F-Droid.
- Open Termux and run the following command to update packages:
  ```bash
  apt update && apt upgrade -y
  ```

##### Method 2: Google Play Store (Deprecated)

- The Play Store version is outdated, so avoid it.

#### Install the Required Packages

Once inside Termux, install the utilities using pkg (Termux package manager) or apt.

##### Basic Utilities

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

##### Verify Installation

After installing, check if the commands work:

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

##### Additional Setup

Enable Storage Access (If Required)
If you need access to internal storage, run:

`bash termux-setup-storage`

Grant permission when prompted.

##### Configure fortune, cowsay, and lolcat Together

For a fun output:

```bash
fortune | cowsay | lolcat
```

##### Run Neofetch on Startup

To show system info automatically when Termux starts, add this to ~/.bashrc:

```bash
echo "neofetch" >> ~/.bashrc
```

##### Keeping Termux Updated

Regularly update your packages to avoid issues:

```bash
apt update && apt upgrade -y
```

### Arch Linux

#### Update system

`sudo pacman -Syu`

#### Install required packages

`sudo pacman -S coreutils grep gawk fortune-mod cowsay lolcat mlocate parallel pyenv github-cli neofetch`

#### Enable mlocate (updatedb)

`sudo updatedb`

#### Verify installation

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

#### Enable storage access (if needed)

`sudo chmod -R 755 /mnt`

#### Set up Neofetch on login

`echo "neofetch" >> ~/.bashrc`

#### Keep system updated

`sudo pacman -Syu`

### Ubuntu

#### Update ubuntu system

`sudo apt update && sudo apt upgrade -y`

#### Install required packages for Ubuntu

`sudo apt install coreutils grep gawk fortune cowsay lolcat mlocate parallel pyenv gh neofetch -y`

#### Enable mlocate (updatedb) for Ubuntu

`sudo updatedb`

#### Verify Ubuntu installation

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

#### Enable storage access (if needed)

`sudo chmod -R 755 /mnt`

#### Set up Neofetch on login

`echo "neofetch" >> ~/.bashrc`

#### Keep Ubuntu system updated

`sudo apt update && sudo apt upgrade -y`
