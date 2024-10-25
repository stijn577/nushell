source ./catppuccin_mocha.nu
source ./catppuccin_macchiato.nu
source ./rose_pine.nu

let palette = $catppuccin_macchiato_palette
let theme = $catppuccin_macchiato_theme

$env.FZF_DEFAULT_OPTS = $'--color=bg+:($catppuccin_macchiato_palette.surface0),bg:-1,spinner:($catppuccin_macchiato_palette.rosewater),hl:($catppuccin_macchiato_palette.red) --color=fg:($catppuccin_macchiato_palette.text),header:($catppuccin_macchiato_palette.red),info:($catppuccin_macchiato_palette.mauve),pointer:($catppuccin_macchiato_palette.rosewater) --color=marker:($catppuccin_macchiato_palette.lavender),fg+:($catppuccin_macchiato_palette.text),prompt:($catppuccin_macchiato_palette.mauve),hl+:($catppuccin_macchiato_palette.red) --color=selected-bg:($catppuccin_macchiato_palette.surface1)'

const color_config_strings = [
  [key val];
  ["Catppuccin Macchiato" { 
    wezterm: ["\"Catppuccin Macchiato\""], 
    helix: ["\"catppuccin_macchiato\""], 
    bat: ["\"catppuccin-macchiato\""], 
    nushell: ["$catppuccin_macchiato_palette", "$catppuccin_macchiato_theme"] 
  }],
  ["Rose Pine" { 
    wezterm: ["\"rose-pine\""], 
    helix: ["\"rose_pine\""], 
    bat: ["\"rose-pine\""], 
    nushell: ["$rose_pine_palette", "$rose_pine_theme"]
  }],
]

const color_config_paths = { 
  wezterm: { path: "~/.config/wezterm/wezterm.lua", keys: ["config.color_scheme = "] }, 
  helix: { path: "~/AppData/Roaming/helix/config.toml", keys: ["theme = "] }, 
  bat: { path: "~/AppData/Roaming/bat/config", keys: ["--theme="] },
  nushell: { path: "~/AppData/Roaming/nushell/themes/theme.nu", keys: ["let palette = " "let theme = "] }
}

def themux [] {
 let theme_strings = $color_config_strings  
  | input list -d key 
  | get val
  
  ["wezterm" "helix" "bat" "nushell"] 
    | each {|key| _change_app_theme ($color_config_paths | get $key | get path | path expand) ($color_config_paths | get $key | get keys) ($theme_strings | get $key) }
  
}

def _change_app_theme [config_path: path, keys: list<string>, vals: list<string>] {
  if not ($config_path | path exists) {
    error make -u { msg: $"config path ($config_path) does not exist" }
  }
  
  if not (($keys | length) == ($vals | length)) {
    error make -u { msg: "unbalanced amount of keys and values" }
  }
  
  let buff = open -r $config_path

  for i in 0..(($keys | length) - 1) {
    let $buff = edit_buffer $buff ($keys | get $i) ($vals | get $i)
  }

  
}

def edit_buffer [
  buff: string, 
  key: string, 
  val: string
] string {
  let index = ($buff | lines | enumerate | find $key).0.index | inspect
  mut $local_buff = $buff 
  $local_buff = $local_buff | lines | update $index ([$key $val] | str join) | to text

  print $local_buff

  return $local_buff
}
