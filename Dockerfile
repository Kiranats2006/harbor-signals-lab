FROM node:20-alpine
WORKDIR /app
RUN apk add --no-cache curl
COPY package.json ./
RUN npm install --omit=dev
COPY server.js ./
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=30s --retries=3 CMD curl -fsS http://localhost:8080/health || exit
CMD ["node", "server.js"]
