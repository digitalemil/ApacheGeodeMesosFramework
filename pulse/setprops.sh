#!/bin/sh

rm /opt/tomcat/webapps/ROOT/WEB-INF/classes/pulse.properties 
cat > /opt/tomcat/webapps/ROOT/WEB-INF/classes/pulse.properties<< EOF
pulse.useLocator=true
pulse.host=locator-$POD_INSTANCE_INDEX-locator.$FRAMEWORK_HOST
pulse.port=10334
EOF
 
