

const catppuccin_macchiato_palette = {
    rosewater: "#f4dbd6"
    flamingo: "#f0c6c6"
    pink: "#f5bde6"
    mauve: "#c6a0f6"
    red: "#ed8796"
    maroon: "#ee99a0"
    peach: "#f5a97f"
    yellow: "#eed49f"
    green: "#a6da95"
    teal: "#8bd5ca"
    sky: "#91d7e3"
    sapphire: "#7dc4e4"
    blue: "#8aadf4"
    lavender: "#b7bdf8"
    text: "#cad3f5"
    subtext1: "#b8c0e0"
    subtext0: "#a5adcb"
    overlay2: "#939ab7"
    overlay1: "#8087a2"
    overlay0: "#6e738d"
    surface2: "#5b6078"
    surface1: "#494d64"
    surface0: "#363a4f"
    base: "#24273a"
    mantle: "#1e2030"
    crust: "#181926"
}

let catppuccin_macchiato_theme = {
    separator: $catppuccin_macchiato_palette.overlay0
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: $catppuccin_macchiato_palette.mauve attr: "b" }
    empty: $catppuccin_macchiato_palette.lavender
    bool: $catppuccin_macchiato_palette.lavender
    int: $catppuccin_macchiato_palette.peach
    duration: $catppuccin_macchiato_palette.text
    filesize: {|e|
          if $e < 1mb {
            $catppuccin_macchiato_palette.green
        } else if $e < 100mb {
            $catppuccin_macchiato_palette.yellow
        } else if $e < 500mb {
            $catppuccin_macchiato_palette.peach
        } else if $e < 800mb {
            $catppuccin_macchiato_palette.maroon
        } else if $e > 800mb {
            $catppuccin_macchiato_palette.red
        }
    }
    date: {|| (date now) - $in |
        if $in < 1hr {
            $catppuccin_macchiato_palette.green
        } else if $in < 1day {
            $catppuccin_macchiato_palette.yellow
        } else if $in < 3day {
            $catppuccin_macchiato_palette.peach
        } else if $in < 1wk {
            $catppuccin_macchiato_palette.maroon
        } else if $in > 1wk {
            $catppuccin_macchiato_palette.red
        }
    }
    range: $catppuccin_macchiato_palette.text
    float: $catppuccin_macchiato_palette.text
    string: $catppuccin_macchiato_palette.text
    nothing: $catppuccin_macchiato_palette.text
    binary: $catppuccin_macchiato_palette.text
    cellpath: $catppuccin_macchiato_palette.text
    row_index: { fg: $catppuccin_macchiato_palette.blue attr: "b" }
    record: $catppuccin_macchiato_palette.text
    list: $catppuccin_macchiato_palette.text
    block: $catppuccin_macchiato_palette.text
    hints: $catppuccin_macchiato_palette.overlay1
    search_result: { fg: $catppuccin_macchiato_palette.red bg: $catppuccin_macchiato_palette.text }

    shape_and: { fg: $catppuccin_macchiato_palette.pink attr: "b" }
    shape_binary: { fg: $catppuccin_macchiato_palette.pink attr: "b" }
    shape_block: { fg: $catppuccin_macchiato_palette.blue attr: "b" }
    shape_bool: $catppuccin_macchiato_palette.teal
    shape_custom: $catppuccin_macchiato_palette.green
    shape_datetime: { fg: $catppuccin_macchiato_palette.teal attr: "b" }
    shape_directory: $catppuccin_macchiato_palette.teal
    shape_external: $catppuccin_macchiato_palette.teal
    shape_externalarg: { fg: $catppuccin_macchiato_palette.green attr: "b" }
    shape_filepath: $catppuccin_macchiato_palette.teal
    shape_flag: { fg: $catppuccin_macchiato_palette.blue attr: "b" }
    shape_float: { fg: $catppuccin_macchiato_palette.pink attr: "b" }
    shape_garbage: { fg: $catppuccin_macchiato_palette.text bg: $catppuccin_macchiato_palette.red attr: "b" }
    shape_globpattern: { fg: $catppuccin_macchiato_palette.teal attr: "b" }
    shape_int: { fg: $catppuccin_macchiato_palette.pink attr: "b" }
    shape_internalcall: { fg: $catppuccin_macchiato_palette.teal attr: "b" }
    shape_list: { fg: $catppuccin_macchiato_palette.teal attr: "b" }
    shape_literal: $catppuccin_macchiato_palette.blue
    shape_match_pattern: $catppuccin_macchiato_palette.green
    shape_matching_brackets: { attr: "u" }
    shape_nothing: $catppuccin_macchiato_palette.teal
    shape_operator: $catppuccin_macchiato_palette.peach
    shape_or: { fg: $catppuccin_macchiato_palette.pink attr: "b" }
    shape_pipe: { fg: $catppuccin_macchiato_palette.pink attr: "b" }
    shape_range: { fg: $catppuccin_macchiato_palette.peach attr: "b" }
    shape_record: { fg: $catppuccin_macchiato_palette.teal attr: "b" }
    shape_redirection: { fg: $catppuccin_macchiato_palette.pink attr: "b" }
    shape_signature: { fg: $catppuccin_macchiato_palette.green attr: "b" }
    shape_string: $catppuccin_macchiato_palette.green
    shape_string_interpolation: { fg: $catppuccin_macchiato_palette.teal attr: "b" }
    shape_table: { fg: $catppuccin_macchiato_palette.blue attr: "b" }
    shape_variable: $catppuccin_macchiato_palette.pink

    background: $catppuccin_macchiato_palette.base
    foreground: $catppuccin_macchiato_palette.text
    cursor: $catppuccin_macchiato_palette.blue
}
