import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('语音聊天'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // 弹出个人信息等菜单的操作
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ChatBody(),
            ),
            VoiceInputButton(),
          ],
        ),
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('对方头像URL'), // 替换为对方头像的URL
            radius: 50, // 控制头像大小
          ),
          Text('对方正在说话'), // 根据实际情况显示聊天状态
        ],
      ),
    );
  }
}

class VoiceInputButton extends StatefulWidget {
  @override
  _VoiceInputButtonState createState() => _VoiceInputButtonState();
}

class _VoiceInputButtonState extends State<VoiceInputButton> {
  bool _isRecording = false;

  void _startRecording() {
    // 开始录音逻辑
    setState(() {
      _isRecording = true;
    });
    // 启动计时器
  }

  void _stopRecording() {
    // 结束录音逻辑
    setState(() {
      _isRecording = false;
    });
    // 发送语音逻辑
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _startRecording();
      },
      onLongPressEnd: (details) {
        _stopRecording();
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isRecording ? Colors.red : Colors.blue,
        ),
        child: Icon(
          _isRecording ? Icons.mic : Icons.send,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
