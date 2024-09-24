trigger Question4Trigger on Account (after insert) 
{
    List<Contact> contactsToInser = new List<Contact>();

    for(Account acc : Trigger.new)
    {
        Contact newCon = new Contact(LastName = 'DefaultContact',
                                    Email = 'default@email.com', 
                                    AccountId = acc.Id
                                     );
        contactsToInser.add(newCon);
    }
    if(contactsToInser.size() > 0)
    insert contactsToInser;
}