# Base Python image
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install system packages
RUN apt-get update && apt-get install -y netcat gcc libpq-dev

# Copy and install Python dependencies
COPY backend/requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy backend code
COPY backend/ /app/

# Run Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
