FROM alpine:latest AS alpine
RUN apk add --no-cache tzdata ca-certificates

FROM scratch AS none

FROM scratch AS t
COPY --from=alpine /usr/share/zoneinfo /usr/share/zoneinfo

FROM scratch AS c
COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

FROM scratch AS cc
COPY --from=alpine /etc/ssl/certs/ /etc/ssl/certs/

FROM scratch AS tc
COPY --from=alpine /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

FROM scratch AS tcc
COPY --from=alpine /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=alpine /etc/ssl/certs/ /etc/ssl/certs/
