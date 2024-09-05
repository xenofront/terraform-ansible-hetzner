FROM debian:12

ENV TERRAFORM_VERSION=1.9.4
ENV ANSIBLE_VERSION=2.17.3

RUN apt update
RUN apt upgrade
RUN apt install -y wget unzip ansible

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && chmod +x /usr/local/bin/terraform

WORKDIR /app

COPY ./ssh-keys/ /root/.ssh/

RUN echo 'alias ll="ls -lahF"' > ~/.bashrc
RUN echo 'alias grep="grep -E -i"' >> ~/.bashrc
RUN echo 'alias apply="(cd /app/terraform && terraform apply --auto-approve)"' >> ~/.bashrc
RUN echo 'alias destroy="(cd /app/terraform && terraform destroy --auto-approve)"' >> ~/.bashrc

ENTRYPOINT ["/bin/bash"]