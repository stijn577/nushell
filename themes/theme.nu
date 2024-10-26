source ./catppuccin_latte.nu
source ./catppuccin_macchiato.nu
source ./catppuccin_mocha.nu
source ./rose_pine.nu

let palette = $catppuccin_latte_palette
let theme = $catppuccin_latte_theme

if $palette != $rose_pine_palette {
$env.FZF_DEFAULT_OPTS = $'--color=bg+:($palette.surface0),bg:-1,spinner:($palette.rosewater),hl:($palette.red) --color=fg:($palette.text),header:($palette.red),info:($palette.mauve),pointer:($palette.rosewater) --color=marker:($palette.lavender),fg+:($palette.text),prompt:($palette.mauve),hl+:($palette.red) --color=selected-bg:($palette.surface1)'
}

const color_config_strings = [
  [key val];
  ["Catppuccin Latte" {
    wezterm: ["\"Catppuccin Latte\""], 
    helix: ["\"catppuccin_latte\""], 
    bat: ["\"catppuccin-latte\""], 
    nushell: ["$catppuccin_latte_palette", "$catppuccin_latte_theme"]
    starship: "~/.config/starship/catppuccin_latte.toml"
  }],
  ["Catppuccin Macchiato" { 
    wezterm: ["\"Catppuccin Macchiato\""], 
    helix: ["\"catppuccin_macchiato\""], 
    bat: ["\"catppuccin-macchiato\""], 
    nushell: ["$catppuccin_macchiato_palette", "$catppuccin_macchiato_theme"]
    starship: "~/.config/starship/catppuccin_macchiato.toml"
  }],
  ["Rose Pine" { 
    wezterm: ["\"rose-pine\""], 
    helix: ["\"rose_pine\""], 
    bat: ["\"rose-pine\""], 
    nushell: ["$rose_pine_palette", "$rose_pine_theme"],
    starship: "~/.config/starship/rose_pine.toml"
  }],
]

const color_config_paths = { 
  wezterm: { path: "~/.config/wezterm/wezterm.lua", keys: ["config.color_scheme = "] }, 
  helix: { path: "~/AppData/Roaming/helix/config.toml", keys: ["theme = "] }, 
  bat: { path: "~/AppData/Roaming/bat/config", keys: ["--theme="] },
  nushell: { path: "~/AppData/Roaming/nushell/themes/theme.nu", keys: ["let palette = " "let theme = "] }
  starship: { path: "~/.config/starship/starship.toml" }
}

def themux [] {
 let theme_strings = $color_config_strings  
  | input list -d key 
  | get val
  
  ["wezterm" "helix" "bat" "nushell"] 
    | each {|key| _change_app_theme ($color_config_paths | get $key | get path | path expand) ($color_config_paths | get $key | get keys) ($theme_strings | get $key) }

  _change_starship_theme ($color_config_paths | get starship | get path | path expand) ($theme_strings | get starship | path expand)

  print "Change theme succesfully!"

  return 
}

def _change_app_theme [config_path: path, keys: list<string>, vals: list<string>] {
  if not ($config_path | path exists) {
    error make -u { msg: $"config path ($config_path) does not exist" }
  }
  
  if not (($keys | length) == ($vals | length)) {
    error make -u { msg: "unbalanced amount of keys and values" }
  }
  
  for i in 0..(($keys | length) - 1) {
    mut buff = open -r $config_path
    $buff = edit_buffer $buff ($keys | get $i) ($vals | get $i)
    $buff | save -f $config_path
  }
}

def _change_starship_theme [dest_path: path, src_path: path] {
  cp $src_path $dest_path
  
}

def edit_buffer [buff: string, key: string, val: string] string {
  let index = ($buff | lines | enumerate | find $key).0.index 
  
  let buff = $buff | lines | update $index ([$key $val] | str join) | to text

  return $buff
}