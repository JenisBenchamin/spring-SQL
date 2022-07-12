# junit and mockito

## what is junit

junit is open-source unit testing framework

used to perform the unit testing



## unit testing 

it used to verify the small chunk of code , methods.



## why need the junit

- find the bugs in development life cycle.
- its depend on test-driven environment



## simple example 

with out junit

```java
public class FileTesting {
    private File output;
  
    output = new file(...);
    output.delete();
    
    public void testFile1() {
        // code for test 1
    }
    // result calculated of test 1
    
    output.delete();
    output = new file(...);
    
    public void testFile2() {
        // code for test 1
    }
    // result calculated of test 2
}
```

with junit

```java
public class FileTesting {
    private File output;
    
   	@BeforeClass
    public void checkingAvailability{  	syso("checking availability");    } // perform before class
    
    @Before
    public void createFile(){  	output = new file(...); syso("file created")  } // setup
   
    @After
    public void deleteFile(){   output.delete();   syso("file deleted ") } // teardown
   
    @Test
    public void testFile1() {      syso("test 1");    }

    @Test
    public void testFile2() {      syso("test 2");    }
    
    @AfterClass
    public void freeUpResources{  	syso("releasing the memory!");    } // perform after class
}
```

the structure used in example 2 is a text fixture



output -

```java
checking availability

file created 
test 1
file deleted

file created 
test 2 
file deleted 
    
releasing the memory!
```



- **to perform setup use the @Before annotation ** - this will execute before each test.
- **to perform clean-up of setup use the @After annotation.** - this will execute after each test.



## test runner

**JUnitCore** class which is used to execute the test cases;

It has method called as **runClasses** provided by **org.junit.runner.JUnitCore**.

return type of runClasses is **Result** object  of **org.junit.runner.Result** 



## JUnit Annotation

**Basic annotation**

- @Test
- @Test(timeout = 500)
- @Test( excepted = some_exception )
- @Before
- @BeforeClass
- @After 
- @AfterClass
- @ignores



## JUnit methods

**Assert Class** - used to compare actual result with excepted result by returning **passed** when both are equal or **failed** as both are not equal

- assertEquals(boolean excepted, boolean actual)
- assertFalse(boolean condition)
- assertTrue(boolean condition)
- assertNull(Object object)
- assertNotNull(Object object)
- fail()
- assertSame([String message]) 
- assertNotSame([String message])



**Test Cases Class** - To run multiple test.

- int countTestCases()
- TestResult createResult()
- String getName()
- TestResult run()
- void run(TestResult result)
- void setName(String name)
- void setUp()
- void tearDown()



**TestResult Class**

- void addError(Test test, throwable t)
- void addFailure(Test test, AssertionFailedError t)
- void endTest(Test test)
- int errorCount()
- Enumeration errors()
- int faliureCount()
- void run(TestCase test)
- int runCount()
- void StartTest(Test test)
- void stop()



**Test Suite Class** - run the test in specific order.

- void addTest(Test test)
- void addTestSuite(Class <? extends TestCases> testCase)
- int countTestCases()
- String getName()
- void run(TestResult result)
- void setName(String name)
- Test testAt(int index)
- int testCount()
- static Test warning(String message)





## what is Mockito

A framework to mock the real object so that we can perform the testing on mocked object and not effect the real resources.



## what is Mocking 

mocking is a process of developing the object that act as the mock or clone of real objects.

concept of mocking

- Stub - stub is object hold the predefined data and method which answer the call during testing. used for **state verification**

- Fake - this object contain implementation but its different from real object.

- Mock - Mock object act as a dummy or clone of the real object in testing. used for **behaviour verification** 

  

## Mockito Methods

- mock()

- when()

- verify()

- spy()

- reset()

- verifyNoMoreInteractions()

- verifyZeroInteractions()

- doThrow()

- doCallRealMethod()

- doAnswer()

- doNothing()

- doReturn()

- inOrder()

- times()

- never()

- atLeastOnce()

- atLeast()

- atMost()

- calls()

- only()

- timeOut()

- after()

  ..



## Behavior-driven development

methods 

- given(t methodCall)
- then(t mock)
- BDDStubber will (Answer<?> ans)
- BDDStubber willReturn (Object toBeReturn)
- BDDStubber willThrow(class< ? extends Throwable> toBeThrown )



```
// given
given(seller.askColddrink()).willReturn(new ColdDrink());

// when 
Drink drink = shop.buyColdDrink();

// then 
assertThat(drink, containColdDrink());
```



BDD style - it just make small changes in syntex

```
// given - use the setup part here
// when - perform actual invocation of the test
// then - check the condition here
```



## mockito annotations

- @Mock 
- @RunWith(MockitoJUnitRunner.class)
- @InjectMock
- @Captor 
- @spy


## reference links

[official mockito website](https://site.mockito.org/)

[official documents ](https://javadoc.io/doc/org.mockito/mockito-core/latest/org/mockito/Mockito.html)

[mockito-example 1](https://www.journaldev.com/21816/mockito-tutorial)

[mockito-example 2](https://www.lambdatest.com/blog/junit5-mockito-tutorial/)

[mockito-tutorial](https://www.softwaretestinghelp.com/mockito-tutorial/)

[official junit5 website](https://junit.org/junit5/)

[official documents](https://junit.org/junit5/docs/current/user-guide/)
