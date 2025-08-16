# AGENTS.md - Developer Configuration Repository

## Repository Overview
Personal dotfiles and configuration repository for terminal tools and text editors.

## Build/Test/Lint Commands
- No build system - configuration files only
- Test configurations: Manual testing by loading configurations
- Syntax validation: Use language-specific linters for each config type

## Code Style Guidelines

### Lua (Neovim configs)
- Use tabs for indentation (tabstop=4, shiftwidth=4)
- Snake_case for variables and functions
- Use require() for module imports at top of file
- No trailing whitespace (auto-removed on save)
- Double quotes for strings
- Local variables preferred over global

### Configuration Files
- YAML: Use 2-space indentation
- Comments explain purpose of configuration blocks
- Group related settings together
- Use consistent color schemes (Solarized Dark theme)

### File Organization
- `nvim/lua/` - Modular Lua configuration
- `nvim/lua/plugins/` - Individual plugin configurations
- Separate files for: base settings, keymaps, highlights, plugins
- Keep plugin configurations self-contained

## Error Handling
- Use vim.api.nvim_create_autocmd for event handling
- Wrap plugin setup in pcall() if optional
- Provide fallbacks for missing dependencies