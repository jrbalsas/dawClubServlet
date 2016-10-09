dawClub using Servlet/JSP
==========

Sample Maven project with classic CRUD Web App using Servlet,JSP and JSTL

Features:
-------------
- Simple DAO with Lists for testing purpose
- Sample DAO JDBC implementation
- Sample Tomcat DB Connection Pool configuration file
- Sample Glassfish DB Connection Pool configuration file
- Boostrap styles
- Runs from command line using Jetty

Installation instructions
----------------
### In-Memory DAO
Run project in Netbeans using Tomcat Server or just enter 'mvn jetty:run' in command line from project folder

### JDBC DAO
* Change the ClientesController.java init method to create an instance of the ClienteDAOJDBC class
* Create a Derby Database from Netbeans Services tab and launch WEB-INF DBInitScript.sql in order to generate test DB schema and sample data
* Adapt META-INF/context.xml DB Connection Pool with database custom data if deployed in Tomcat
* Adapt glassfish-resources.xml DB Connection Pool with database custom data if deployed in Glassfish
