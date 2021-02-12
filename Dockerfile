FROM node:13

#Setting up Args
ARG POSTGRES_USERNAME
ARG POSTGRES_PASSWORD
ARG POSTGRES_HOST
ARG POSTGRES_DB
ARG AWS_BUCKET
ARG AWS_REGION
ARG AWS_PROFILE
ARG JWT_SECRET
ARG URL

#Setting up env variables
ENV POSTGRES_USERNAME=$POSTGRES_USERNAME
ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD
ENV POSTGRES_HOST=$POSTGRES_HOST
ENV POSTGRES_DB=$POSTGRES_DB
ENV AWS_BUCKET=$AWS_BUCKET
ENV AWS_REGION=$AWS_REGION
ENV AWS_PROFILE=$AWS_PROFILE
ENV JWT_SECRET=$JWT_SECRET
ENV URL=$URL

WORKDIR /usr/feed
COPY package*.json ./
RUN npm install
EXPOSE 8080
COPY . .
RUN npm run build
CMD ["node", "www/server.js"]