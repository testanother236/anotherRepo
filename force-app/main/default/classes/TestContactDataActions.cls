@isTest
public class TestContactDataActions {
    @testSetup
    static void setup() {
        // Create sample contacts
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 5; i++) {
            contacts.add(new Contact(
                FirstName = 'TestFirst' + i,
                LastName = 'TestLast' + i,
                Email = 'test' + i + '@example.com'
            ));
        }
        insert contacts;
    }

    static testMethod void testUpdateExistingContacts() {
        // Run update method
        Test.startTest();
        ContactDataActions.updateExistingContacts();
        Test.stopTest();

        // Verify that contacts are updated
        List<Contact> contacts = [SELECT FirstName, LastName, Email FROM Contact WHERE LastName LIKE 'Updated_%'];
        System.assert(!contacts.isEmpty(), 'Contacts should be updated.');
        for (Contact c : contacts) {
            System.assert(c.FirstName.startsWith('Updated_'), 'FirstName should be updated.');
            System.assert(c.LastName.startsWith('Updated_'), 'LastName should be updated.');
        }
    }

    static testMethod void testLogExistingContacts() {
        // Run log method (just ensure no exceptions)
        Test.startTest();
        ContactDataActions.logExistingContacts();
        Test.stopTest();
        // No assertions needed for debug logs, but method should run without errors
    }

    static testMethod void testDeleteExistingContacts() {
        // Run delete method
        Test.startTest();
        ContactDataActions.deleteExistingContacts();
        Test.stopTest();

        // Verify contacts are deleted
        Integer count = [SELECT COUNT() FROM Contact];
        System.assertEquals(0, count, 'All contacts should be deleted.');
    }
}