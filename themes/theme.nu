source ./catppuccin_latte.nu
source ./catppuccin_macchiato.nu
source ./catppuccin_mocha.nu
source ./rose_pine.nu

let palette = $catppuccin_mocha_palette
let theme = $catppuccin_mocha_theme

if $palette != $rose_pine_palette {
$env.FZF_DEFAULT_OPTS = $'--color=bg+:($palette.surface0),bg:-1,spinner:($palette.rosewater),hl:($palette.red) --color=fg:($palette.text),header:($palette.red),info:($palette.mauve),pointer:($palette.rosewater) --color=marker:($palette.lavender),fg+:($palette.text),prompt:($palette.mauve),hl+:($palette.red) --color=selected-bg:($palette.surface1)'
}

const color_config_strings = [
  [key val];
  ["Catppuccin Latte" {
    wezterm: ["\"Catppuccin Latte\""], 
    helix: ["catppuccin_latte"], 
    bat: ["\"Catppuccin Latte\""], 
    nushell: ["$catppuccin_latte_palette", "$catppuccin_latte_theme"],
    starship: ["catppuccin_latte"]
  }],
  ["Catppuccin Macchiato" { 
    wezterm: ["\"Catppuccin Macchiato\""], 
    helix: ["catppuccin_macchiato"], 
    bat: ["\"Catppuccin Macchiato\""], 
    nushell: ["$catppuccin_macchiato_palette", "$catppuccin_macchiato_theme"],
    starship: ["catppuccin_macchiato"]
  }],
  ["Catppuccin Mocha" {
    wezterm: ["\"Catppuccin Mocha\""], 
    helix: ["catppuccin_mocha"], 
    bat: ["\"Catppuccin Mocha\""], 
    nushell: ["$catppuccin_mocha_palette", "$catppuccin_mocha_theme"],
    starship: ["catppuccin_mocha"]
  }],
  ["Rose Pine" { 
    wezterm: ["\"rose-pine\""], 
    helix: ["rose_pine"], 
    bat: ["\"rose-pine\""], 
    nushell: ["$rose_pine_palette", "$rose_pine_theme"],
    starship: ["rose_pine"]
  }],
]

const color_config_paths = { 
  wezterm: { path: "~/.config/wezterm/wezterm.lua", keys: ["config.color_scheme = "] }, 
  helix: { path: "~/AppData/Roaming/helix/config.toml", keys: ["theme"] }, 
  bat: { path: "~/AppData/Roaming/bat/config", keys: ["--theme="] },
  nushell: { path: "~/AppData/Roaming/nushell/themes/theme.nu", keys: ["let palette = " "let theme = "] }
  starship: { path: "~/.config/starship/starship.toml", keys: ["palette"] }
}

def edit_buffer [buff: string, key: string, val: string]: any -> string {
  let index = ($buff | lines | enumerate | find $key).0.index 
  
  let buff = $buff | lines | update $index ([$key $val] | str join) | to text

  return $buff
}

def change_theme [key: string, nvals, fn: closure] {
  let config_path = $color_config_paths | get $key | get path | path expand
  let keys = $color_config_paths | get $key | get keys
  let vals = $nvals | get $key

  if not ($config_path | path exists) {
    error make -u { msg: $"config path ($config_path) does not exist" }
  }

  if not (($keys | length) == ($vals | length)) {
    error make -u { msg: "unbalanced amount of keys and values" }
  }

  mut conf = open $config_path
  for i in 0..(($keys | length) - 1) {
    $conf = do $fn $conf ($keys | get $i) ($vals | get $i)
  }
  $conf | save $config_path -f
}


def themux [] {
  let _change_by_key = {|conf key val|
    $conf
      | update $key $val
  }
  let _change_by_string = {|conf key val|
    let index = ($conf
      | lines
      | enumerate
      | find $key).0.index 

    $conf
      | lines
      | update $index ([$key $val]
      | str join)
      | to text
  }

 let theme_strings = $color_config_strings  
  | input list -d key --fuzzy
  | get val
  
  # ["wezterm" "helix" "bat" "nushell"] 
  #   | each {|key| _change_app_theme ($color_config_paths | get $key | get path | path expand) ($color_config_paths | get $key | get keys) ($theme_strings | get $key) }

  change_theme "wezterm" $theme_strings $_change_by_string
  change_theme "helix" $theme_strings $_change_by_key
  change_theme "bat" $theme_strings $_change_by_string
  change_theme "nushell" $theme_strings $_change_by_string
  change_theme "starship" $theme_strings $_change_by_key

  # _change_starship_theme ($color_config_paths | get starship | get path | path expand | inspect) ($theme_strings | get starship | path expand | inspect)
  # $color_config_paths | get starship | get path | path expand | open | update palette $theme_strings
  print "Change theme succesfully!"

  return 
}

