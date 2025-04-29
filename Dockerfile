FROM python:3.11-slim

# Install tesseract and other dependencies
RUN apt-get update && \
    apt-get install -y tesseract-ocr libglib2.0-0 libsm6 libxrender1 libxext6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Run the FastAPI app
CMD ["uvicorn", "main:app", "--host=0.0.0.0", "--port=8000"]
