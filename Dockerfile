# Base Dockerfile for house-price-predictor

FROM python:3.11-slim

WORKDIR /app

COPY src/api/ .

# copy application code
COPY models/trained/*.pkl models/trained/

COPY requirements.txt .


RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN  pip install -r requirements.txt


# exposed port (change if needed)
EXPOSE 8000

# default command (adjust to your entrypoint e.g. uvicorn or gunicorn)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]