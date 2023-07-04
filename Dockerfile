FROM python:3.10-slim

RUN mkdir /app

WORKDIR /app

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY exampleProject/ ./exampleProject

RUN python exampleProject/manage.py migrate

EXPOSE 8000

ENTRYPOINT ["python", "exampleProject/manage.py"]

CMD ["runserver", "0.0.0.0:8000"]
