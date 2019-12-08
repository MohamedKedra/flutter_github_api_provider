import 'package:flutter/material.dart';
import 'package:github_demo_flutter/Data/Model/app_response.dart';
import 'package:github_demo_flutter/Data/repository.dart';

class SearchModel extends ChangeNotifier {
  Repository _repository = Repository();

  List<Item> items;

  String searchText;



  getAllItems(String search) async {
    RepoResponse response = await _repository.getRepos(search);
    items = response.items;
  }

  updateInput(String searchText) async{
    items = null;
    if (searchText.isEmpty) {
      this.searchText = null;
    } else {
      this.searchText = searchText;
      await getAllItems(searchText);
    }
    notifyListeners();
  }
}
