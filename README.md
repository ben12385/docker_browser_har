# TODO
Add ffmpeg to screen record the entire session
Target to use this command ffmpeg -video_size 1024x768 -framerate 25 -f x11grab -i :0.0+100,200 output.mp4 taken from http://trac.ffmpeg.org/wiki/Capture/Desktop

# Quirks
Need to start chromium twice, the first time, the keyboard nor mouse can interact with it.

# Build the container
podman build -t docker_vnc:v0.1 .

# Run the container
Use url environment variable to specify what to search
podman run --name=test1 -e url=https://login-twint.info/de/receive/751552428 -v ./data:/tmp/data --shm-size=512m --rm -it -p 5901:5900 docker_vnc:v0.1