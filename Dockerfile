FROM python:3.7
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./
RUN pip install Flask gunicorn
RUN pip install -r requirements.txt
RUN python download.py
CMD python main.py
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app
