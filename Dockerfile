
FROM tomcat:8.5-jdk8

# Establecer el directorio de trabajo
WORKDIR /usr/local/tomcat/webapps/

# Copiar la carpeta SI1.4.2 y su contenido
COPY ./javaParcialPRUEBA /usr/local/tomcat/webapps/javaParcialPRUEBA/

# Listar el contenido del directorio para depuración (OPCIONAL SOLO SI HAY ERRORES)
RUN ls -l /usr/local/tomcat/webapps/javaParcialPRUEBA/ 

# Copiar el conector de MySQL y JSTL a la carpeta de librerías de Tomcat 
# Cambiar el nombre de la carpete inportante y poner correctamente el nombre de los drivers
COPY ./javaParcialPRUEBA/WEB-INF/lib/mysql-connector-j-8.2.0.jar /usr/local/tomcat/lib/
COPY ./javaParcialPRUEBA/WEB-INF/lib/jstl-1.2.jar /usr/local/tomcat/lib/

# Exponer el puerto 8080
EXPOSE 8080

# Comando de inicio de Tomcat
CMD ["catalina.sh", "run"]
