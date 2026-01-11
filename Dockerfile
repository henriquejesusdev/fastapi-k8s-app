FROM python:3.10-slim
WORKDIR /app
COPY . .
ENV PYTHONPATH=/app/src
RUN pip install fastapi uvicorn
CMD ["uvicorn","fastapi_k8s_app.main:app","--host","0.0.0.0","--port","8000"]
