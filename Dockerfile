FROM node:20-bookworm

WORKDIR /app

# Instala dependências nativas necessárias (para better-sqlite3 e afins)
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]