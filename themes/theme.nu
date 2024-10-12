source ./catppuccin_mocha.nu
source ./catppuccin_macchiato.nu
source ./rose_pine.nu

let palette = $catppuccin_macchiato_palette
let theme = $catppuccin_macchiato_theme

$env.FZF_DEFAULT_OPTS = $'--color=bg+:($catppuccin_macchiato_palette.surface0),bg:-1,spinner:($catppuccin_macchiato_palette.rosewater),hl:($catppuccin_macchiato_palette.red) --color=fg:($catppuccin_macchiato_palette.text),header:($catppuccin_macchiato_palette.red),info:($catppuccin_macchiato_palette.mauve),pointer:($catppuccin_macchiato_palette.rosewater) --color=marker:($catppuccin_macchiato_palette.lavender),fg+:($catppuccin_macchiato_palette.text),prompt:($catppuccin_macchiato_palette.mauve),hl+:($catppuccin_macchiato_palette.red) --color=selected-bg:($catppuccin_macchiato_palette.surface1)'

