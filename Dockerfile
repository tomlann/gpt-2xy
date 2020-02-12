FROM python:3.7
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN python download.py
RUN pip install Flask gunicorn
CMD python main.py
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app
