
@isTest
public class MyApexClassTest {
    
    // Test method for the constructor and property initialization
    @isTest
    static void testConstructorAndPropertyInitialization() {
        // Creating an instance of MyApexClass
        MyApexClass instance = new MyApexClass();
        
        // Verifying whether the myString property is initialized correctly
        System.assertEquals('Hello, World!', instance.myString, 
                            'The myString property should be initialized with "Hello, World!"');
    }
    
    // Test method for getGreeting()
    @isTest
    static void testGetGreeting() {
        // Creating an instance of MyApexClass
        MyApexClass instance = new MyApexClass();
        
        // Verifying whether getGreeting() returns the expected string
        String expectedGreeting = 'Greetings from MyApexClass!';
        System.assertEquals(expectedGreeting, instance.getGreeting(),
                            'The getGreeting method should return "Greetings from MyApexClass!"');
    }
    
    // Test method for addNumbers() with positive scenario
    @isTest
    static void testAddNumbersPositive() {
        // Creating an instance of MyApexClass
        MyApexClass instance = new MyApexClass();
        
        // Testing the addition of two positive numbers
        Test.startTest();
        Integer result = instance.addNumbers(10, 20);
        Test.stopTest();
        
        // Verifying whether the addNumbers method returns the corrected addition result
        System.assertEquals(30, result,
                            'addNumbers should correctly add two positive integers');
    }
    
    // Test method for addNumbers() with negative and positive scenario
    @isTest
    static void testAddNumbersNegativeAndPositive() {
        // Creating an instance of MyApexClass
        MyApexClass instance = new MyApexClass();
        
        // Testing the addition of a negative and a positive number
        Test.startTest();
        Integer result = instance.addNumbers(-10, 20);
        Test.stopTest();
        
        // Verifying the sum of a negative and a positive number
        System.assertEquals(10, result,
                            'addNumbers should handle addition of a negative and a positive integer correctly');
    }
    
    // Test method for addNumbers() with two negative numbers
    @isTest
    static void testAddNumbersTwoNegatives() {
        // Creating an instance of MyApexClass
        MyApexClass instance = new MyApexClass();
        
        // Testing the addition of two negative numbers
        Test.startTest();
        Integer result = instance.addNumbers(-10, -20);
        Test.stopTest();
        
        // Verifying whether addNumbers correctly sums two negative numbers
        System.assertEquals(-30, result,
                            'addNumbers should correctly add two negative integers');
    }
}
