# bbk-docker
Docker build of Bredbandskollen's CLI client (bbk-cli) based on Alpine Linux

For more information, read on [here](http://www.bredbandskollen.se/bredbandskollen-cli/) and [here](https://github.com/dotse/bbk).  
Note that as of 2025-09, documentation still only refers to 1.0, while repository has moved on and latest version seems to be 1.2.2.  
[License](LICENSE) attached with this image doesn't apply to the software that is bundled in the image build.  
This repository is not distributing a copy of the software and therefore doesn't include copy of the [license](https://github.com/dotse/bbk/blob/master/src/LICENSE).  


#### Docker build


##### Images
```
nlss/bbk-cli:latest
nlss/bbk-cli:1.2
```

Image is tagged with software version. Image might be updated whilst version of the bundled software remains the same.  

##### Supported platforms
- linux/amd64
- linux/aarch64

Note: ARM support is questionable and untested.

##### Running
To run bbk cli, use this command:
```
docker run --init --rm -it nlss/bbk-cli
```

You can also supply arbitrary arguments like this:
```
docker run --init --rm -it nlss/bbk-cli --help
```
