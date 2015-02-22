dawClub using Servlet/JSP
==========

Sample Netbeans project with classic CRUD Web App using Servlet/JSP

Features:
-------------
- Simple DAOList for testing purpose
- Sample DAOJDBC implementation
- Sample Tomcat DB Connection Pool configuration file
- Sample Glassfish DB Connection Pool configuration file

Installation instructions
----------------
### In-Memory DAO
Just run project in Netbeans using Tomcat Server

### JDBC DAO
* Change ClientesController.java init method to create an instance of ClienteDAOJDBC class
* Create Derby Database from Netbeans Services tab and launch WEB-INF DBInitScript.sql in order to generate test DB schema and sample data
* Adapt META-INF/context.xml DB Connection Pool with database custom data for Tomcat deploy
* Adapt glassfish-resources.xml DB Connection Pool with database custom data for Glassfish deploy
