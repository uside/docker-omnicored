FROM debian:stable-slim

ENV OMNICORE_VERSION=0.5.0
ENV OMNICORE_CHECKSUM=fd72e4c0b35684883ad20bac556ead57d9c6e63398b90f9734fd19c788bfe2f0

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/OmniLayer/omnicore/releases/download/v${OMNICORE_VERSION}/omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${OMNICORE_CHECKSUM} omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp omnicore-${OMNICORE_VERSION}/bin/omnicored /usr/local/bin \
    && rm -rf omnicore-${OMNICORE_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/omnicored"]