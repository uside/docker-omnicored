FROM debian:stable-slim

ENV OMNICORE_VERSION=0.7.1
ENV OMNICORE_CHECKSUM=c2334e2d776ac0324c91f5e4fd631183e7ee2841ca47ad51d0048ce022e9cdf2

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/OmniLayer/omnicore/releases/download/v${OMNICORE_VERSION}/omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${OMNICORE_CHECKSUM} omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp omnicore-${OMNICORE_VERSION}/bin/omnicored /usr/local/bin \
    && rm -rf omnicore-${OMNICORE_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/omnicored"]