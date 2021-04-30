FROM ruby:2.5.1-slim

#instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential libpq-dev imagemagick curl

# Instalar o GNUPG
RUN apt-get install -y gnupg

#Instalar nodejs v8
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

#instalar  o yarn
RUN curl sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update &&  apt-get install -y yarn

#seta nosso path
ENV INSTALL_PATH /nosso_amigo_secreto
#cria nosso diretorio
RUN mkdir -p $INSTALL_PATH
#seta o nosso path como diretorio principal
WORKDIR $INSTALL_PATH
#copia o nosso gemfile para dentro do container
COPY Gemfile ./
#Seta o path para as gems
ENV BUNDLE_PATH /box
#copia nosso codigo para dentro do container
COPY . .