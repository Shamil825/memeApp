

import 'package:http/http.dart' as http;
import 'package:memeapp_api/modelclass.dart';

Future <Model?>getcall () async{
String url="https://api.imgflip.com/get_memes#";
  
 var urlk= Uri.parse(url);

try {
  final response =await http.get(urlk);
  if(response.statusCode==200){
    String respostring=response.body;
    return modelFromJson(respostring);
   
  }else{
    print(response.statusCode);
  }
    
} catch (e) {
}

}