public class MyApexClass {
    // Property
    public String myString { get; set; }

    // Constructor
    public MyApexClass() {
        myString = 'Hello, World!';
    }

    // Method to return a greeting
    public String getGreeting() {
        return 'Greetings from MyApexClass!';
    }

    // Method to perform an addition
    public Integer addNumbers(Integer a, Integer b) {
        return a + b;
    }
}