dawClub using Servlet/JSP
==========

Sample Maven project with MVC CRUD Web Application using Servlet, JSP/JSTL, CDI and Bean Validation

Features:
-------------
- Bean validation
- Uses CDI for DAO objects instantiation and inject dependencies in Servlet
- Simple DAO with Lists for testing purpose (applicationScoped)
- DAO JDBC implementation
- Application Server Datasource initialization in web.xml
- Bootstrap styles
- Optional access constraints for Authentication/Authorization.
- Servlet Logout controller and optional logout button for views
- Uses webjars to resolve bootstrap 4.2 css/js dependencies

Installation instructions
----------------
- Run on any Jakarta 10 compatible application server like Payara or Glassfish
