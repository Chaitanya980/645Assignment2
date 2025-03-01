
# Use the pre-built image from Docker Hub as the base image
FROM chaitanyachaudhari07/survey-web-app:latest

# Expose port 80 to make your web server accessible
EXPOSE 80

# Start the application (if needed, ensure your entry point is correct)
CMD ["nginx", "-g", "daemon off;"]
