import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_demo_flutter/Data/Model/app_response.dart';

class DetailsScreen extends StatefulWidget {
  Item item;

  DetailsScreen(this.item);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 8,
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        widget.item.owner.avatarUrl,
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(widget.item.name,style: TextStyle(fontSize: 18),),
                          Text(widget.item.owner.login,style: TextStyle(fontSize: 22,color: Colors.blue),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(widget.item.forksCount.toString()),
                              Text(widget.item.watchersCount.toString())
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Text(widget.item.description)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.item.htmlUrl),
                      Text(widget.item.language)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
