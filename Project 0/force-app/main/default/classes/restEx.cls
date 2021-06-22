public class restEx {
    
    public static String makeCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://pokeapi.co/api/v2/pokemon/pikachu');
        request.setMethod('Get');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200){
            //System.debug(response.getBody());
            
            Map<String,Object> respMap = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
            String name = String.valueOf(respMap.get('name'));
            
            
            List<Object> abillities = (List<Object>) respMap.get('abillities');
                                                               
        }
        return null;
    }
}