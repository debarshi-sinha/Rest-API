@RestResource(urlMapping='/contactAPI3/*')
global with sharing class ContactResource_Delete1 {
    global class ResponseWrapper{
        String Success;
        String Message;
    }

    @HTTPDelete
    global static List<ResponseWrapper> deleteContact(){

        List<ResponseWrapper> ResponseWrapperList = new List<ResponseWrapper>();

        RestRequest conReq = RestContext.request;

        String contactRequestURL = conReq.requestURI;

        String[] contactIds = (contactRequestURL.substring(contactRequestURL.lastIndexOf('/')+1)).split(',');

        List<Contact> contactToDelete = new List<Contact>();

        for(String contactId : contactIds){
            Contact con = new Contact(Id=contactId);
            contactToDelete.add(con);
        }

        Database.DeleteResult[] deleteResults = Database.delete(contactToDelete,false);

        for (Database.DeleteResult deleteResult : deleteResults){

            ResponseWrapper wrapper = new ResponseWrapper();
            if(deleteResult.isSuccess()){
                wrapper.Success = '1';
                wrapper.Message = 'Record is successfully Deleted, ID: '+deleteResult.getId();
            }
            else{
                wrapper.Success = '0';

                for (Database.Error error : deleteResult.getErrors()){
                    wrapper.Message = error.getMessage();
                }
            }
            ResponseWrapperList.add(wrapper);
        }
        return ResponseWrapperList;
    }
}
