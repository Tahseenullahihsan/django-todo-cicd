FROM python:3

# Set the working directory
WORKDIR /data

# Update and install dependencies, including distutils
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install django==3.2

# Copy project files into the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose the application port
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

