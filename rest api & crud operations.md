# rest api & crud operations

## CRUD operation

C = Create, => create id => form take some inputs and submit it back to server. all steps are done.

R = Read, => login into id => by providing login and password. (inside the it compare the inputs given by and stored data ). 

U = Update, => wanna make changes in profile => updating the pre exsisting id.

D = Delete => delete the id.



this operation used when we are dealing with database records.

## Http and its methods.

http is way of communicating to the server on internet.

methods are.

- GET - request data from server 

  success response = 200 (OK)

  failed response = 404 (NOT FOUND)

  

- POST - request to create new data

  success response = 200 (OK), 201 (CREATE)

  failed response = 204 (NO CONTENT)

  

- PUT - request to update existing data

  success response = 200 (OK), 201 (CREATE)

  failed response = 204 (NO CONTENT)

  

- DELETE - request to delete existing data

  success response = 200 (OK), 202 (ACCEPTED)

  failed response = 204 (NO CONTENT)

  

- PATCH - similar to update.

  success response = 200 (OK), 201 (CREATE)

  failed response = 204 (NO CONTENT)

  

- OPTION - request for check the available option.

  

status list

for complete list check - [HTTP status](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)



## THE USE OF REST API 



**client (browser) => request** ----------------------------------------------> **server (software) => recieved request** ----------------------------------------> **database (data storage) **

**client (browser) =>recieved response** <------------------------------------- **server (software) => response** <---------------------------------------- **database (data storage) **

​															RestAPI (http m + s + meaningful uri)																CRUD									

​																																		jsp java mvc

----



**client (browser) => request** ----------------------------------------------> **server (software) => recieved request** ----------------------------------------> **database (data storage) **

angular react (frontend frameworks)												(spring framework , orm, mvc, spring boot											mysql , postgresql, mongodb 

​																													node js, express.



website design provided by frontend framworks								data provided by backend frameworks



## Representational state transfer (rest)

- Uniform interface - self descriptive message, identify the resource. 
- client server - simplify the communication between client and server
- Stateless - it mean not have to do anything with previous or next request. it complete in itself.
- Cacheable - can create cache of the request at client side. 



## what is resource

resource are the main content of the uri which clearify the about the content on which have to perform some action.

- the **data**
- the **metadata** describe the data.
- **hypermedia link** - help the client to get the next desired state.



resource method are 

- post 
- put 
- patch
- delete
- option



## Object modeling 

object modeling of network based application.

- devices
- configurations



variation of object

- devices 
- device 
- configuration
- configurations



## Create models URIs

**URIs should all be nouns only**

models

```
/devices
/devices/{id}

/configurations
/configurations/{id}

/devices/{id}/configurations
/devices/{id}/configurations/{id}
```



to represent the resource 

- xml

  ```xml
  <device id="1234">
  	// data of device
  </device>
  ```

  

- json

  ```json
  {
  	device:{
  		id:"1234",
  		// data of device
  	}
  }
  ```

  

## resource types

- collection	- URI which have set multiple resources.

  ```
  /devices
  /configurations
  ```

- document - singular instance of resource object.

  ```
  /devices/{id}
  /configurations/{id}
  ```

- store - client managed resource stored at server.

  ```
  /song-management/users/{id}/playlists
  ```

- controller - it contain action which have take on resource.

  ```
  /song-management/users/{id}/playlists/play
  ```



## how to create uri

**do's**

```
/devices/{id}/configurations
/devices/{id}/configurations/{id}
```

**don't**

```
/devices/{id}/configurations/
/devices/{id}/configurations/{id}/
```



**use hyphens (-)** 

right way

```
/song-management/users/{id}/playlists
```

wrong way

```
/songmanagement/users/{id}/playlists
```



**do not use underscores(_)**

```
/song_management/users/{id}/playlists
```



**use lowercase letter** 

```
/song-management/users/{id}/playlists
```



**do not use file extension**

```
/devices/{id}/configurations.xml
```



**do not use crud function names**

```
/song-management/users/{id}/get/playlists
```



## daily task

1. study about the http status and there usage.
2. practice example from reference
3. study about the restful api 

## references

[restapitutorial](https://www.restapitutorial.com/)

[restfulapi.net](https://restfulapi.net/)

[restful mvc example 1](http://websystique.com/springmvc/spring-mvc-4-restful-web-services-crud-example-resttemplate/)

[restful mvc example 2](https://www.technicalkeeda.com/spring-tutorials/complete-spring-mvc-restful-web-services-example)
