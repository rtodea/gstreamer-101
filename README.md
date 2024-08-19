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

```bash
export XDG_RUNTIME_DIR=/run/user/$(id -u)
./dist/basic-tutorial-1
```

## Passing sound to Docker

From [this article](https://prateeksrivastav598.medium.com/playing-sound-in-docker-containers-a-step-by-step-guide-f7a06e246a35):

```bash
docker run --rm -it --privileged=true --device=/dev/snd:/dev/snd audio-container:v1
```

Sample `MP3` file:

```bash
wget https://file-examples.com/storage/fe7f535b0666c2bb496169e/2017/11/file_example_MP3_700KB.mp3
```

```bash
mpg123 file_example_MP3_700KB.mp3
```

Error on Windows:

```txt
[src/libout123/modules/portaudio.c:120] error: Failed to open PortAudio default stream: Device unavailable
main: [src/mpg123.c:313] error: out123 error 7: failed to open device
```

Some other references:

1. https://stackoverflow.com/questions/28985714/run-apps-using-audio-in-a-docker-container?rq=3
