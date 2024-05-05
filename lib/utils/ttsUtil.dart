// ignore_for_file: file_names

import 'package:flutter_tts/flutter_tts.dart';

class TTSUtil {
  // 单例模式固定格式
  TTSUtil._();

  // 单例模式固定格式
  static TTSUtil? _instance;

  // 单例模式固定格式
  static TTSUtil getInstance() {
    if (_instance == null) {
      _instance = TTSUtil._();
    }
    return _instance!;
  }

  late FlutterTts flutterTts;

  initTTS() {
    flutterTts = FlutterTts();
  }

  Future speak(String text) async {
    /// 设置语言
    await flutterTts.setLanguage("en-US");

    /// 设置音量
    await flutterTts.setVolume(1.0);

    /// 设置语速
    await flutterTts.setSpeechRate(0.5);

    /// 音调
    await flutterTts.setPitch(1.0);

    if (text != null) {
      if (text.isNotEmpty) {
        await _stop();
        await flutterTts.speak(text);
      }
    }
  }

  /// 暂停
  Future _pause() async {
    await flutterTts.pause();
  }

  /// 结束
  Future _stop() async {
    await flutterTts.stop();
  }
}
