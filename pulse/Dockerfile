FROM tomcat
RUN rm -fr /opt/tomcat/webapps/*
COPY geode-pulse-1.3.0.war /opt/tomcat/webapps/ROOT.war
RUN /bin/bash -c 'cd /opt/tomcat/webapps; mkdir ROOT; cd ROOT; jar xvf ../ROOT.war'
COPY setprops.sh /opt/setprops.sh
COPY starttomcat.sh /opt/starttomcat.sh
COPY catalina.sh /opt/tomcat/bin/catalina.sh
COPY server.xml /opt/tomcat/conf/server.xml
RUN mkdir logs

ENTRYPOINT /opt/starttomcat.sh 
