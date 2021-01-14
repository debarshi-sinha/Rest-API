
@RestResource(urlMapping='/ContactAPI/*')
global with sharing class ContactResource {
    
    @HTTPGet
    global static List<Contact> getContactsandName(){

        RestRequest conReq = RestContext.request;

        String contactRequestURL = conReq.requestURI;

        Integer ContactLimit = Integer.valueOf(contactRequestURL.substring(contactRequestURL.lastIndexOf('/')+1));

        List<Contact> conList = [Select Id,name from Contact limit : ContactLimit];

        return conList;
    }
}
