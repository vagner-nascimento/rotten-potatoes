FROM python:3.8-slim-buster
EXPOSE 5000
WORKDIR /app
COPY src/requirements.txt .
RUN python -m pip install -r requirements.txt
COPY src/ .
CMD ["gunicorn", "--workers=3", "--bind", "0.0.0.0:5000", "-c", "config.py", "app:app"]
