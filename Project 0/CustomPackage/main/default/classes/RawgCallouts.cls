public class RawgCallouts {
    
    private static String apiKey = 'key=0b5733592335496699c33312e4c95b0d';
    private static String rawgDomain = 'https://api.rawg.io/api/';
    
    public static String getDevelopers(){
        
        String URL = rawgDomain + 'developers?' + apikey;
        
        System.debug(URL);
        Http h = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(URL);
        req.setMethod('GET');
        
        HttpResponse res = h.send(req);
        
        return res.getBody();
    }
}