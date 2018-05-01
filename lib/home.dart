import 'package:flutter/material.dart';
import 'package:flutter_social_network/model.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Social Network"),
      ),
      body: new Content(),
    );
  }
}

class Content extends StatefulWidget {
  @override
  createState() => new ContentList();
}

class ContentList extends State<Content> {
  var _postObj = Post("rickpms",
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg');
  var _postObj2 = Post("rickpms",
      'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true');

  final _postList = <Post>[];

  @override
  Widget build(BuildContext context) {
    return _contentListView();
  }

  Widget _contentListView() {
    _postList.add(_postObj);
    _postList.add(_postObj2);

    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _postList.length,
      itemBuilder: (
          context,
          i,
          ) {
        return _buildRow(_postList[i]);
      },
    );
  }

  Widget _buildRow(Post postObj) {
    return new Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.grey[350]),
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        ),
        child: new Column(children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text(
                "@" + postObj.username,
                style: new TextStyle(color: Colors.blue[700]),
              )
            ],
          ),
          new Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                image: new DecorationImage(
                    image: new NetworkImage(postObj.contentImage), fit: BoxFit.cover)),
          )
        ]));
  }
}

