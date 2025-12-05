import 'package:youtube_clone/services/api_Services/api_Services.dart';

class Repositories{
  ApiServices apiServices = ApiServices();
  Future<Map<String,dynamic>> searchData(String searchQuery)async{
    final data = await apiServices.getApiCalls('search',params: {'part':"snippet",'q':searchQuery});
    return data;
  }
}