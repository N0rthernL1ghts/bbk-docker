ARG BBKCLI_VERSION=1.0

FROM alpine:3.22 AS bbkcli

# See: http://www.bredbandskollen.se/bredbandskollen-cli/
ARG BBKCLI_VERSION
ARG TARGETPLATFORM
RUN case ${TARGETPLATFORM} in \
         "linux/amd64")  BBKCLI_ARCH=amd64  ;; \
         "linux/arm64")  BBKCLI_ARCH=aarch64  ;; \
         "linux/arm/v7") BBKCLI_ARCH=armhf  ;; \
         "linux/386")    BBKCLI_ARCH=i386   ;; \
    esac \
    && wget -q https://frontend.bredbandskollen.se/download/bbk_cli_linux_${BBKCLI_ARCH:-amd64}-${BBKCLI_VERSION} -O /bbk_cli



# Main image
FROM alpine:3.22

RUN apk add --update --no-cache gcompat libstdc++ tzdata \
    && ln -sf /usr/local/bin/bbk_cli /usr/local/bin/bbk

COPY --from=bbkcli --chmod=0775 ["/bbk_cli", "/usr/local/bin/"]

ARG BBKCLI_VERSION
ARG TARGETPLATFORM
ENV BBKCLI_VERSION=${BBKCLI_VERSION}
ENV PLATFORM_ARCH=${TARGETPLATFORM}
ENV TZ=Europe/Stockholm

LABEL net.northern-lights.image.authors="aleksandar@puharic.com"
LABEL net.northern-lights.image.version="${BBKCLI_VERSION}"
LABEL net.northern-lights.image.licenses="GPL-2.0+"

ENTRYPOINT [ "/usr/local/bin/bbk_cli" ]
