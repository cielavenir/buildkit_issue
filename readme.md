## buildkit\_issue

test.sh does not run if either buildkit namespace or nerdctl namespace is not `buildkit`.

## log

buildkit namespace=default, nerdctl namespace=default

```
[+] Building 2.9s (4/5)                                                                                                                                                                                            
 => [internal] load build definition from Dockerfile                                                                                                                                                          0.1s
 => => transferring dockerfile: 73B                                                                                                                                                                           0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                                                                                                              2.4s
 => [internal] load .dockerignore                                                                                                                                                                             0.2s
 => => transferring context: 2B                                                                                                                                                                               0.0s
 => ERROR [1/2] FROM docker.io/library/alpine:latest@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978                                                                                  0.1s
 => => resolve docker.io/library/alpine:latest@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978                                                                                        0.1s
------
 > [1/2] FROM docker.io/library/alpine:latest@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978:
------
Dockerfile:1
--------------------
   1 | >>> FROM alpine:latest
   2 |     RUN touch /test1
   3 |     
--------------------
error: failed to solve: lease "8h6nvhvcnge5wwf9ntpxtvhor": not found
```

buildkit namespace=buildkit, nerdctl namespace=default

```
[+] Building 3.4s (6/6)                                                                                                                                                                                            
[+] Building 3.6s (6/6)                                                                                                                                                                                            
[+] Building 3.7s (6/6) FINISHED                                                                                                                                                                                   
 => [internal] load build definition from Dockerfile                                                                                                                                                          0.1s
 => => transferring dockerfile: 73B                                                                                                                                                                           0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                                                                                                              1.8s
 => [internal] load .dockerignore                                                                                                                                                                             0.1s
 => => transferring context: 2B                                                                                                                                                                               0.0s
 => [1/2] FROM docker.io/library/alpine:latest@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978                                                                                        0.1s
 => => resolve docker.io/library/alpine:latest@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978                                                                                        0.1s
 => [2/2] RUN touch /test1                                                                                                                                                                                    0.3s
 => exporting to docker image format                                                                                                                                                                          0.6s
 => => exporting layers                                                                                                                                                                                       0.3s
 => => exporting manifest sha256:f63ce0349805790d38d3873f1c210b83f6d552597661ebc0cc13b72b34778385                                                                                                             0.1s
 => => exporting config sha256:bfe154d4dd37f08cbdf67b34b764ab0e94f32938db67c8b66b026ff8cc018a10                                                                                                               0.1s
 => => sending tarball                                                                                                                                                                                        0.1s
[+] Building 0.3s (2/2) FINISHED                                                                                                                                                                                   
 => [internal] load build definition from Dockerfile                                                                                                                                                          0.0s
 => => transferring dockerfile: 79B                                                                                                                                                                           0.0s
 => ERROR [internal] load metadata for docker.io/library/alpine:nonexisting1                                                                                                                                  0.2s
------
 > [internal] load metadata for docker.io/library/alpine:nonexisting1:
------
Dockerfile:1
--------------------
   1 | >>> FROM alpine:nonexisting1
   2 |     RUN touch /test2
   3 |     
--------------------
error: failed to solve: alpine:nonexisting1: docker.io/library/alpine:nonexisting1: not found
FATA[0000] no image was built 
```

buildkit namespace=buildkit, nerdctl namespace=buildkit

```
[+] Building 2.4s (6/6) FINISHED                                                                                                                                                                                   
 => [internal] load build definition from Dockerfile                                                                                                                                                          0.0s
 => => transferring dockerfile: 73B                                                                                                                                                                           0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                                                                                                              1.9s
 => [internal] load .dockerignore                                                                                                                                                                             0.0s
 => => transferring context: 2B                                                                                                                                                                               0.0s
 => [1/2] FROM docker.io/library/alpine:latest@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978                                                                                        0.1s
 => => resolve docker.io/library/alpine:latest@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978                                                                                        0.1s
 => CACHED [2/2] RUN touch /test1                                                                                                                                                                             0.0s
 => exporting to image                                                                                                                                                                                        0.2s
 => => exporting layers                                                                                                                                                                                       0.0s
 => => exporting manifest sha256:f63ce0349805790d38d3873f1c210b83f6d552597661ebc0cc13b72b34778385                                                                                                             0.0s
 => => exporting config sha256:bfe154d4dd37f08cbdf67b34b764ab0e94f32938db67c8b66b026ff8cc018a10                                                                                                               0.0s
 => => naming to docker.io/library/alpine:nonexisting1                                                                                                                                                        0.0s
 => => unpacking to docker.io/library/alpine:nonexisting1                                                                                                                                                     0.1s
[+] Building 1.7s (6/6) FINISHED                                                                                                                                                                                   
 => [internal] load build definition from Dockerfile                                                                                                                                                          0.0s
 => => transferring dockerfile: 79B                                                                                                                                                                           0.0s
 => [internal] load metadata for docker.io/library/alpine:nonexisting1                                                                                                                                        0.3s
 => [internal] load .dockerignore                                                                                                                                                                             0.0s
 => => transferring context: 2B                                                                                                                                                                               0.0s
 => [1/2] FROM docker.io/library/alpine:nonexisting1@sha256:f63ce0349805790d38d3873f1c210b83f6d552597661ebc0cc13b72b34778385                                                                                  0.1s
 => => resolve docker.io/library/alpine:nonexisting1@sha256:f63ce0349805790d38d3873f1c210b83f6d552597661ebc0cc13b72b34778385                                                                                  0.0s
 => [2/2] RUN touch /test2                                                                                                                                                                                    0.3s
 => exporting to image                                                                                                                                                                                        0.5s
 => => exporting layers                                                                                                                                                                                       0.3s
 => => exporting manifest sha256:1c3383928a87e1de11aafe25996005722ff88c2ec8c0022db811d89001cf109e                                                                                                             0.1s
 => => exporting config sha256:ab2f305af8072e570e25a642e3d54dcbf5e1943150541c382d3862a00bca9a23                                                                                                               0.1s
 => => naming to docker.io/library/alpine:nonexisting2                                                                                                                                                        0.0s
 => => unpacking to docker.io/library/alpine:nonexisting2                                                                                                                                                     0.1s
```
