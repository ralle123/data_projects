# data-science-project/Dockerfile
#docker build -t ralle123/myproj .
#docker run -p 8888:8888 ralle123/myproj
FROM python:3.6.5-slim

WORKDIR /app

RUN pip --no-cache-dir install pandas jupyter

EXPOSE 8888

VOLUME /app

CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]