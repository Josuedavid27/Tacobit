FROM ruby:3.4.4-slim

# Instalar dependencias necesarias
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    libyaml-dev \
    pkg-config \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Copiar gemfile y lock antes de instalar gems
COPY Gemfile Gemfile.lock ./

# Instalar Bundler y dependencias
RUN gem install bundler:2.6.9
RUN bundle install

# Copiar todo el código fuente
COPY . .

# Precompilar assets o lo que necesites luego (si aplica)
