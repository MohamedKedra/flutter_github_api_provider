import 'package:github_demo_flutter/Data/api_provider.dart';

import 'Model/app_response.dart';

class Repository {

  Future<RepoResponse> getRepos(String text){
    return APIProvider().searchInRepos(text);
  }
}
