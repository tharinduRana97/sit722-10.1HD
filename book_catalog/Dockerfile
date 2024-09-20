# Dockerfile for booking_catalog microservice
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV DATABASE_URL = "postgresql://s224169428db_user:0ECup3QreyK0xcEy7ms6CYBflktTkyJC@dpg-crj80m2j1k6c73fk6ik0-a.oregon-postgres.render.com/s224169428db?sslmode=require"

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
