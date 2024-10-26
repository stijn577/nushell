

const catppuccin_latte_palette = {
    rosewater: "#dc8a78"
    flamingo: "#dd7878"
    pink: "#ea76cb"
    mauve: "#8839ef"
    red: "#d20f39"
    maroon: "#e64553"
    peach: "#fe640b"
    yellow: "#df8e1d"
    green: "#40a02b"
    teal: "#179299"
    sky: "#04a5e5"
    sapphire: "#209fb5"
    blue: "#1e66f5"
    lavender: "#7287fd"
    text: "#4c4f69"
    subtext1: "#5c5f77"
    subtext0: "#6c6f85"
    overlay2: "#7c7f93"
    overlay1: "#8c8fa1"
    overlay0: "#9ca0b0"
    surface2: "#acb0be"
    surface1: "#bcc0cc"
    surface0: "#ccd0da"
    base: "#eff1f5"
    mantle: "#e6e9ef"
    crust: "#dce0e8"
}

let catppuccin_latte_theme = {
    separator: $catppuccin_latte_palette.overlay0
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: $catppuccin_latte_palette.mauve attr: "b" }
    empty: $catppuccin_latte_palette.lavender
    bool: $catppuccin_latte_palette.lavender
    int: $catppuccin_latte_palette.peach
    duration: $catppuccin_latte_palette.text
    filesize: {|e|
          if $e < 1mb {
            $catppuccin_latte_palette.green
        } else if $e < 100mb {
            $catppuccin_latte_palette.yellow
        } else if $e < 500mb {
            $catppuccin_latte_palette.peach
        } else if $e < 800mb {
            $catppuccin_latte_palette.maroon
        } else if $e > 800mb {
            $catppuccin_latte_palette.red
        }
    }
    date: {|| (date now) - $in |
        if $in < 1hr {
            $catppuccin_latte_palette.green
        } else if $in < 1day {
            $catppuccin_latte_palette.yellow
        } else if $in < 3day {
            $catppuccin_latte_palette.peach
        } else if $in < 1wk {
            $catppuccin_latte_palette.maroon
        } else if $in > 1wk {
            $catppuccin_latte_palette.red
        }
    }
    range: $catppuccin_latte_palette.text
    float: $catppuccin_latte_palette.text
    string: $catppuccin_latte_palette.text
    nothing: $catppuccin_latte_palette.text
    binary: $catppuccin_latte_palette.text
    cellpath: $catppuccin_latte_palette.text
    row_index: { fg: $catppuccin_latte_palette.blue attr: "b" }
    record: $catppuccin_latte_palette.text
    list: $catppuccin_latte_palette.text
    block: $catppuccin_latte_palette.text
    hints: $catppuccin_latte_palette.overlay1
    search_result: { fg: $catppuccin_latte_palette.red bg: $catppuccin_latte_palette.text }

    shape_and: { fg: $catppuccin_latte_palette.pink attr: "b" }
    shape_binary: { fg: $catppuccin_latte_palette.pink attr: "b" }
    shape_block: { fg: $catppuccin_latte_palette.blue attr: "b" }
    shape_bool: $catppuccin_latte_palette.teal
    shape_custom: $catppuccin_latte_palette.green
    shape_datetime: { fg: $catppuccin_latte_palette.teal attr: "b" }
    shape_directory: $catppuccin_latte_palette.teal
    shape_external: $catppuccin_latte_palette.teal
    shape_externalarg: { fg: $catppuccin_latte_palette.green attr: "b" }
    shape_filepath: $catppuccin_latte_palette.teal
    shape_flag: { fg: $catppuccin_latte_palette.blue attr: "b" }
    shape_float: { fg: $catppuccin_latte_palette.pink attr: "b" }
    shape_garbage: { fg: $catppuccin_latte_palette.text bg: $catppuccin_latte_palette.red attr: "b" }
    shape_globpattern: { fg: $catppuccin_latte_palette.teal attr: "b" }
    shape_int: { fg: $catppuccin_latte_palette.pink attr: "b" }
    shape_internalcall: { fg: $catppuccin_latte_palette.teal attr: "b" }
    shape_list: { fg: $catppuccin_latte_palette.teal attr: "b" }
    shape_literal: $catppuccin_latte_palette.blue
    shape_match_pattern: $catppuccin_latte_palette.green
    shape_matching_brackets: { attr: "u" }
    shape_nothing: $catppuccin_latte_palette.teal
    shape_operator: $catppuccin_latte_palette.peach
    shape_or: { fg: $catppuccin_latte_palette.pink attr: "b" }
    shape_pipe: { fg: $catppuccin_latte_palette.pink attr: "b" }
    shape_range: { fg: $catppuccin_latte_palette.peach attr: "b" }
    shape_record: { fg: $catppuccin_latte_palette.teal attr: "b" }
    shape_redirection: { fg: $catppuccin_latte_palette.pink attr: "b" }
    shape_signature: { fg: $catppuccin_latte_palette.green attr: "b" }
    shape_string: $catppuccin_latte_palette.green
    shape_string_interpolation: { fg: $catppuccin_latte_palette.teal attr: "b" }
    shape_table: { fg: $catppuccin_latte_palette.blue attr: "b" }
    shape_variable: $catppuccin_latte_palette.pink

    background: $catppuccin_latte_palette.base
    foreground: $catppuccin_latte_palette.text
    cursor: $catppuccin_latte_palette.blue
}
