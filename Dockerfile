FROM alpine:3.6
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.18.33 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
RUN mkdir -p /.kube
RUN chmod 666 /.kube
VOLUME /root/.aws
VOLUME /project
VOLUME /project/.kube
WORKDIR /project
ENTRYPOINT ["aws"]
