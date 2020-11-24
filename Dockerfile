FROM ubuntu:latest

RUN apt-get update \
    && apt-get -y install ansible git \
    && git clone https://github.com/bearddan2000/ansible-lib-playbooks.git \
    && chmod -R +x ansible-lib-playbooks \
    && ansible-playbook ansible-lib-playbooks/lang/scala.yml

COPY bin/ .

RUN chmod +x ./ScalaMain.scala \
    && scalac ./ScalaMain.scala \
    && chmod +x ./ScalaMain.class

CMD ["scala", "-classpath", "./", "ScalaMain"]
