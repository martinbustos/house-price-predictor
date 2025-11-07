# Dockerfile base para una app Streamlit
FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Copiar el código de la aplicación
COPY . /app

# Copiar e instalar dependencias Python
COPY requirements.txt /app/requirements.txt

# Instalar dependencias del sistema necesarias (ajustar según proyecto)
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential git gcc && \
    rm -rf /var/lib/apt/lists/*

RUN pip install -r /app/requirements.txt

# Exponer el puerto por defecto de Streamlit
EXPOSE 8501

# Ejecutar la app (ajustar el nombre del archivo si es diferente)
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0"]