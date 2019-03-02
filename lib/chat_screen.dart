import 'package:flutter/material.dart';
import 'chat_message.dart';

class ChatScreen extends StatefulWidget {
  @override 
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController =TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmit(String text) {
    _textController.clear();
    setState(() {
      if (text.length > 0) {
        _messages.insert(0, ChatMessage(text: text,));
      }
    });
  }

  Widget _textComposer() {
    return IconTheme(
      data: IconThemeData(
        color: Colors.blueAccent
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "Message"
                ),
                controller: _textController,
                onSubmitted: _handleSubmit,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmit(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                reverse: true,
                itemBuilder: (_, int index) => (_messages[index]),
                itemCount: _messages.length,
              ),
            ),
            Divider(
              height: 1,
            ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor
            ),
            child: _textComposer(),
          )
        ],
      ),
    );
  }
}