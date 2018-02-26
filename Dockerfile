FROM ubuntu:16.04

ADD . .
RUN apt update
RUN apt install -y git build-essential
RUN git clone https://github.com/ansible/ansible.git --recursive
RUN cd ansible; make deb
RUN echo "localhost ansible_connection=local" >> /etc/ansible/hosts

RUN ansible-playbook main.yml

CMD ["/bin/bash"]
