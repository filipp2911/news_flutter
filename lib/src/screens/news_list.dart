import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_bloc.dart';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  Widget build(context) {
    final bloc = StoriesProvider.of(context);
    bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('Top news'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, int index) {
            return Text('${(snapshot.data as dynamic)[index]}');
            },
          );
        },
    );
  }
}
  //   -------------------------------Shows only items from 0-1000 on device, without http request-------------------------------

  // Widget buildList() {
  //   return ListView.builder(
  //       itemCount: 1000,
  //       itemBuilder: (context, int index) {
  //         return FutureBuilder(
  //           future: getFuture(),
  //           builder: (context, snapshot) {
  //             return snapshot.hasData
  //                 ? Text('I\'m visible $index')
  //                 : Text('I haven\'t fetch data yet $index');
  //           },
  //         );
  //       },
  //   );
  // }

  // getFuture() {
  //   return Future.delayed(
  //     Duration(seconds: 2),
  //       () => 'hi',
  //   );
  // }
