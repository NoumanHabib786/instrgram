import 'package:flutter/material.dart';
import 'package:instagram/Screens/utilities/favorate_screen.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../screen_provider.dart';

class UserPost extends StatefulWidget {
  final String? post_name;
  final String? image;
  Function list;

  UserPost({
    Key? key,
    required this.list,
    required this.post_name,
    required this.image,
  }) : super(key: key);

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  bool _favorate = false;
  int heart = 232;
  bool _favoratebook = false;

  void togglefavrotebook() {
    setState(() {
      if (_favoratebook) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          padding: EdgeInsets.all(15),
          backgroundColor: Colors.white,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Video Unsaved",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                "Remove from Collection",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          duration: Duration(seconds: 1),
        ));
        _favoratebook = false;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.white,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Video Saved",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                "Saved to Collection",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          duration: Duration(seconds: 2),
        ));
        _favoratebook = true;
      }
    });
  }

  void togglefavrote<widget>() {
    setState(() {
      if (_favorate) {
        heart--;
        _favorate = false;
      } else {
        heart++;
        _favorate = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.grey[400],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.post_name.toString(),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 10,
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: SizedBox(
                                  child: Divider(
                                      color: Colors.blueGrey,
                                      height: 2,
                                      thickness: 3),
                                  width: 30),
                            ),
                            ListTile(
                              title: Text(
                                "Saved",
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              leading: Icon(Icons.bookmark_border),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Favorate_Screen(),
                                    ));
                              },
                            )
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.more_vert))
            ],
          ),
        ),
        Container(
          height: 300,
          child: Image.asset(
            widget.image.toString(),
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    // style: const ButtonStyle(minimumSize: MaterialStatePropertyAll(Size.fromHeight(10))),
                    icon: (_favorate
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border_outlined,
                          )),
                    onPressed: togglefavrote,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(
                      Icons.chat_bubble_outline_outlined,
                    ),
                  ),
                  Icon(
                    Icons.share,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap:  () => widget.list(),
                  child: IconButton(
                    // style: const ButtonStyle(minimumSize: MaterialStatePropertyAll(Size.fromHeight(10))),
                    icon: (_favoratebook
                        ? const Icon(
                            Icons.bookmark,
                          )
                        : Icon(
                            Icons.bookmark_border,
                          )
                    ),
                    onPressed:togglefavrotebook,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 5),
          child: Text(
            "$heart Likes",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10),
          child: Row(
            children: [
              Text("Liked by "),
              Text(
                "Nouman Habib",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(" and "),
              Text(
                " others ",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 3),
          child: ReadMoreText(
            preDataText: widget.post_name.toString(),
            preDataTextStyle: TextStyle(fontWeight: FontWeight.w700),
            '  hey i like this post for you thanks for sharing this awsome view ',
            textAlign: TextAlign.start,
            trimLength: 20,
          ),
        ),
      ],
    );
  }
}
