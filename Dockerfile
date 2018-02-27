FROM ubuntu:16.04

ADD . /opt/ansible/

RUN apt update && \
    apt install -y \
      software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y \
      ansible && \
    rm -rf /var/lib/apt/lists/* && \
    echo "localhost ansible_connection=local" >> /etc/ansible/hosts && \
    ansible-playbook /opt/ansible/main.yml

CMD ["/bin/bash"]
