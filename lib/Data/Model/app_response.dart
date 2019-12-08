class RepoResponse {
  int totalCount;
  bool incompleteResults;
  List<Item> items;

  RepoResponse({this.totalCount, this.incompleteResults, this.items});

  RepoResponse.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = new List<Item>();
      json['items'].forEach((v) {
        items.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['incomplete_results'] = this.incompleteResults;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  int id;
  String name;
  Owner owner;
  String htmlUrl;
  String description;
  int watchersCount;
  String language;
  int forksCount;

  Item(
      {this.id,
      this.name,
      this.owner,
      this.htmlUrl,
      this.description,
      this.watchersCount,
      this.language,
      this.forksCount});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    watchersCount = json['watchers_count'];
    language = json['language'];
    forksCount = json['forks_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['html_url'] = this.htmlUrl;
    data['description'] = this.description;
    data['watchers_count'] = this.watchersCount;
    data['language'] = this.language;
    data['forks_count'] = this.forksCount;
    return data;
  }
}

class Owner {
  String login;
  int id;
  String avatarUrl;

  Owner({this.login, this.id, this.avatarUrl});

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['id'] = this.id;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}
