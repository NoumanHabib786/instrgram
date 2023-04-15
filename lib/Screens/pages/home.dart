import 'package:flutter/material.dart';
import 'package:instagram/Screens/homepage.dart';
import 'package:instagram/Screens/pages/search.dart';
import 'package:instagram/Screens/utilities/favorate_screen.dart';
import 'package:instagram/Screens/utilities/user_post.dart';
import 'package:instagram/Screens/utilities/user_story.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
          child: Row(
            children: [
              Text(
                "Instagram",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/me.jpg"),
                  radius: 16,
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 20,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: InkWell(
                  child: Icon(Icons.favorite_rounded),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Favorate_Screen(),
                      )
                  ),
                ),
              ),
              Icon(Icons.share),
              SizedBox(
                width: 20,
              )
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(

            height: 110 ,
            padding: EdgeInsets.all(5),
            child: Consumer<user_provider>(
              builder: (context, value, child) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          CircleAvatar(
                            radius: 32,
                            backgroundColor: Colors.grey[300],
                            child: Icon(Icons.add),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Your Story")
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.stories.length,
                        itemBuilder: (context, index) {
                          return UserStory(
                            name: value.stories[index][0],
                            pic: value.stories[index][2],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          //posts
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Consumer<user_provider>(
              builder: (context, value, child) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: value.stories.length,
                  itemBuilder: (context, index) {
                    return UserPost(
                      list: () {
                        if(value.selecteditems.contains(index))
                          {
                            Provider.of<user_provider>(context , listen: false).removeItems(index);
                            print(value.selecteditems);
                          }
                        else{
                          Provider.of<user_provider>(context , listen: false).additems(index);
                          print(value.selecteditems);
                        }
                      },
                      post_name: value.stories[index][0],
                      image: value.stories[index][1],
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
