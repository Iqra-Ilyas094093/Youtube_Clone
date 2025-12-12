import 'package:flutter/foundation.dart';
import 'package:youtube_clone/model/search_models/search_model.dart';
import 'package:youtube_clone/services/repo/repositories.dart';


class SearchProvider extends ChangeNotifier{
  Repositories repositories = Repositories();
  bool isLoading = false;
  String? error;
  SearchModel? movies;

 Future<void> fetchSearchResults(String searchQuery)async{
   isLoading = true;
   error = null;
   notifyListeners();
   try{
     movies = await repositories.searchData(searchQuery,15,);
   }catch (e){
     error = e.toString();
   }finally{
     isLoading = false;
     notifyListeners();
   }

 }
}