# GStreamer Repository for Experiments

## Docker Integration

> TODO
> 
> _Add Notes_

## References

1. https://gstreamer.freedesktop.org/documentation/installing/on-linux.html?gi-language=c#InstallingonLinux-Build
2. https://gstreamer.freedesktop.org/documentation/tutorials/basic/concepts.html?gi-language=c

## Sample Run

```bash
mkdir dist
gcc src/basic-tutorial-2.c -o dist/basic-tutorial-2 `pkg-config --cflags --libs gstreamer-1.0`
```

```bash
export XDG_RUNTIME_DIR=/run/user/$(id -u)
./dist/basic-tutorial-2
```

## Passing sound to Docker

From [this article](https://prateeksrivastav598.medium.com/playing-sound-in-docker-containers-a-step-by-step-guide-f7a06e246a35):

```bash
docker run --rm -it --privileged=true --device=/dev/snd:/dev/snd audio-container:v1
```