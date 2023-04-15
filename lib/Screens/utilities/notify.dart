import 'package:flutter/material.dart';
import 'package:instagram/Screens/utilities/user_post.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: Consumer<user_provider>(
        builder: (context, value, child) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: value.stories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                  minVerticalPadding: 10,
                  enabled: true,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.5,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  trailing: InkWell(
                    onTap: () {
                      value.removeItems(index);
                      print(value.selecteditems.length);
                    },
                    child: Icon(Icons.delete),
                  ),
                  leading: Icon(Icons.person),
                  title: Text(value.stories[index][0] , style: TextStyle(fontWeight: FontWeight.w700),),
                  subtitle: const Text(
                      'hey i like this post for you thanks for sharing this awesome view '),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
