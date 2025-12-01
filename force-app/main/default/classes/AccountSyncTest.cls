public with sharing class AccountSyncTest {

    // Simple public method
    public static String getGreeting(String name) {
        if (String.isBlank(name)) {
            return 'Hello, Anonymous!';
        }
        return 'Hello, ' + name + '!';
    }

    // Method with SOQL to make metadata meaningful
    public static List<Account> getRecentAccounts(Integer limitNumber) {
        if (limitNumber == null || limitNumber <= 0) {
            limitNumber = 5;
        }

        return [
            SELECT Id, Name, CreatedDate
            FROM Account
            ORDER BY CreatedDate DESC
            LIMIT :limitNumber
        ];
    }

    // Method that will be easy to modify later for sync tests
    public static Integer sumNumbers(Integer a, Integer b) {
        if (a == null) a = 0;
        if (b == null) b = 0;
        return a + b;
    }

    // A dummy method to generate diffs in future commits
    public static Boolean featureToggleCheck() {
        // You can change this return value in future commits for testing sync
        return true;
    }
}
