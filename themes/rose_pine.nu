const rose_pine_palette = {
  base: "#191724"
  surface: "#1f1d2e"
  overlay: "#26233a"
  muted: "#6e6a86"
  subtle: "#908caa" 
  text: "#e0def4"
  love: "#eb6f92"
  gold: "#f6c177"
  rose: "#ebbcba"
  pine: "#31748f"
  foam: "#9ccfd8"
  iris: "#c4a7e7"
  highlight_low: "#21202e"
  highlight_med: "#403d52"
  highlight_high: "#524f67"
}

let rose_pine_theme = {
    separator: $rose_pine_palette.pine
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: $rose_pine_palette.iris attr: "b" }
    empty: $rose_pine_palette.pine
    bool: $rose_pine_palette.pine
    int: $rose_pine_palette.gold
    duration: $rose_pine_palette.text
    filesize: {|e|
          if $e < 1mb {
            $rose_pine_palette.foam
        } else if $e < 100mb {
            $rose_pine_palette.gold
        } else if $e < 500mb {
            $rose_pine_palette.gold
        } else if $e < 800mb {
            $rose_pine_palette.love
        } else if $e > 800mb {
            $rose_pine_palette.love
        }
    }
    date: {|| (date now) - $in |
        if $in < 1hr {
            $rose_pine_palette.foam
        } else if $in < 1day {
            $rose_pine_palette.gold
        } else if $in < 3day {
            $rose_pine_palette.gold
        } else if $in < 1wk {
            $rose_pine_palette.love
        } else if $in > 1wk {
            $rose_pine_palette.love
        }
    }
    range: $rose_pine_palette.text
    float: $rose_pine_palette.text
    string: $rose_pine_palette.text
    nothing: $rose_pine_palette.text
    binary: $rose_pine_palette.text
    cellpath: $rose_pine_palette.text
    row_index: { fg: $rose_pine_palette.pine attr: "b" }
    record: $rose_pine_palette.text
    list: $rose_pine_palette.text
    block: $rose_pine_palette.text
    hints: $rose_pine_palette.subtle
    search_result: { fg: $rose_pine_palette.love bg: $rose_pine_palette.text }

    shape_and: { fg: $rose_pine_palette.rose attr: "b" }
    shape_binary: { fg: $rose_pine_palette.rose attr: "b" }
    shape_block: { fg: $rose_pine_palette.pine attr: "b" }
    shape_bool: $rose_pine_palette.foam
    shape_custom: $rose_pine_palette.foam
    shape_datetime: { fg: $rose_pine_palette.foam attr: "b" }
    shape_directory: $rose_pine_palette.foam
    shape_external: $rose_pine_palette.foam
    shape_externalarg: { fg: $rose_pine_palette.foam attr: "b" }
    shape_filepath: $rose_pine_palette.foam
    shape_flag: { fg: $rose_pine_palette.pine attr: "b" }
    shape_float: { fg: $rose_pine_palette.rose attr: "b" }
    shape_garbage: { fg: $rose_pine_palette.text bg: $rose_pine_palette.love attr: "b" }
    shape_globpattern: { fg: $rose_pine_palette.foam attr: "b" }
    shape_int: { fg: $rose_pine_palette.rose attr: "b" }
    shape_internalcall: { fg: $rose_pine_palette.foam attr: "b" }
    shape_list: { fg: $rose_pine_palette.foam attr: "b" }
    shape_literal: $rose_pine_palette.pine
    shape_match_pattern: $rose_pine_palette.foam
    shape_matching_brackets: { attr: "u" }
    shape_nothing: $rose_pine_palette.foam
    shape_operator: $rose_pine_palette.gold
    shape_or: { fg: $rose_pine_palette.rose attr: "b" }
    shape_pipe: { fg: $rose_pine_palette.rose attr: "b" }
    shape_range: { fg: $rose_pine_palette.gold attr: "b" }
    shape_record: { fg: $rose_pine_palette.foam attr: "b" }
    shape_redirection: { fg: $rose_pine_palette.rose attr: "b" }
    shape_signature: { fg: $rose_pine_palette.foam attr: "b" }
    shape_string: $rose_pine_palette.foam
    shape_string_interpolation: { fg: $rose_pine_palette.foam attr: "b" }
    shape_table: { fg: $rose_pine_palette.pine attr: "b" }
    shape_variable: $rose_pine_palette.rose

    background: $rose_pine_palette.base
    foreground: $rose_pine_palette.text
    cursor: $rose_pine_palette.pine
}
