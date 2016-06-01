FROM quay.io/mohammadmazraeh/debian

RUN apt-get update -qqy \
   && apt-get -qqy install \
     software-properties-common \
   && echo debconf shared/accepted-oracle-license-v1-1 \
       select true | debconf-set-selections \
   && echo debconf shared/accepted-oracle-license-v1-1 \
       seen true | debconf-set-selections \
   && add-apt-repository ppa:webupd8team/java \
   && apt-get update -qqy \
   && apt-get -qqy install \
     oracle-java8-installer \
   && sed -i 's/securerandom.source=file:\/dev\/urandom/securerandom.source=file:\/dev\/.\/urandom/g' \
        /usr/lib/jvm/java-8-oracle/jre/lib/security/java.security \
   && sed -i 's/securerandom.source=file:\/dev\/random/securerandom.source=file:\/dev\/.\/urandom/g' \
        /usr/lib/jvm/java-8-oracle/jre/lib/security/java.security \
   && rm -rf /var/lib/apt/lists/*
