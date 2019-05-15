FROM python:3.7-alpine

# update all current packages
RUN apk upgrade -U \

# PIP dependencies
    && pip install --no-cache-dir --upgrade --user \
        Flask \
        mysql-connector-python \

# clean up
    && rm -rf /var/cache/apk/*

WORKDIR /app

ENTRYPOINT ["python"]
CMD ["app.py"]
