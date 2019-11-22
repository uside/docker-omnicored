FROM debian:stable-slim

ENV OMNICORE_VERSION=0.7.0
ENV OMNICORE_CHECKSUM=db71b1e3f135bd713c8c8e91738834d538fad8a5676036aa6bbdb6f5197bbe59

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/OmniLayer/omnicore/releases/download/v${OMNICORE_VERSION}/omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${OMNICORE_CHECKSUM} omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp omnicore-${OMNICORE_VERSION}/bin/omnicored /usr/local/bin \
    && rm -rf omnicore-${OMNICORE_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/omnicored"]