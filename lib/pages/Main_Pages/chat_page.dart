import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatrat/fake_data/datas/data.dart';
import 'package:chatrat/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

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
          title: Column(
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
                style: TextStyle(color: onlineColor, fontSize: 15),
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (BuildContext context, index) {
                  return _sendermsgBox();
                },
              ),
            ),
            _textBox(),
          ],
        ),
      ),
    );
  }

  Widget _textBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 10),
      child: Row(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: textBoxColor,
              border: Border.all(),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: TextField(
                    controller: _controller,
                    cursorColor: Colors.grey,
                    maxLines: null,
                    decoration: const InputDecoration.collapsed(
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
                color: sendButtonColor,
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
    );
  }

  Widget _sendermsgBox() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              // height: 100,
              decoration: const BoxDecoration(
                color: senderChatBoxColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _controller.text,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _usermsgBox() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 200,
              decoration: const BoxDecoration(
                color: userChatBoxColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "hii",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
