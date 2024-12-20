FROM python:3.9

# Set the working directory
WORKDIR /data

# Update and install the required packagespdate && apt-get install -y --no-install-recommends python3-distutils python3-apt
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install --no-cache-dir django==3.2

# Copy the project files into the container
COPY . .

# Run database migrations
RUN python manage.py migrate || true

# Expose the application port
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


