FROM debian:9

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get install -y apt-utils wget gpg

# Prerequisites
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg \
    && mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ \
    && wget -q https://packages.microsoft.com/config/debian/9/prod.list \
    && mv prod.list /etc/apt/sources.list.d/microsoft-prod.list \
    && chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg \
    && chown root:root /etc/apt/sources.list.d/microsoft-prod.list
    
# Install .NET Core SDK 2.2
RUN apt-get install -y apt-transport-https \
    && apt-get update -y \
    && apt-get install -y dotnet-runtime-2.2
   
# Cleanup
RUN apt-get autoremove -y \
    && apt-get clean
    
# Setup home
WORKDIR /home
ENV HOME /home

ENTRYPOINT ["./run.sh"]
