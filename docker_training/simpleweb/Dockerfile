FROM node:14.17-alpine

COPY index.js .
COPY package.json .

# COPY . . => non car il faut exclure le dossier node_modules

RUN npm i

CMD ["node", "index.js"]