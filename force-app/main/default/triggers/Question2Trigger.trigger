trigger Question2Trigger on Account (before insert) 
{
    for(Account acc : Trigger.new)
    {
        // Check if Shipping Address fields are not null or empty
        if(acc.ShippingStreet != null && acc.ShippingStreet != '' &&
           acc.ShippingCity != null && acc.ShippingCity != '' &&
           acc.ShippingPostalCode != null && acc.ShippingPostalCode != '' &&
           acc.ShippingCountry != null && acc.ShippingCountry != '' &&
           acc.ShippingState != null && acc.ShippingState != '')
        {
            // Copy Shipping Address to Billing Address
            acc.BillingStreet = acc.ShippingStreet;
            acc.BillingCity = acc.ShippingCity;
            acc.BillingPostalCode = acc.ShippingPostalCode;
            acc.BillingCountry = acc.ShippingCountry;
            acc.BillingState = acc.ShippingState; // Ensure BillingState is copied
        }
    }
}
