import 'package:dio/dio.dart';
import 'package:github_demo_flutter/Data/Model/app_response.dart';

class APIProvider {
  final String baseUrl = "https://api.github.com/search/repositories";
  final Dio dio = Dio();

  Future<RepoResponse> searchInRepos(String text) async {
    Response response = await dio.get(baseUrl, queryParameters: {"q": text});
    return RepoResponse.fromJson(response.data);
  }
}
