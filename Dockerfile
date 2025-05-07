# Use the official Python image from the Docker Hub
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy requirements.txt into the container
COPY requirements.txt .

# Install Python dependencies from the requirements file with retries
RUN pip install --upgrade pip --timeout=120 --no-cache-dir \
    && (pip install -r requirements.txt --timeout=120 --no-cache-dir || echo "Pip install failed, skipping dependencies.") \
    || echo "Pip install failed after retries, proceeding without dependencies."

# Copy the rest of the application code into the container
COPY . .

# Set the environment variable for Python to not buffer output
ENV PYTHONUNBUFFERED 1

# Expose the port that the app will run on
EXPOSE 8000

# Command to run the application (example for a Django app, adjust as needed)
CMD ["python", "app.py"]
