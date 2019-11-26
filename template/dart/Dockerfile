FROM openfaas/classic-watchdog:0.17.1 as watchdog

FROM google/dart

# Allows you to add additional packages via build-arg
ARG ADDITIONAL_PACKAGE

RUN apt-get update -qy \
    && apt-get install -qy ca-certificates ${ADDITIONAL_PACKAGE} --no-install-recommends \
    && apt-get clean \
&& rm -rf /var/lib/apt/lists/*

COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog
RUN chmod +x /usr/bin/fwatchdog

# Add non root user
RUN addgroup --system app && adduser --system --group app
RUN mkdir -p /home/app

WORKDIR /home/app
COPY bin /home/app/bin
COPY pubspec.yaml   .
RUN chown -R app /home/app

COPY function function

RUN pub get
RUN pub get --offline

WORKDIR /home/app/function/

RUN pub get && pub get --offline

RUN chown -R app /home/app

USER app

ENV fprocess="dart /home/app/bin/main.dart"
EXPOSE 8080

HEALTHCHECK --interval=3s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]
