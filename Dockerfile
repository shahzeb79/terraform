# Use NGINX official image as the base image
FROM nginx:latest

# Create a non-root user and group with uid and gid 101
RUN addgroup --system --gid 101 nginx \
    && adduser --system --disabled-login --ingroup nginx --no-create-home --uid 101 nginx

# Update NGINX configuration to run as the non-root user
RUN sed -i 's/user\s*nginx;/user nginx nginx;/g' /etc/nginx/nginx.conf

# Create directory for HTML files and change ownership to non-root user
RUN mkdir -p /usr/share/nginx/html \
    && chown -R nginx:nginx /usr/share/nginx/html

# Copy HTML file into the NGINX document root
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start NGINX when the container launches
CMD ["nginx", "-g", "daemon off;"]
