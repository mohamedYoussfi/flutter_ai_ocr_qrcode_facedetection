import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:ocr_app/model/user.page.dart';
class UsersRepository {
  Future<SearchUserResponse> searchUsers(String query, int page, int size) async{
    //https://api.github.com/users/mohamedYoussfi/repos
    //Uri uri=Uri.https("api.github.com", "/search/users",{'q':"mohamed","page":0,"per_page":10});
    try{
      Uri uri=Uri.parse("https://api.github.com/search/users?q=$query&page=$page&per_page=$size");
      Response response= await http.get(uri);
      if(response.statusCode==200){
        return SearchUserResponse.fromJson(json.decode(response.body));
      } else {
        throw ("Error${response.statusCode}");
    } }
      catch(ex){
        throw("$ex.toString()");
    }
  }
  Future<List<dynamic>> repositories(String user) async{
    //
    //Uri uri=Uri.https("api.github.com", "/search/users",{'q':"mohamed","page":0,"per_page":10});
    try{
      Uri uri=Uri.parse("https://api.github.com/users/$user/repos?per_page=200");
      Response response= await http.get(uri);
      if(response.statusCode==200){
        return json.decode(response.body);
      } else {
        throw ("Error${response.statusCode}");
      } }
    catch(ex){
      throw("$ex.toString()");
    }
  }
}