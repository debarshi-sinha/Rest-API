
@RestResource(urlMapping='/contactAPI1/*')
global with sharing class ContactResource1 {
    @HTTPGet
    global static List<Contact> getContactsandLeadSource(){

        RestRequest conReq = RestContext.request;

        Map<String, String> ContactRequestParam = conReq.params;
        
        Integer contactLimit = Integer.valueOf(ContactRequestParam.get('limit'));

        String leadString = ContactRequestParam.get('LeadSource');

        List<Contact> conList = [Select Id,Name,LeadSource from Contact Where LeadSource =: leadString limit : ContactLimit];

        return conList;
    }
}
