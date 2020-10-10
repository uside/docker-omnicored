FROM debian:stable-slim

ENV OMNICORE_VERSION=0.8.2
ENV OMNICORE_CHECKSUM=13fad4537f98ab5356454436df6a808995c2c462563d4256a191fea0f10458e9

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/OmniLayer/omnicore/releases/download/v${OMNICORE_VERSION}/omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${OMNICORE_CHECKSUM} omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp omnicore-${OMNICORE_VERSION}/bin/omnicored /usr/local/bin \
    && rm -rf omnicore-${OMNICORE_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/omnicored"]