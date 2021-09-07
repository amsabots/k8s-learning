FROM node:16-alpine3.11 as Build

WORKDIR /k8s

RUN echo "installing typescript inside the container directory"
RUN npm install -g typescript

COPY *.json ./
COPY src ./src

RUN npm install
RUN echo "All files have been copied" && rm package-lock.json && ls 
RUN tsc

FROM node:16-alpine3.11
WORKDIR /app

COPY *.json ./
COPY public ./public

COPY --from=Build /k8s/dist ./dist



RUN  ls
RUN npm install

EXPOSE 4000

RUN rm package-lock.json && ls

CMD [ "npm", "start" ]

