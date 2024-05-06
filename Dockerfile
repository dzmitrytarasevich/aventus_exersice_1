FROM python:3.12.3

WORKDIR /app
ENV FLASK_APP=/app/hello_helm.py

COPY . .

RUN pip install -r requirements.txt

ENTRYPOINT ["flask", "run"]
CMD ["--host=0.0.0.0"]