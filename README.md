# My Dotfiles

Personal terminal configuration with helpful aliases and functions.

## What's included:
- **bashrc**: Enhanced bash configuration with:
  - Colored prompt
  - Python/Git helper functions
  - exa file listing (colorized ls replacement)
  - Navigation shortcuts

## Setup on new machine:
```bash
# Copy bashrc
cp bashrc ~/.bashrc

# Install micro editor
curl https://getmic.ro | bash
mkdir -p ~/.local/bin
mv micro ~/.local/bin/

# Install exa
curl -L https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip -o exa.zip
unzip exa.zip && mv bin/exa ~/.local/bin/ && rm -rf exa.zip bin completions man

# Reload bash
source ~/.bashrc
```

## Helper functions:
- `help` - Show all available helpers
- `githelp` - Git command reference
- `venvhelp` - Python virtual environment commands
- `pyhelp` - Python project shortcuts
- `exahelp` - File listing commands
- `findfile pattern` - Find files by name

## Aliases:
- `ls`, `ll`, `la`, `lt` - Enhanced file listing with exa
- `..` - Go up one directory
- `py` - Short for python
- `activate` - Quick venv activation