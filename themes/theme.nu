source ./catppuccin_mocha.nu
source ./catppuccin_macchiato.nu

let palette = $catppuccin_macchiato_palette
let theme = $catppuccin_macchiato_theme

$env.FZF_DEFAULT_OPTS = $'--color=bg+:($palette.surface0),bg:($palette.base),spinner:($palette.rosewater),hl:($palette.red) --color=fg:($palette.text),header:($palette.red),info:($palette.mauve),pointer:($palette.rosewater) --color=marker:($palette.lavender),fg+:($palette.text),prompt:($palette.mauve),hl+:($palette.red) --color=selected-bg:($palette.surface1)'

