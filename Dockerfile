FROM python:3

ENV PYTHONDONTWRITEBYTECODE 1

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip




WORKDIR /app

ADD . /app

COPY requirements.txt  /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

# running migrations
#RUN python manage.py migrate

# gunicorn
#CMD ["gunicorn", "--config", "gunicorn-cfg.py"]
