import "package:flutter/material.dart";

class MessageScreen extends StatefulWidget {
  final List messages;
  const MessageScreen({Key? key, required this.messages}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.separated(
      separatorBuilder: (context, index) =>
          const Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: widget.messages[index]["isUserMessage"]
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        widget.messages[index]["isUserMessage"] ? 20 : 0),
                    topLeft: const Radius.circular(20),
                    bottomRight: Radius.circular(
                        widget.messages[index]["isUserMessage"] ? 0 : 20),
                    topRight: Radius.circular(20),
                  ),
                  color: widget.messages[index]["isUserMessage"]
                      ? Color.fromARGB(255, 23, 104, 179)
                      : Color.fromARGB(255, 43, 99, 219),
                ),
                constraints: BoxConstraints(maxWidth: width * 2 / 3),
                child: Text(
                  widget.messages[index]["message"].text.text[0],
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}