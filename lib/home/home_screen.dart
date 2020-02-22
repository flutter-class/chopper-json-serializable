import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_example/data/command/newfeed_command.dart';
import 'package:network_example/data/entity/new_feed.dart';
import 'package:network_example/data/repository/newfeed_repository.dart';
import 'package:network_example/view/view_divider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State {
  final repository = NewFeedRepository();

  @override
  void dispose() {
    repository.onCleaned();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    repository.sinkNewFeeds.add(LoadNewFeedCommand());
    return Scaffold(
      appBar: AppBar(
        title: Text("V@R"),
      ),
      body: _createBody(),
    );
  }

  Widget _createBody() {
    return StreamBuilder(
        stream: repository.getNewFeeds,
        builder: (BuildContext context, AsyncSnapshot<List<NewFeed>> snapshot) {
          print(snapshot.data);

          if (snapshot.connectionState == ConnectionState.waiting) {
            //loading
            return emptyText();
          } else if (snapshot.connectionState == ConnectionState.none) {
            //an error occur
            return emptyText();
          } else {
            if (snapshot.data.length == 0) {
              return emptyText();
            } else {
              return ListView.separated(
                itemCount: snapshot.data.length,
                separatorBuilder: (context, index) => ViewDivider(),
                itemBuilder: (BuildContext context, int index) {
                  return _item(snapshot.data[index]);
                },
              );
            }
          }
        });
  }

  Widget _item(NewFeed newFeed) {
    return ListTile(
      title: Text(newFeed.title),
      subtitle: Text(newFeed.body),
      onTap: () {
        //todo
      },
    );
  }

  Widget emptyText() {
    return Center(
      child: Text(
        "No data",
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
