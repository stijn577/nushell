def stats [] {
	let avg = $in | math avg
	let stddev = $in | math stddev
	let median = $in | math median
	let n = $in | length
	return { avg: $avg, stddev: $stddev, median: $median, N: $n }
}

#FIXME: fix wezterm imgcat issues
def preview-file [file: string] {
	# bat --style=numbers --color=always ($file | str substring 1..)
	let file = $file | str substring 1..
	match ($file | path parse | get parent) {
		"images" => {
			chafa -f kitty --polite on $file -s 100x
			# wezterm imgcat $file
		},		
		_ => {
			bat --style=numbers --color=always $file
		}
	}
}

def preview [] {
	fzf --preview 'nu -l -c "preview-file {}"' --preview-window=right:65%:wrap | hx $in
}

# Display image in the terminal inline
#
# This script allows for rendering images in the terminal, first asking for what image extension you want to pick from.
# And then showing a fuzzy finder interface to select the image you want to display.
def img [
	path: path = ./ # path to image directly or path of scanning directory, the globbing of images will start here
	] {

	# display image and exit if file given directly
	if ($path | path type) == "file" {
		if (ls -m $path | where type =~ "image/" | is-not-empty) {
			wezterm imgcat $path --hold
		} else {
			error make -u { msg: "Path provided was a file, but not an image."}
		}
		return
	}

	# go to working directory
	cd $path
		
	# cache all files globbed from working directory (otherwise we need to ls twice => becomes very slow from directories closer to /)
 	let files = ls -m ("./**/*"| into glob)
		| where type =~ "image/" 
		| get name 

	# ask target extension from user
	let extension = $files
		| each { |line| $line | split row '.' | last } 
		| uniq
		| if ($in | is-empty) { 
				# return simple error message if no images were found in the path.
				error make -u { msg: "No images found in provided path." } 
			} else { 
				$in 
			}
		| input list $"(ansi $palette.mauve)What is the file extension you are looking for?(ansi reset)"
	
	# show only files that end with selected extension, pipe to fzf and wezterm to pick and display
	$files
		| where { |file| $file | str ends-with $extension }
		| to text 
		| fzf 
		| wezterm imgcat $in --hold
}

def --env yy [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

def scsv [file: path] {
	open $file --raw
		| str replace " -> " "," --all
		| str replace ($in | str substring 0..(($in | str index-of ",") - 1)) timestamp
		| from csv
}

def repattern [pattern: string, replace: string] {
  let input_files = ls ($"**/*($pattern)*" | into glob) | get name 
  let output_files = $input_files | each { $in | str replace $pattern $replace } 
  let pairs = $input_files | zip $output_files
  
  let table = $pairs | each { {inputs: $in.0, outputs: $in.1 }}
  print $table

  let moves = $pairs | each { mv $in.0 $in.1 }
}

# old implementation of img (slower)
# def img [path: path = ./] {
# 	# construct path to glob pattern
# 	let path = [$path ./**/*]
# 		| path join
# 		| into glob

# 	# extract all extensions and return them in an input list to choose from
#  	let extension = ls -m $path
# 		| where type =~ "image/" 
# 		| get name 
# 		| each { |line| $line | split row '.' | last } 
# 		| uniq
# 		| if ($in | is-empty) { 
# 				# return simple error message if no images were found in the path.
# 				error make -u { msg: "No images found in provided path." } 
# 			} else { 
# 				$in 
# 			}
# 		| input list $"(ansi $palette.mauve)What is the file extension you are looking for?(ansi reset)"
	
# 	# join path and extension and pipe into fzf to select image
# 	# then pipe into wezterm to display
# 	[$path . $extension] 
# 		| str join 
# 		| path expand 
# 		| into glob 
# 		| ls $in
# 		| get name 
# 		| to text 
# 		| fzf 
# 		| wezterm imgcat $in --hold
# }

def mirror [] {
	scrcpy --video-codec=h265 --render-driver=vulkan --video-buffer=50 --max-fps=60 -m1920 --audio-output-buffer=10 --no-control --print-fps --window-borderless -d --audio-dup
}
