import 'package:flutter/material.dart';
import 'package:instagram/Screens/utilities/account_tab1.dart';
import 'package:instagram/Screens/utilities/account_tab4.dart';
import 'package:instagram/Screens/utilities/user_story.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';
import '../utilities/account_tab2.dart';
import '../utilities/account_tab3.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/me.jpg"),
                      radius: 35,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Text(
                          "237",
                          style:
                              TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                        ),
                        Text(
                          "Posts",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          Text(
                            "40k",
                            style:
                                TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),

                    Column(
                      children: [
                        Text(
                          "40",
                          style:
                              TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                        ),
                        Text(
                          "Following",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0 , top: 10 , bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Nouman Habib",
                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "I am a creater of unofficial apps",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Text(
                      "/youtube.com/Noumanhabib/",
                      style: TextStyle(color: Colors.blue,fontSize: 15),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Edit Profile"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.grey, width: 1))),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Ad Tools"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.grey, width: 1))),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Insights"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.grey, width: 1))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0),
                height: 98,
                child: Consumer<user_provider>(
                  builder: (context, value, child) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.stories.length,
                      itemBuilder: (context, index) {
                        return UserStory(name: value.stories[index][0],pic: value.stories[index][2],);
                      },
                    );
                  },

                ),
              ),
              TabBar(tabs: [
                Tab(icon: Icon(Icons.grid_3x3),),
                Tab(icon: Icon(Icons.video_call),),
                Tab(icon: Icon(Icons.shop),),
                Tab(icon: Icon(Icons.person),),
              ]
              ),
              Expanded(
                child: TabBarView(children: [
                  AccountTab1(),
                  AccountTab2(),
                  AccountTab3(),
                  AccountTab4(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
