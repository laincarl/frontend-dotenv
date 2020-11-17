# => Run container
FROM nginx:1.15.2-alpine

# Static build
COPY ./build /usr/share/nginx/html/
# Default port exposure
EXPOSE 80
# Copy .env file and shell script to container
WORKDIR /usr/share/nginx/html
COPY ./env.sh .
COPY .env .

# Add bash
# RUN apk add --no-cache bash
# Add bash
RUN apk add --no-cache bash
# Make our shell script executable
RUN chmod +x /usr/share/nginx/html/env.sh

# Start Nginx server
CMD ["/bin/bash", "-c", "/usr/share/nginx/html/env.sh && nginx -g \"daemon off;\""]