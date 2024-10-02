
const catppuccin_mocha_palette = {
    rosewater: "#f5e0dc"
    flamingo: "#f2cdcd"
    pink: "#f5c2e7"
    mauve: "#cba6f7"
    red: "#f38ba8"
    maroon: "#eba0ac"
    peach: "#fab387"
    yellow: "#f9e2af"
    green: "#a6e3a1"
    teal: "#94e2d5"
    sky: "#89dceb"
    sapphire: "#74c7ec"
    blue: "#89b4fa"
    lavender: "#b4befe"
    text: "#cdd6f4"
    subtext1: "#bac2de"
    subtext0: "#a6adc8"
    overlay2: "#9399b2"
    overlay1: "#7f849c"
    overlay0: "#6c7086"
    surface2: "#585b70"
    surface1: "#45475a"
    surface0: "#313244"
    base: "#1e1e2e"
    mantle: "#181825"
    crust: "#11111b"
}

let catppuccin_mocha = {
    separator: $catppuccin_mocha_palette.overlay0
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: $catppuccin_mocha_palette.mauve attr: "b" }
    empty: $catppuccin_mocha_palette.lavender
    bool: $catppuccin_mocha_palette.lavender
    int: $catppuccin_mocha_palette.peach
    duration: $catppuccin_mocha_palette.text
    filesize: {|e|
          if $e < 1mb {
            $catppuccin_mocha_palette.green
        } else if $e < 100mb {
            $catppuccin_mocha_palette.yellow
        } else if $e < 500mb {
            $catppuccin_mocha_palette.peach
        } else if $e < 800mb {
            $catppuccin_mocha_palette.maroon
        } else if $e > 800mb {
            $catppuccin_mocha_palette.red
        }
    }
    date: {|| (date now) - $in |
        if $in < 1hr {
            $catppuccin_mocha_palette.green
        } else if $in < 1day {
            $catppuccin_mocha_palette.yellow
        } else if $in < 3day {
            $catppuccin_mocha_palette.peach
        } else if $in < 1wk {
            $catppuccin_mocha_palette.maroon
        } else if $in > 1wk {
            $catppuccin_mocha_palette.red
        }
    }
    range: $catppuccin_mocha_palette.text
    float: $catppuccin_mocha_palette.text
    string: $catppuccin_mocha_palette.text
    nothing: $catppuccin_mocha_palette.text
    binary: $catppuccin_mocha_palette.text
    cellpath: $catppuccin_mocha_palette.text
    row_index: { fg: $catppuccin_mocha_palette.blue attr: "b" }
    record: $catppuccin_mocha_palette.text
    list: $catppuccin_mocha_palette.text
    block: $catppuccin_mocha_palette.text
    hints: $catppuccin_mocha_palette.overlay1
    search_result: { fg: $catppuccin_mocha_palette.red bg: $catppuccin_mocha_palette.text }

    shape_and: { fg: $catppuccin_mocha_palette.pink attr: "b" }
    shape_binary: { fg: $catppuccin_mocha_palette.pink attr: "b" }
    shape_block: { fg: $catppuccin_mocha_palette.blue attr: "b" }
    shape_bool: $catppuccin_mocha_palette.teal
    shape_custom: $catppuccin_mocha_palette.green
    shape_datetime: { fg: $catppuccin_mocha_palette.teal attr: "b" }
    shape_directory: $catppuccin_mocha_palette.teal
    shape_external: $catppuccin_mocha_palette.teal
    shape_externalarg: { fg: $catppuccin_mocha_palette.green attr: "b" }
    shape_filepath: $catppuccin_mocha_palette.teal
    shape_flag: { fg: $catppuccin_mocha_palette.blue attr: "b" }
    shape_float: { fg: $catppuccin_mocha_palette.pink attr: "b" }
    shape_garbage: { fg: $catppuccin_mocha_palette.text bg: $catppuccin_mocha_palette.red attr: "b" }
    shape_globpattern: { fg: $catppuccin_mocha_palette.teal attr: "b" }
    shape_int: { fg: $catppuccin_mocha_palette.pink attr: "b" }
    shape_internalcall: { fg: $catppuccin_mocha_palette.teal attr: "b" }
    shape_list: { fg: $catppuccin_mocha_palette.teal attr: "b" }
    shape_literal: $catppuccin_mocha_palette.blue
    shape_match_pattern: $catppuccin_mocha_palette.green
    shape_matching_brackets: { attr: "u" }
    shape_nothing: $catppuccin_mocha_palette.teal
    shape_operator: $catppuccin_mocha_palette.peach
    shape_or: { fg: $catppuccin_mocha_palette.pink attr: "b" }
    shape_pipe: { fg: $catppuccin_mocha_palette.pink attr: "b" }
    shape_range: { fg: $catppuccin_mocha_palette.peach attr: "b" }
    shape_record: { fg: $catppuccin_mocha_palette.teal attr: "b" }
    shape_redirection: { fg: $catppuccin_mocha_palette.pink attr: "b" }
    shape_signature: { fg: $catppuccin_mocha_palette.green attr: "b" }
    shape_string: $catppuccin_mocha_palette.green
    shape_string_interpolation: { fg: $catppuccin_mocha_palette.teal attr: "b" }
    shape_table: { fg: $catppuccin_mocha_palette.blue attr: "b" }
    shape_variable: $catppuccin_mocha_palette.pink

    background: $catppuccin_mocha_palette.base
    foreground: $catppuccin_mocha_palette.text
    cursor: $catppuccin_mocha_palette.blue
}
