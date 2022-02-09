FROM debian:11.2-slim

RUN apt update && apt install -y sudo lsb-release

RUN echo "deb https://notesalexp.org/tesseract-ocr-dev/$(lsb_release -cs)/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/notesalexp.list > /dev/null
RUN apt-get update -oAcquire::AllowInsecureRepositories=true
RUN apt-get install -y --allow-unauthenticated notesalexp-keyring -oAcquire::AllowInsecureRepositories=true

RUN apt-get update && apt-get install -y tesseract-ocr

# ENTRYPOINT ["webproc","--config","/etc/dnsmasq.conf","--","dnsmasq","--no-daemon"]
