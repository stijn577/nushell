# source "./themes/catppuccin_macchiato.nu"

def x86asm [input: path] {
    llvm-objdump.exe -d --x86-asm-syntax=intel a.exe -S --no-print-imm-hex --no-show-raw-insn 
        | save dump.asm -f
}


# Disassembles arm .elf files to assembly
# 
# This command takes in a path to the .elf file.
# After that it will prompt a couple questions:
#
# - Ask if you are demangling a C or Rust .elf
# - Ask if the output should be colored (this uses ansi color strings, so it will cause issues in e.g. VSCode)
# - Ask if you want to open the file in bat or save it to the disk under de 'asm' directory
def armasm [
    path: path = "./target/thumbv7em-none-eabihf/debug/app" # path to the .elf file
] {
    if not ($path | path exists) {
        error make -u { msg: "path does not exist" }
    }
    
    let default_flags = ["--architecture=arm" "--inlines" "--wide" "--source" "--demangle"]
    
    let demangle = [
            [key value]; 
            [Rust --demangle=rust] 
            [C --demangle=gnu-v3]
        ]
        | input list -d key $"(ansi $catppuccin_macchiato_palette.mauve)What is the original language of the .elf?(ansi reset) \(this helps with demangling\)"
        | get value

    let colors = [
            [key value]; 
            [Yes [--visualize-jumps=color --disassembler-color=on]] 
            [No [--visualize-jumps]]
        ] 
        | input list -d key $"(ansi $catppuccin_macchiato_palette.mauve)Do you want to colorize outputs?(ansi reset) \(coloring causes issues outside terminal\)"
        | get value

    print $"(ansi $catppuccin_macchiato_palette.mauve) Objdump will run with the following flags(ansi reset):" [$demangle ...$colors ...$default_flags]     
    
    ["Pipe to bat" "Save to file"] 
        | input list --index $"(ansi $catppuccin_macchiato_palette.mauve)What would you like to do?(ansi reset)"
        | match ($in) {
            0 => {
                arm-none-eabi-objdump ...$colors $demangle ...$default_flags -d $path
                    | bat
            },
            1 => {
                if not ("asm" | path exists) {
                    print "Asm directory doesn't exist, creating it now..."
                    mkdir asm
                }
            
                let save_name = ["./asm/", (input $"(ansi $catppuccin_macchiato_palette.mauve)What should the output file be called?(ansi reset) \(.out extension automatically used\) "), ".out"] 
                    | str join
            
                
                arm-none-eabi-objdump ...$colors $demangle ...$default_flags -d $path
                    | save $save_name -f

                print $"Saved to (ansi $catppuccin_macchiato_palette.mauve)'($save_name)'(ansi reset) succesfully!"
            }
        }
}

# def armrasm [path: path = "./target/thumbv8m.main-none-eabihf/debug/app",--save (-s), --bat] {
#     if not ($save) {
#         let out = arm-none-eabi-objdump -m arm --visualize-jumps=color --disassembler-color=on --demangle="rust" --inlines --wide --source --demangle -d $path
#         if ($bat) {
#             bat $out
#         } else {
#             $out
#         }
#     } else {
#         if not ($path | path exists) {
#             error make -u {msg: "path does not exist", }
#         }

#         # create asm directory if it doesn't exist, so save doesn't error 
#         if not ("asm" | path exists) {
#             mkdir asm
#         }

#         # dump the output from elf to an asm file
#         arm-none-eabi-objdump -m arm --visualize-jumps --demangle="rust" --inlines --wide --source --demangle -d $path | save (["./asm/asm_", ($path | path basename), ".out" ] | str join) -f
#     } 
# }

# def armcasm [path: path = "./target/thumbv8m.main-none-eabihf/debug/app",--save (-s), --bat] {
#     if not ($save) {
#         let out = arm-none-eabi-objdump -m arm --visualize-jumps=color --disassembler-color=on --demangle="gnu-v3" --inlines --wide --source --demangle -d $path
#         if ($bat) {
#             bat $out
#         } else {
#             $out
#         }
#     } else {
#         if not ($path | path exists) {
#             error make -u {msg: "path does not exist", }
#         }

#         # create asm directory if it doesn't exist, so save doesn't error 
#         if not ("asm" | path exists) {
#             mkdir asm
#         }

#         # dump the output from elf to an asm file
#         arm-none-eabi-objdump -m arm --visualize-jumps --demangle="gnu-v3" --inlines --wide --source --demangle -d $path | save (["./asm/asm_", ($path | path basename), ".out" ] | str join) -f
#     } 
# }

