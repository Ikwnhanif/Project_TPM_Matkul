import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_github/models/user_book.dart';

import '../boxes.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({Key? key}) : super(key: key);

  @override
  _BookmarkViewState createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  late int totalBook;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarked'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Lib>(HiveBoxes.lib).listenable(),
        builder: (context, Box<Lib> box, _) {
          totalBook = box.values.length;
          if (box.values.isEmpty) {
            return Center(
              child: Text('No User Bookmarked'),
            );
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              Lib? res = box.getAt(index);
              return Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                key: UniqueKey(),
                onDismissed: (direction) {
                  res!.delete();
                },
                child: ListTile(
                  leading: Image(
                    image: NetworkImage(res!.avatarUrl),
                  ),
                  title: Text(res.login),
                  subtitle: Text(res.htmlUrl),
                ),
              );
            },
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Borrow',
      //   child: Icon(Icons.book),
      //   onPressed: () => {
      //     Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => CheckoutForm(
      //                   totalBook: totalBook,
      //                 ))),
      //   },
      // ),
    );
  }
}
