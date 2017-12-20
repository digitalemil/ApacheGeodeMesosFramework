#/bin/bash
export JAVA_OPTS="-Dport.http.nonssl=${pulse_port} -Dport.shutdown=${pulse_shutdownport}"
echo JAVA_OPTS: $JAVA_OPTS
/opt/setprops.sh
/opt/tomcat/bin/catalina.sh run
