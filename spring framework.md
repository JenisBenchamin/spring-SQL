# spring framework

## spring 5

the problem with traditional way to create object is that it have to linked with other class at compile time 

we call that as **tightly coupling**.

it introduce the **loosely coupling** at runtime level.

it is done by spring core modules.

1. Beans 
2. Core
3. Context



![](https://s7280.pcdn.co/wp-content/uploads/2021/10/spring-architecture.png)



## how 

1. Dependency injection ( DI ) - it inject the dependency of object at runtime level in another object. 
2. Inversion of control ( IOC ) - it manages the beans and allow the DI.

![1](https://media.geeksforgeeks.org/wp-content/uploads/20210702120704/m2.png)



## Dependency injection ( DI ) 

Preformed by providing the metadata. 

1. **xml**  
2. **java class**
3. **annotation** 

## Inversion of control ( IOC )

Spring provides two types of IOC container.

1. **BeanFactory.** - creates the beans for perform DI.
2. **Application Context** - help to resolve the metadata input to beanfactory.

 

## POJO as Bean

Beans are object that managed by the spring IOC container and created by using metadata that we supply by different ways, handle the life cycle of that bean.



## Dependency injection ( DI )  based on xml

**applicationContext.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/context
    http://www.springframework.org/schema/context/spring-context.xsd">
	
	<bean id="manager" class="com.springframework.xmlbased.Manager"></bean>
	<bean id="accoutant" class="com.springframework.xmlbased.Accoutant"></bean>
</beans>
```

**pom.xml**

```xml
<dependencies>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-core</artifactId>
			<version>5.3.14</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>5.3.14</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/javax.annotation/javax.annotation-api -->
		<dependency>
			<groupId>javax.annotation</groupId>
			<artifactId>javax.annotation-api</artifactId>
			<version>1.3.2</version>
		</dependency>
	</dependencies>
	<build>
		<sourceDirectory>src</sourceDirectory>
		<plugins>
			<plugin>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>3.8.1</version>

				<configuration>
					<source>11</source>
					<targer>11</targer>
				</configuration>
			</plugin>
		</plugins>
	</build>
```

```java
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

// main class
public class Application {
	
	private static ApplicationContext context;
	public static void main(String[] args) {
		context = new ClassPathXmlApplicationContext("applicationContext.xml");
		Employee e = (Employee) context.getBean("manager");
		e.doWork();
		Employee e1 = (Employee) context.getBean("accoutant");
		e1.doWork();
	}

}

// inteface
public interface Employee {
	void doWork();
}


// classes
public class Accoutant implements Employee {

	@Override
	public void doWork() {
		System.out.println("Audit the accounts...");
	}
}

public class Manager implements Employee {

	@Override
	public void doWork() {
		System.out.println("Manage the branch office");
	}
}
```



## Annotation with xml

**applicationContext.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/context
    http://www.springframework.org/schema/context/spring-context.xsd">
	
	<context:component-scan base-package="com.springframework.xmlwithannotation"></context:component-scan>
</beans>
```

**pom.xml**

```xml
<dependencies>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-core</artifactId>
			<version>5.3.14</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>5.3.14</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/javax.annotation/javax.annotation-api -->
		<dependency>
			<groupId>javax.annotation</groupId>
			<artifactId>javax.annotation-api</artifactId>
			<version>1.3.2</version>
		</dependency>
	</dependencies>
	<build>
		<sourceDirectory>src</sourceDirectory>
		<plugins>
			<plugin>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>3.8.1</version>

				<configuration>
					<source>11</source>
					<targer>11</targer>
				</configuration>
			</plugin>
		</plugins>
	</build>
```

```java
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

// main class
public class Application {
	
	private static ApplicationContext context;
	public static void main(String[] args) {
		context = new ClassPathXmlApplicationContext("applicationContext.xml");
		Employee e = (Employee) context.getBean("manager");
		e.doWork();
		Employee e1 = (Employee) context.getBean("accoutant");
		e1.doWork();
	}

}

// inteface
public interface Employee {
	void doWork();
}


// classes
@Component
public class Accoutant implements Employee {

	@Override
	public void doWork() {
		System.out.println("Audit the accounts...");
	}
}

@Component
public class Manager implements Employee {

	@Override
	public void doWork() {
		System.out.println("Manage the branch office");
	}
}
```



## class based configuration 

**AppConfig.java**

```java
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan("com.springframework.javaconfig")
public class AppConfig {

}
```

**pom.xml**

```xml
<dependencies>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-core</artifactId>
			<version>5.3.14</version>
		</dependency>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-context</artifactId>
			<version>5.3.14</version>
		</dependency>
		<!-- https://mvnrepository.com/artifact/javax.annotation/javax.annotation-api -->
		<dependency>
			<groupId>javax.annotation</groupId>
			<artifactId>javax.annotation-api</artifactId>
			<version>1.3.2</version>
		</dependency>
	</dependencies>
	<build>
		<sourceDirectory>src</sourceDirectory>
		<plugins>
			<plugin>
				<artifactId>maven-compiler-plugin</artifactId>
				<version>3.8.1</version>

				<configuration>
					<source>11</source>
					<targer>11</targer>
				</configuration>
			</plugin>
		</plugins>
	</build>
```

```java
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

// main class
public class Application {
	
	private static AnnotationConfigApplicationContext context;
	public static void main(String[] args) {
		context = new AnnotationConfigApplicationContext(AppConfig.class);
		Employee e = (Employee) context.getBean("manager");
		e.doWork();
		Employee e1 = (Employee) context.getBean("accoutant");
		e1.doWork();
	}

}

// inteface
public interface Employee {
	void doWork();
}


// classes
@Component
public class Accoutant implements Employee {

	@Override
	public void doWork() {
		System.out.println("Audit the accounts...");
	}
}

@Component
public class Manager implements Employee {

	@Override
	public void doWork() {
		System.out.println("Manage the branch office");
	}
}
```

