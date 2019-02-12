FROM python:2-slim

ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential python-dev libpq-dev libtiff5-dev libjpeg62-turbo-dev zlib1g-dev libfreetype6-dev \
	liblcms2-dev libwebp-dev gettext python-cffi libcairo-gobject2 libcairo2 libpango-1.0-0 libpangocairo-1.0-0 \
	libgdk-pixbuf2.0-0 libffi-dev shared-mime-info && \
    rm -rf /var/lib/apt/lists/*

RUN pip install -U pip uwsgi Pillow 'WeasyPrint==0.42.3'
RUN apt-get remove -y python-dev libpq-dev libtiff5-dev libjpeg62-turbo-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev && \
	apt-get autoremove -y
RUN rm -rf .cache

