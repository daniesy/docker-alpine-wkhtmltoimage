FROM madnight/alpine-wkhtmltopdf-builder:0.12.5-alpine3.10-712635788 as wkhtmltopdf

FROM alpine as app

#install wkhtmltopdf for required libs
RUN apk add wkhtmltopdf libx11 ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-linux-libertine ttf-ubuntu-font-family
#copy patch qt execs from other repo
COPY --from=wkhtmltopdf /bin/wkhtmltoimage /usr/bin/wkhtmltoimage

WORKDIR /data

ENTRYPOINT ["wkhtmltoimage"]