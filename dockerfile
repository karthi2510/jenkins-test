FROM ubuntu:latest
RUN apt update -y && \
apt install -y openjdk-8-jdk
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.62.tar.gz
RUN mv apache-tomcat-9.0.62/* /opt/tomcat
COPY webapp/target/webapp.war /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"] 
