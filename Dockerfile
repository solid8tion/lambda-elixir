ARG container=public.ecr.aws/lambda/provided:al2.2023.03.08.12
FROM ${container} AS base

ENV LANG C.UTF-8
ENV ERLANG_VERSION OTP-25.2.3
ENV ELIXIR_VERSION v1.14.3

WORKDIR /tmp

RUN yum -y groupinstall "Development Tools" && \
  yum -y install ncurses-devel openssl-devel && \
  git clone https://github.com/erlang/otp.git -b ${ERLANG_VERSION} && \
  cd otp && \
  ./otp_build autoconf && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  git clone https://github.com/elixir-lang/elixir.git -b ${ELIXIR_VERSION} && \
  cd elixir && \
  make && \
  make install
