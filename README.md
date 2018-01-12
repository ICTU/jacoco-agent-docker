# jacoco-agent-docker

Image containing the jacoco javaagent to use as a volume container.

# Usage (docker-compose example)

```yaml

services:
  jacoco:
    image: ictu/jacoco-agent-docker:0.8.0
  www:
    environment:
      JAVA_TOOL_OPTIONS: -javaagent:/jacoco/lib/jacocoagent.jar=excludes=*_javassit_*:javax.xml.soap.*:oasis.*,output=tcpserver,address=*
    image: jboss/wildfly
    volumes_from:
    - service:jacoco:r
version: '2.0'

```