@isTest
public class DependentClassTest {
    static void setupTestData() {
        // Create some accounts for testing
        Justtocheck.createAccount('Test Account 1', 'Customer');
        Justtocheck.createAccount('Test Account 2', 'Customer');
        Justtocheck.createAccount('Other Account', 'Partner');
    }
    
    @isTest
    static void testCreateAndCheckAccount() {
        String accountName = 'New Test Account';
        String accountType = 'Prospect';
        
        // Call method to create and check account
        Test.startTest();
        DependentClass.createAndCheckAccount(accountName, accountType);
        Test.stopTest();
        
        // Verify account was created
        System.assertEquals(true, Justtocheck.accountExists(accountName), 'Account should exist after creation.');
    }
    
    @isTest
    static void testUpdateAccountsByType() {
        setupTestData();
        String oldType = 'Customer';
        String newName = 'Updated Name';
        
        Test.startTest();
        DependentClass.updateAccountsByType(oldType, newName);
        Test.stopTest();
        
        // Verify that accounts with old type have updated name
        List<Account> updatedAccounts = [SELECT Id, Name FROM Account WHERE Name = :newName];
        System.assert(!updatedAccounts.isEmpty(), 'There should be accounts with the new name.');
        for (Account acc : updatedAccounts) {
            System.assertEquals(newName, acc.Name, 'Account name should be updated.');
        }
    }
    
    @isTest
    static void testDeleteAccountsByName() {
        setupTestData();
        String nameToDelete = 'Test Account 1';
        
        Test.startTest();
        DependentClass.deleteAccountsByName(nameToDelete);
        Test.stopTest();
        
        // Verify accounts with that name are deleted
        List<Account> accounts = [SELECT Id FROM Account WHERE Name = :nameToDelete];
        System.assert(accounts.isEmpty(), 'Accounts with the given name should be deleted.');
    }
}