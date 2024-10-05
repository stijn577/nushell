def img [path: path = ./] {
	# construct path to glob pattern
	let path = [$path ./**/*]
		| path join
		| into glob

	# cache all files (otherwise we need to ls twice => becomes very slow from directories closer to /)
 	let files = ls -m $path
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
		| input list $"(ansi $catppuccin_macchiato_palette.mauve)What is the file extension you are looking for?(ansi reset)"
	
	# show only files that end with selected extension, pipe to fzf and wezterm to pick and display
	$files
		| filter { |file| $file | str ends-with $extension }
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
# 		| input list $"(ansi $catppuccin_macchiato_palette.mauve)What is the file extension you are looking for?(ansi reset)"
	
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
