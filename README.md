dawClub using Servlet/JSP
==========

Sample Maven project with classic CRUD Web App using Servlet,JSP, JSTL and CDI

Features:
-------------
- Uses CDI for DAO objects instantiation and inject dependencies in Servlet
- Simple DAO with Lists for testing purpose (applicationScoped)
- DAO JDBC implementation
- Application Server Datasource initialization in web.xml
- Sample Glassfish DB Connection Pool configuration file (glassfish-resources.xml)
- Sample Tomcat DB Connection Pool configuration in context.xml
- Sample Tomcat file Realm  configuration in context.xml
- Bootstrap styles
- Optional access constraints for Authentication/Authorization.
- Servlet Logout controller and optional logout button for views
- Uses webjars to resolve bootsrap 4.2 css/js dependencies

Installation instructions
----------------
- Run on any JEE 8 compatible application server like Payara or Glassfish
- To launch in Tomcat, add JSTL and CDI dependencies in pom.xml

### Using JDBC DAO implementation
* Change the ClientesController.java DAO injection qualifier from @DAOList to @DAOJdbc
* Create a Derby Database from Netbeans Services tab and launch WEB-INF DBInitScript.sql in order to generate test DB schema and sample data
##### Create DataSource in Server
* By default, DataSource is created and configurated in Application Server from web.xml configuration
* (Optional) Glassfish/Payara: Adapt glassfish-resources.xml DB Connection Pool with database custom data
* (Optional) Tomcat: Adapt META-INF/context.xml DB Connection Pool with database custom data

