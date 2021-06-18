# The first stage
# Build React static files
FROM node:13.12.0-alpine as build

WORKDIR /mondeique_dod/frontend
COPY ./dod-react-app/package.json ./
COPY ./dod-react-app/package-lock.json ./
RUN npm ci --silent
COPY ./dod-react-app/ ./
RUN npm run build

# The second stage
# Copy React static files and start nginx
FROM nginx:stable-alpine
COPY --from=build /mondeique_dod/frontend/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
