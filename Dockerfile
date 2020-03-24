FROM debian:stable-slim

ENV OMNICORE_VERSION=0.8.0
ENV OMNICORE_CHECKSUM=9ecc6ba2b2e96075d69eb8abd8ac893d4cb2629a925cabf74c0e51b07159f95d

RUN apt-get update && apt-get install -y wget && apt-get clean
RUN wget https://github.com/OmniLayer/omnicore/releases/download/v${OMNICORE_VERSION}/omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz \
    && echo "${OMNICORE_CHECKSUM} omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz" | sha256sum -c \
    && tar -xzf omnicore-${OMNICORE_VERSION}-x86_64-linux-gnu.tar.gz \
    && cp omnicore-${OMNICORE_VERSION}/bin/omnicored /usr/local/bin \
    && rm -rf omnicore-${OMNICORE_VERSION} *.tar.gz

ENTRYPOINT ["/usr/local/bin/omnicored"]