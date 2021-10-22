FROM ibmcom/ace-server:latest
COPY . /home/aceuser/GreetingsAPI
RUN export LICENSE=accept && \
    source /opt/ibm/ace-11/server/bin/mqsiprofile && \
    mkdir bars && \
    mqsipackagebar -a bars/GreetingsAPI.bar -k GreetingsAPI && \
    mqsibar -a bars/GreetingsAPI.bar -w ace-server && \
    chmod -R 777 ace-server/run/GreetingsAPI