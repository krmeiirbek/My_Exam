library network_to_local_file;

import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:my_exam/common/datasources/utility.dart';
import 'package:video_player/video_player.dart';
import 'local_video_player.dart';

class NetworkToLocal extends StatefulWidget {
  final String mediaURL;
  final String mediaType;

  @override
  NetworkToLocalState createState() => NetworkToLocalState();

  const NetworkToLocal(
      {super.key, required this.mediaURL, required this.mediaType});
}

class NetworkToLocalState extends State<NetworkToLocal> {
  int _status = 0;
  String _filePath = '';
  double _downloadPercentage = 0;

  setStatus(int status) {
    setState(() {
      _status = status;
    });
  }

  setFilePath(String filePath, int status) {
    setState(() {
      _filePath = filePath;
      _status = status;
    });
  }

  void downloadProgress(int count, int total) {
    setState(() {
      _downloadPercentage = count / total;
    });
  }

  late VideoPlayerController _videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    Utility.downloadFileLocally(widget.mediaURL, setStatus, setFilePath,
        downloadProgress: downloadProgress);
  }

  @override
  Widget build(BuildContext context) {
    if (_status == 0) {
      return const CircularProgressIndicator();
    } else if (_status == 1) {
      return CircularProgressIndicator(value: _downloadPercentage);
    } else {
      if (widget.mediaType == 'image') {
        return Image.file(File(_filePath));
      } else if (widget.mediaType == 'video') {
        return LocalVideoPlayer(filePath: _filePath);
      } else {
        return CircularProgressIndicator(value: _downloadPercentage);
      }
    }
  }
}
