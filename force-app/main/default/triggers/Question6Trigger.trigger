trigger Question6Trigger on Opportunity (before delete) {
    // Step 1: Collect all the AccountIds from the Opportunities
    Set<Id> accountIds = new Set<Id>();
    for (Opportunity opp : Trigger.old) {
        if (opp.AccountId != null) {
            accountIds.add(opp.AccountId);
        }
    }

    // Step 2: Query the Accounts in a single SOQL query
    List<Account> accounts = [SELECT Id, Industry FROM Account WHERE Id IN :accountIds];

    // Step 3: Create a Set for quick lookup of account IDs that meet the criteria
    Set<Id> bankingAccountIds = new Set<Id>();
    for (Account acc : accounts) {
        if (acc.Industry == 'Banking') {
            bankingAccountIds.add(acc.Id);
        }
    }

    // Step 4: Loop through each Opportunity and perform the check
    for (Opportunity opp : Trigger.old) {
        if (opp.StageName == 'Closed Won' && bankingAccountIds.contains(opp.AccountId)) {
            opp.addError('Cannot delete closed opportunity for a banking account that is won');
        }
    }
}
