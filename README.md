# What is it?

In one sentence, it is a [docker](https://www.docker.com/) container image with a pre-installed version of [yaafe](http://yaafe.sourceforge.net/index.html).
Yaafe can be quite complicated to build and the process varies from one os/distro to another. With this docker 
container you get a shared workspace between your host and container, all the yaafe commands are executed in the container
and the results are saved in the shared workspace. 

# How to use it

## Build the docker image

To build the docker container image, assuming that you have a working docker setup, do:

```
make build
```

## Extract features

As an example, we can extract the MFCCs and the SpectralFlatness from the provided sample wave files by doing:

```
./yaafe -c featureplan -r 44100 wav_samples/*
```

The output on the host side will look like this:

```
Kawai-K3-Strings-C5.wav
Kawai-K3-Strings-C5.wav.mfcc.csv
Kawai-K3-Strings-C5.wav.spectral_flatness.csv
Low-Conga-1.wav
Low-Conga-1.wav.mfcc.csv
Low-Conga-1.wav.spectral_flatness.csv
```

The featureplan config file contains the definitions of the features we want to extract from the audio files 
(the format is documented under http://yaafe.sourceforge.net/manual/quickstart.html#feature-definition-format):

```
mfcc: MFCC
spectral_flatness: SpectralFlatness
```
