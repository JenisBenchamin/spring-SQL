# Spring MVC

## MVC

it stands for 

- M = model
- V = view
- C = controller



## why and where

because it help use to created communtication medium between client browser and backend server.

### something about communtcation mediums

**websocket** = meet session, video calling , audio calling throught internet. 

​	it dosnt have todo any thing with state and never behavie like http.

create connections => all the end point (browser) and and server.

it continusly forwording the packets to the server

server sending those stream to other connected end points

**https** = surf the internet (state - less)

client ---> server



we use **controller** to handle the request recieved from client browser.

controller => responsble for take request 

modal => data provider => update the data

view => use to represent the end result ( response ).



## how the browers know to whom it have to call

**Dispacher Servlet** = front controller which accept the all request and it check the required controller which the view and data for the request.



![](https://static.javatpoint.com/sppages/images/flow-of-spring-web-mvc.png)





## steps to setup the mvc project

1. use maven templates => select catalog => internal, and look for => maven-archetype-webapp

2. update the pom.xml with mvc dependency => 

   ```xml
   	<dependencies>
   		<dependency>
   			<groupId>junit</groupId>
   			<artifactId>junit</artifactId>
   			<version>3.8.1</version>
   			<scope>test</scope>
   		</dependency>
   
   		<!-- https://mvnrepository.com/artifact/org.springframework/spring-webmvc -->
   		<dependency>
   			<groupId>org.springframework</groupId>
   			<artifactId>spring-webmvc</artifactId>
   			<version>5.1.1.RELEASE</version>
   		</dependency>
   
   		<!-- https://mvnrepository.com/artifact/org.apache.tomcat/tomcat-jasper -->
   		<dependency>
   			<groupId>org.apache.tomcat</groupId>
   			<artifactId>tomcat-jasper</artifactId>
   			<version>9.0.12</version>
   		</dependency>
   		<!-- https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api -->
   		<dependency>
   			<groupId>javax.servlet</groupId>
   			<artifactId>servlet-api</artifactId>
   			<version>3.0-alpha-1</version>
   		</dependency>
   	</dependencies>
   	<build>
   		<plugins>
   			<plugin>
   				<groupId>org.apache.maven.plugins</groupId>
   				<artifactId>maven-war-plugin</artifactId>
   				<version>3.3.1</version>
   			</plugin>
   		</plugins>
   	</build>
   ```

3. One time install from market place => Eclipse Enterprise Java and web developer tools version  

4. update the => build path config => with apache server.

5. if still have error in jsp then => update the Project facets => then select => runtime and add server there  and select server.



## setup the DispatcherServlet in project

To configure it we need to edit the web.xml file inside => src/main/webapp/WEB-INF/ 

and add some code there.

**web.xml**

```html

<web-app>
  <display-name>Archetype Created Web Application</display-name>
  
  <!-- provide the servlet name and class location of DispatcherServlet -->
  <servlet>
  	<servlet-name>name</servlet-name>
  	<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  </servlet>
    
  <!-- Mapping the url with servlet -->  
  <servlet-mapping>
  	<!-- similar_name_as_in_servlet_tag -->
  	<servlet-name>name</servlet-name>
    <!-- add the default url path => / means defining the path for all url -->
  	<url-pattern>/</url-pattern>
  </servlet-mapping>
    
</web-app>

```



## config controllers with beans

to active need to configure => servlet-name-servlet.xml (note => replace the servlet-name with it inner value ) 

eg  - strreponse-servlet.xml

this file hold the bean tag and configure the component scan to locate all the controllers.

also configure the ViewResolver

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="
		http://www.springframework.org/schema/beans
    	http://www.springframework.org/schema/beans/spring-beans.xsd
    	http://www.springframework.org/schema/context
    	http://www.springframework.org/schema/context/spring-context.xsd
    	http://www.springframework.org/schema/mvc
        http://www.springframework.org/schema/mvc/spring-mvc.xsd">

	<context:component-scan base-package="package_full_path"></context:component-scan>
	
	<mvc:annotation-driven/>
	
	<bean id="viewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<property name="prefix" value="/WEB-INF/jsp/"></property>
		<property name="suffix" value=".jsp"></property>
	</bean>
</beans>
```



## Lets create controllers to handle requests	

create package with same name of groupId as mention in pom.xml.

create new class 

**viewname+controller.java**

```java
// annotated with controller to identify its type.
@Controller
public class BasicMessages {
	
    // define the url path here to connection method with url.
    // method with pass the model data and view back to the DispatcherServlet
	@RequestMapping("/greeting")
	public String defaultPage() {
		return "greeting";
	}
    
    @RequestMapping("/greeting/bye")
	public String defaultPage() {
		return "bye";
	}
}
```



## Create view

to create the  view just add jsp files inside => src/main/webapp/WEB-INF/ jsp/

> **Note** - don't move index.jsp page to other location.

view contain the html templates which can used to present the information to user with response data.

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="add">
		<input type="text" name="t1"><br>
		<input type="text" name="t2"><br>
		<input type="submit">
	</form>
</body>
</html>
```

## Model interface 

it use to take input and perform the action on those values and return back to DispatcherServlet to fetch the view and send back the response to client.

**Method for model interface** 

- addAllAttributes(collection <?> c )
- addAllAttributes(Map <String, ?> m )
- ModalAndView()
- MergeAttibutes()
- containAttributes()
- ...

## methods to deal with client inputs 

to take out the values from url and response back with values.

- HttpServletRequest => reqest.getParameter();
- HttpServletResponse



## example

#### path => src/main/webapp/WEB-INF/ 

**index.jsp** 

```jsp
<html>
<body>
	<h2>Spring MVC</h2><br>
	<a href="greeting">Click here...</a>
	<a href="calcform">click to perform Addition</a>
</body>
</html>
```

**web.xml**

```xml
<!DOCTYPE web-app PUBLIC
 "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
 "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
  <display-name>Archetype Created Web Application</display-name>
  
  <servlet>
  	<servlet-name>strreponse</servlet-name>
  	<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  </servlet>
  <servlet-mapping>
  	<servlet-name>strreponse</servlet-name>
  	<url-pattern>/</url-pattern>
  </servlet-mapping>
</web-app>
```

**strreponse-servlet.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xsi:schemaLocation="
		http://www.springframework.org/schema/beans
    	http://www.springframework.org/schema/beans/spring-beans.xsd
    	http://www.springframework.org/schema/context
    	http://www.springframework.org/schema/context/spring-context.xsd
    	http://www.springframework.org/schema/mvc
        http://www.springframework.org/schema/mvc/spring-mvc.xsd">

	<context:component-scan base-package="com.springframework.mvc"></context:component-scan>
	
	<mvc:annotation-driven/>
	
	<bean id="viewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<property name="prefix" value="/WEB-INF/jsp/"></property>
		<property name="suffix" value=".jsp"></property>
	</bean>
</beans>
```



#### path => src/main/webapp/WEB-INF/ jsp/

**greeting.jsp** 

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Welcome to spring MVC</h3>
</body>
</html>
```

**calcform.jsp**

```html
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="add">
		<input type="text" name="t1"><br>
		<input type="text" name="t2"><br>
		<input type="submit">
	</form>
</body>
</html>
```

**calcresult.jsp**

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Total result</h2>	
	<%= request.getAttribute("result") %>
</body>
</html>
```

#### path => src/main/java/com/springframework/mvc/

**Calculator.java**

```java
package com.springframework.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Calculator {
	
	@RequestMapping("/calcform")
	public String calculatorForm() {
		return "calcform";
	}
	@RequestMapping("/add")
	public ModelAndView add(HttpServletRequest req) {
		int valueOne = Integer.parseInt(req.getParameter("t1"));
		int valueTwo = Integer.parseInt(req.getParameter("t2"));
		int totalSum = valueOne + valueTwo;

		ModelAndView mv = new ModelAndView();
		mv.setViewName("calcresult");
		mv.addObject("result", totalSum);
		return mv;
	}
}
```

**WelcomeMsg.java**

```java
package com.springframework.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeMsg {
	
	@RequestMapping("/greeting")
	public String defaultPage() {
		return "greeting";
	}
}
```



## today tasks

1. Practice the some examples of spring mvc.
2. check all the dependencies required for mvc.
3. check the possible options available in web.xml for servlet configuration.
4. Read some documents on model interface and there methods. 
5. practice form example.