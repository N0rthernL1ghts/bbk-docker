ARG BBKCLI_VERSION=1.0
FROM scratch AS bbkcli

# See: http://www.bredbandskollen.se/bredbandskollen-cli/
ARG BBKCLI_VERSION
ADD ["https://frontend.bredbandskollen.se/download/bbk_cli_linux_amd64-${BBKCLI_VERSION}", "/bbk_cli"]



# Main image
FROM alpine:3.16

LABEL net.northern-lights.image.authors="aleksandar@puharic.com"
LABEL net.northern-lights.image.version="${BBKCLI_VERSION}"
LABEL net.northern-lights.image.licenses="GPL-2.0+"

RUN apk add --update --no-cache gcompat libstdc++ tzdata \
    && ln -sf /usr/local/bin/bbk_cli /usr/local/bin/bbk

COPY --from=bbkcli --chmod=0775 ["/bbk_cli", "/usr/local/bin/"]

ARG BBKCLI_VERSION
ENV BBKCLI_VERSION=${BBKCLI_VERSION}
ENV TZ=Europe/Stockholm
