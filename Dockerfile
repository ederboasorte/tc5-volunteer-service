# syntax=docker/dockerfile:1

FROM python:3.11-slim
WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir --upgrade pip wheel \
    && python3 -m pip install --no-cache-dir setuptools==65.5.0 \
    && python3 -m pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8083
CMD ["gunicorn", "--bind", "0.0.0.0:8083", "app:app"]
