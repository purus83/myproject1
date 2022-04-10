##Source Image
FROM ubuntu:latest

##Packages - Installation
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y git openjdk-11-jdk wget zip && apt-get clean && rm -rf /var/lib/apt/lists

##Adding Fucntional user for Tomcat
RUN groupadd -r tomcat; useradd -r -g tomcat -m -d /opt/tomcat tomcat

##Open PORTS for Tomcat Service
EXPOSE 8080

##Changing User to Tomcat
USER tomcat:tomcat

##Switching Workingspace to /opt/tomcat
WORKDIR /opt/tomcat

##Installing Apache-Tomcat
RUN wget -q https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.20/bin/apache-tomcat-10.0.20.tar.gz; tar -xzf apache-tomcat-10.0.20.tar.gz; rm -rf apache-tomcat-10.0.20.tar.gz

##Copying APPLICATION(WAR file) to webapps directory of tomcat
COPY trucks/target/trucks.war /opt/tomcat/apache-tomcat-10.0.20/webapps/

##Entrypoint to start Tomcat service
ENTRYPOINT ["/opt/tomcat/apache-tomcat-10.0.20/bin/catalina.sh","run"]
