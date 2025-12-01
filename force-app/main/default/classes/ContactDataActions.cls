public class ContactDataActions {
    // Method to randomly update existing Contacts
    public static void updateExistingContacts() {
        // Query existing contacts (limit to 10 for example)
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Email FROM Contact LIMIT 10];
        if (contacts.isEmpty()) {
            System.debug('No contacts found to update.');
            return;
        }
        for (Contact c : contacts) {
            c.FirstName = 'Updated_' + Math.random();
            c.LastName = 'Updated_' + Math.random();
            c.Email = 'updated' + Math.round(Math.random() * 10000) + '@example.com';
        }
        update contacts;
    }

    // Method to delete existing Contacts
    public static void deleteExistingContacts() {
        // Query existing contacts (limit to 10 for example)
        List<Contact> contacts = [SELECT Id FROM Contact LIMIT 10];
        if (contacts.isEmpty()) {
            System.debug('No contacts found to delete.');
            return;
        }
        delete contacts;
    }
    
    // New method to retrieve and log existing Contacts
    public static void logExistingContacts() {
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Email FROM Contact LIMIT 10];
        if (contacts.isEmpty()) {
            System.debug('No contacts found.');
        } else {
            for (Contact c : contacts) {
                System.debug('Contact: ' + c.FirstName + ' ' + c.LastName + ', Email: ' + c.Email);
            }
        }
    }

    // Example method to perform update, log, and delete actions
    public static void performActions() {
        updateExistingContacts();
        logExistingContacts();
        // Optionally delete contacts
        // deleteExistingContacts();
    }
}