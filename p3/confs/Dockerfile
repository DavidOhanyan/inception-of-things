FROM python:3.10-slim

WORKDIR /app

COPY index.html server.py ./

RUN pip install flask

ARG MESSAGE="Default build message"

ENV DEPLOY_MESSAGE="$MESSAGE"

EXPOSE 5000

CMD ["python", "server.py"]
