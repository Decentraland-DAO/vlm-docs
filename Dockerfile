FROM node:latest

LABEL description="VLM Docs Page"
WORKDIR /docs
RUN npm install -g docsify-cli@latest
EXPOSE 3000
ENTRYPOINT ["docsify", "serve", "."]
