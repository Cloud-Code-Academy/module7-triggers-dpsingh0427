trigger RatingTrigger on Account (before insert) {
    for(Account acc : Trigger.new)
    {
        if (acc.Phone != null && acc.Phone != '' &&
    acc.Website != null && acc.Website != '' &&
    acc.Fax != null && acc.Fax != '') 
        {
            acc.Rating = 'Hot';
        }

    }

}