FROM openjdk:8-jre

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee


WORKDIR /usr/local/tomee




RUN set -x \
	&& curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-8.0.0-M2/apache-tomee-8.0.0-M2-plus.tar.gz.asc -o tomee.tar.gz.asc \
	&& curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-8.0.0-M2/apache-tomee-8.0.0-M2-plus.tar.gz -o tomee.tar.gz \
	&& tar -zxf tomee.tar.gz \
	&& mv apache-tomee-plus-8.0.0-M2/* /usr/local/tomee \
	&& rm -Rf apache-tomee-plus-8.0.0-M2 \
	&& rm bin/*.bat \
	&& rm tomee.tar.gz*

COPY build\libs\*.jar /usr/local/tomee/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
