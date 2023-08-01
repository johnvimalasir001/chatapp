import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatrat/fake_data/datas/data.dart';
import 'package:chatrat/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: appBarColor,
          toolbarHeight: 80,
          leadingWidth: 90,
          leading: Builder(
            builder: (context) {
              return Row(
                children: [
                  IconButton(
                    splashRadius: 1,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    backgroundImage:
                        CachedNetworkImageProvider(currentUser.imageUrl),
                  ),
                ],
              );
            },
          ),
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "John",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Online",
                style: TextStyle(
                    color: Color.fromARGB(255, 165, 226, 167), fontSize: 15),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.call_rounded,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          splashRadius: 1,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.emoji_emotions_rounded,
                            size: 25,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 300,
                          child: TextField(
                            cursorColor: Colors.grey,
                            maxLines: null,
                            decoration: InputDecoration.collapsed(
                              hintText: "Type a Message",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: IconButton(
                          splashRadius: 1,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.send_rounded,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
