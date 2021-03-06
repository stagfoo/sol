
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:intl/date_symbol_data_local.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:sol6/utils/storage.dart';
import 'package:sol6/utils/icons.dart';



class RecordingView extends StatefulWidget {
  final record;
  @override
  const RecordingView(Map map, {Key key, this.record}) : super(key: key);
  _RecordingView createState() => new _RecordingView(record);
}

class _RecordingView extends State<RecordingView> {
  final record;
  _RecordingView(this.record);


  bool _isRecording = false;
  bool _isPlaying = false;
  String filePath;
  Storage _storage = Storage();
  StreamSubscription _recorderSubscription;
  StreamSubscription _dbPeakSubscription;
  StreamSubscription _playerSubscription;
  FlutterSound flutterSound;

  String _recorderTxt = '00:00:00';
  String _playerTxt = '00:00:00';
  double _dbLevel;

  double slider_current_position = 0.0;
  double max_duration = 50.0;


  @override
  void initState() {
    super.initState();
    flutterSound = new FlutterSound();
    flutterSound.setSubscriptionDuration(20.0);
    flutterSound.setDbPeakLevelUpdate(0.8);
    flutterSound.setDbLevelEnabled(true);
    initializeDateFormatting();
    print('---RecordingView---');
    print(widget.record);
    print(this.record);
    print(context);
    print('---RecordingView---');
  }

  void startRecorder() async {
    try {
      String fileName = new DateTime.now().toLocal().toString().split(' ')[0];
      //  new File('sdcard/sol/$fileName.mp4');
      String mediaPath = await this._storage.localPath;
      filePath = '$mediaPath/$fileName.mp4';
      print(record);
      String path = await flutterSound.startRecorder(filePath);
      print('startRecorder: $path');
      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        DateTime date = new DateTime.fromMillisecondsSinceEpoch(
            e.currentPosition.toInt(),
            isUtc: true);
        String txt = DateFormat('mm:ss:SS', 'en_GB').format(date);

        this.setState(() {
          this._recorderTxt = txt.substring(0, 8);
        });
      });
      _dbPeakSubscription =
          flutterSound.onRecorderDbPeakChanged.listen((value) {
            print("got update -> $value");
            setState(() {
              this._dbLevel = value;
            });
          });

      this.setState(() {
        this._isRecording = true;
      });
    } catch (err) {
      print('startRecorder error: $err');
    }
  }

  void stopRecorder() async{
    try {
      String result = await flutterSound.stopRecorder();
      print('stopRecorder: $result');

      if (_recorderSubscription != null) {
        _recorderSubscription.cancel();
        _recorderSubscription = null;
      }
      if (_dbPeakSubscription != null) {
        _dbPeakSubscription.cancel();
        _dbPeakSubscription = null;
      }

      this.setState(() {
        this._isRecording = false;
      });
      // Navigator.pushNamed(context, '/list');
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }

  void startPlayer() async{
    String path = await flutterSound.startPlayer(filePath);
    await flutterSound.setVolume(1.0);
    print('startPlayer: $path');

    try {
      _playerSubscription = flutterSound.onPlayerStateChanged.listen((e) {
        if (e != null) {
          this.setState(() {
            this._isPlaying = true;
          });
        }
      });
    } catch (err) {
      print('error: $err');
    }
  }

  void stopPlayer() async{
    try {
      String result = await flutterSound.stopPlayer();
      print('stopPlayer: $result');
      if (_playerSubscription != null) {
        _playerSubscription.cancel();
        _playerSubscription = null;
      }

      this.setState(() {
        this._isPlaying = false;
      });
    } catch (err) {
      print('error: $err');
    }
  }

  void pausePlayer() async{
    String result = await flutterSound.pausePlayer();
    print('pausePlayer: $result');
  }

  void resumePlayer() async{
    String result = await flutterSound.resumePlayer();
    print('resumePlayer: $result');
  }

  void seekToPlayer(int milliSecs) async{
    int secs = Platform.isIOS ? milliSecs / 1000 : milliSecs;

    String result = await flutterSound.seekToPlayer(secs);
    print('seekToPlayer: $result');
  }

  @override
  Widget build(BuildContext context) {
      return Material(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/blur-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("How was your day today?", style:Theme.of(context).textTheme.display1),
            Text("Where did you go?", style:Theme.of(context).textTheme.display1),
            Text("Who did you see?", style:Theme.of(context).textTheme.display1),
            FlatButton(
              onPressed: startRecorder,
              child: recordIcon),
            FlatButton(
              onPressed: startPlayer,
              child: playIcon
              ),
            FlatButton(
              onPressed: stopRecorder,
              child: pauseIcon)
          ],
        ),
      ),
    );
  }
}

