FROM ghcr.io/triggerdotdev/trigger.dev:v4-beta

WORKDIR /app

COPY scripts/entrypoint.sh ./scripts/entrypoint.sh
RUN chmod +x ./scripts/entrypoint.sh

# Create shared directory manually
RUN mkdir -p /home/node/shared && chown -R node:node /home/node/shared

USER root
VOLUME ["/home/node/shared"]

EXPOSE 3000

CMD ["sh", "-c", "chown -R node:node /home/node/shared && exec ./scripts/entrypoint.sh"]