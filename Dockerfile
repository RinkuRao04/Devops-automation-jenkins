FROM node:20.1.0 

# Set working directory to /app 
WORKDIR /app

# Copy package.json to /app
COPY package*.json ./

# copy dependencies . . means all files in current directory with node_modules and other files
COPY . .


# run npm install to install dependencies
RUN npm install

# expose port 3000
EXPOSE 3000


# npm run start to run the app
CMD [ "npm","run","start" ]

FROM nginx:latest
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
