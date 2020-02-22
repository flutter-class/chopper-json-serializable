import 'dart:async';

import 'package:network_example/data/command/newfeed_command.dart';
import 'package:network_example/data/entity/new_feed.dart';
import 'package:network_example/data/repository/base_repository.dart';
import 'package:network_example/data/service/api_service.dart';
import 'package:rxdart/rxdart.dart';

class NewFeedRepository extends BaseRepository {
  final _apiService = ApiService.create();

  final newFeedSubject = BehaviorSubject<List<NewFeed>>();
  final newFeedController = StreamController<NewFeedCommand>();

  Observable<List<NewFeed>> get getNewFeeds => newFeedSubject.stream;

  Sink<NewFeedCommand> get sinkNewFeeds => newFeedController.sink;

  NewFeedRepository() {
    newFeedController.stream.listen(handler);
  }

  handler(NewFeedCommand cmd) {
    if (cmd is LoadNewFeedCommand) {
      // stream newFeeds
      _apiService.getPosts().then((data) {
        if (data.body != null) {
          newFeedSubject.sink.add(data.body);
        }
      });
    }
  }

  @override
  void onCleaned() {
    newFeedSubject.close();
    newFeedController.close();
  }
}
