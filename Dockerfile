# Starter image as node
FROM node:latest as node

# Install angular cli in container
RUN npm install -g @angular/cli

# Copy our app's source code
COPY ./app /app
WORKDIR /app

# Build our Angular app
RUN npm install
RUN ng build --prod

# Mark shell script as executable
RUN chmod a+x main.sh

# Launch the script
CMD './main.sh'
