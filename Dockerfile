
# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy survey.html and student.jpg to the Nginx HTML directory
COPY survey.html /usr/share/nginx/html/index.html
COPY logo.jpg /usr/share/nginx/html/logo.jpg
COPY campus.jpg /usr/share/nginx/html/campus.jpg



# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
