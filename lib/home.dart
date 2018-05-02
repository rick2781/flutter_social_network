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
  var _postObj = Post(
      "rickpms",
      'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
      'http://becomingthebboss.com/wp-content/uploads/2014/03/circle-brigid-professional.jpg');
  var _postObj2 = Post(
      "rickpms",
      'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true',
      'http://becomingthebboss.com/wp-content/uploads/2014/03/circle-brigid-professional.jpg');

  final _postList = <Post>[];

  @override
  Widget build(BuildContext context) {
    return _contentListView();
  }

  Widget _contentListView() {
    _postList.add(_postObj);
    _postList.add(_postObj2);

    return new ListView.builder(
      padding: const EdgeInsets.all(4.0),
      itemCount: _postList.length,
      itemBuilder: (
        context,
        i,
      ) {
        return _buildPost(_postList[i]);
      },
    );
  }

  Widget _buildPost(Post postObj) {

    var likeIcon;

    if(postObj.hasLiked) {
      likeIcon = new Icon(Icons.star, color: Colors.red[600],);
    } else {
      likeIcon = new Icon(Icons.star_border);
    }

    return new Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          border: new Border.all(color: Colors.grey[350]),
          borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
        ),
        child: new Column(children: <Widget>[
          new Container(
              decoration: new BoxDecoration(
                  border: new BorderDirectional(
                      bottom: new BorderSide(color: Colors.grey[350]))),
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      child: new CircleAvatar(
                        backgroundImage:
                            new NetworkImage(postObj.profilePicture),
                        radius: 22.0,
                      )),
                  new Expanded(
                      child: new Text(
                    "@" + postObj.username,
                    style: new TextStyle(color: Colors.blue[700]),
                  )),
                  new IconButton(
                    icon: new Icon(Icons.more_vert),
                    color: Colors.grey[600],
                    onPressed: () {
                      print("more opts pressed");
                    },
                  )
                ],
              )),
          new Container(
              margin: const EdgeInsets.only(top: 16.0),
              height: 350.0,
              width: 550.0,
              child: new Image.network(
                postObj.contentImage,
                fit: BoxFit.cover,
              )),
          new Row(
            children: <Widget>[
              new IconButton(
                  icon: likeIcon,
                  iconSize: 30.0,
                  onPressed: () {
                    setState(() {
                      postObj.hasLiked ? postObj.hasLiked = false : postObj.hasLiked = true;
                    });
                  })
            ],
          )
        ]));
  }
}
