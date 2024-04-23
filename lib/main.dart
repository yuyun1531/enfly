import 'package:enfly/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'pages/chat.dart';

class VoiceInputChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(text: '你好，这是一个语音输入的聊天页面', isUserA: true),
                ChatBubble(text: '你好，是的，只能通过语音输入哦', isUserA: false),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {
                    // Logic to start voice input
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isUserA;

  ChatBubble({required this.text, required this.isUserA});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isUserA ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isUserA ? Colors.blue : Colors.green,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

void main() {
  runApp(HomePage());
}
