FROM debian:testing
LABEL maintainer "Rasmus <docker@pank.eu>"

LABEL version="0.9.1"

ENV DEBIAN_FRONTEND noninteractive

# Install all TeX and LaTeX dependences
RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
  make \
  wget \
  emacs-nox \
  ca-certificates \
  texlive-latex-base \
  texlive-generic-extra \
  texlive-fonts-extra \
  texlive-fonts-recommended \
  texlive-generic-recommended \
  texlive-lang-english \
  texlive-latex-extra \
  texlive-bibtex-extra \
  biber \
  fontconfig \
  texlive-luatex \
  texlive-xetex && \
  apt-get autoclean && apt-get --purge --yes autoremove && apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Export the output data
WORKDIR /data
VOLUME ["/data"]

