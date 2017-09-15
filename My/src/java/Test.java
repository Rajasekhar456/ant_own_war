
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrator
 */
public class Test {
    public static void main(String[] args) {
        JSONObject dataObj=new JSONObject();
        dataObj.put("text", "Hai");
        
        JSONArray dataArray=new JSONArray();
        for(int i=0;i<=10;i++){
            JSONObject temp=new JSONObject();
            temp.put("text", "user"+i);
            dataArray.add(temp);            
        }
        dataObj.put("items", dataArray);
        System.out.println(dataObj);
    }
    
}
