# bbk-docker
Docker build of Bredbandskollen's CLI client (bbk-cli) based on Alpine Linux

For more information, read on [here](http://www.bredbandskollen.se/bredbandskollen-cli/) and [here](https://github.com/dotse/bbk).  
Note that as of 2025-09, documentation still only refers to 1.0, while repository has moved on and latest version seems to be 1.2.2.  
  
This project, including bundled software is licensed under MIT license. See: [LICENSE](https://github.com/dotse/bbk/blob/master/src/LICENSE).  


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
