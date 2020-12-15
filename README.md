# jacoco-agent-docker

Image containing the jacoco javaagent to use as a volume container.

# Usage (docker-compose example)

```yaml
version: '3.8'
services:
  jacoco:
    image: ictu/jacoco-agent-docker:0.8.6
  www:
    environment:
      JAVA_TOOL_OPTIONS: -javaagent:/jacoco/lib/jacocoagent.jar=excludes=*_javassit_*:javax.xml.soap.*:oasis.*,output=tcpserver,address=*
    image: jboss/wildfly
    volumes:
      - type: bind
        source: ./jacoco
        target: /jacoco
volumes:
  jacoco:

```
