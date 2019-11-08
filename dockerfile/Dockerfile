FROM tiangolo/uwsgi-nginx:python3.6

LABEL maintainer="Sebastian Ramirez <tiangolo@gmail.com>"

RUN pip install flask

ENV STATIC_URL /static
# Absolute path in where the static files wil be
ENV STATIC_PATH /app/static

ENV STATIC_INDEX 0

# Add demo app
COPY ./Users/apple/Work/motf/website /app
WORKDIR /app

# Make /app/* available to be imported by Python globally to better support several use cases like Alembic migrations.
ENV PYTHONPATH=/app

# Move the base entrypoint to reuse it
RUN mv /entrypoint.sh /uwsgi-nginx-entrypoint.sh
# Copy the entrypoint that will generate Nginx additional configs
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/start.sh"]
