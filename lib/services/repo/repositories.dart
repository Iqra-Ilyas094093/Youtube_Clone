import 'package:youtube_clone/model/search_models/search_model.dart';
import 'package:youtube_clone/services/api_Services/api_Services.dart';

class Repositories{
  ApiServices apiServices = ApiServices();
  Future<SearchModel?> searchData(String searchQuery,int maxResults,)async{
    final data = await apiServices.getApiCalls('/youtube/v3/search',params: {'part':"snippet",'q':searchQuery,'max_results':maxResults.toString()});
    return SearchModel.fromJson(data);
  }
}