#!/bin/bash

# Check if a video device exists
if [ -e /dev/video0 ]; then
	echo 0
else
	echo 1
fi

# # Check if a video device exists
# if [ -e /dev/video0 ]; then
# 	video_block=false
# else
# 	video_block=true
# fi
#
# # Check if the microphone is muted
# if [ "$(ags -b hypr -r 'audio.microphone.isMuted')" == "true" ]; then
# 	mic_muted=true
# else
# 	mic_muted=false
# fi
#
# # Determine the block color
# if [ "$video_block" = false ]; then
# 	block_color="'#00ff00'" # Green
# elif [ "$mic_muted" = false ] && [ "$video_block" = true ]; then
# 	block_color="'#ffa000'" # Orange
# else
# 	block_color="'#484544'" # Grey
# fi
#
# printf "$block_color"
