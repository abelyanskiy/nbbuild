##
# Базовый образ Ubuntu Bionic
FROM ubuntu:18.04

##
# Установка базовых пакетов
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt --fix-missing -yq install -y tzdata python3-virtualenv git devscripts debhelper wget
##
# Устанавливаем временную зону
RUN cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime
COPY timezone /etc/timezone

##
# Конфигурация переменных окружения
ENV LANG "C.UTF-8"
ENV ANSIBLE_FORCE_COLOR 1

#Debug image entrypoint
CMD /bin/bash -c "while /bin/true; do sleep 1; done"

