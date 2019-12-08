import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_demo_flutter/Data/Model/SearchModel.dart';
import 'package:github_demo_flutter/Data/Model/app_response.dart';
import 'package:github_demo_flutter/UI/details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SearchModel _searchModel;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    _searchModel = Provider.of<SearchModel>(context);
    return ListView(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "search in github",
            ),
            onChanged: (text) {
              _searchModel.updateInput(text);
            },
            onSubmitted: (text) {
              _searchModel.updateInput(text);
            },
            style: TextStyle(fontSize: 20),
          ),
        ),
        _searchModel.searchText != null ? buildSearchList() : Container(),
      ],
    );
  }

  buildSearchList() {
    List<Item> items = _searchModel.items;
    if (items != null) {
      if (items.isNotEmpty) {
        return ListView.builder(
            addAutomaticKeepAlives: false,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return buildRepoItem(items[index]);
            });
      } else {
        return Center(
          child: Text("No Repos"),
        );
      }
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  buildRepoItem(Item item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailsScreen(item)));
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              item.owner.avatarUrl,
              fit: BoxFit.contain,
              width: 100,
              height: 100,
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(item.name),
                  Text(
                    item.owner.login,
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Text(item.htmlUrl),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
