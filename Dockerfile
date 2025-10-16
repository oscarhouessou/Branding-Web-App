# Utiliser une image légère de nginx
FROM nginx:alpine

# Copier les fichiers de l'application
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY app.js /usr/share/nginx/html/

# Exposer le port 8080 (requis par Cloud Run)
EXPOSE 8080

# Copier une configuration nginx personnalisée pour utiliser le port 8080
RUN echo 'server { \
    listen 8080; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf