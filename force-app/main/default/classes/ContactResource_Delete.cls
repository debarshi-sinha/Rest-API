@RestResource(urlMapping='/contactAPI2/*')
global with sharing class ContactResource_Delete {
    @HTTPDelete
    global static Map<String, String> deleteContact(){

        Map<String, String> ResponseMap = new Map<String,String>();

        RestRequest conReq = RestContext.request;

        String contactRequestURL = conReq.requestURI;
        
        Id ContactId = Id.valueOf(contactRequestURL.substring(contactRequestURL.lastIndexOf('/')+1));

        Contact con = new Contact(Id = ContactId);

        try{
            delete con;
            ResponseMap.put('Success','1');
            ResponseMap.put('Message','Record has been deleted Successfully');
            
        }catch(exception e){
            ResponseMap.put('Success','0');
            ResponseMap.put('Message',e.getMessage());
        }
        return ResponseMap;
    }
}
