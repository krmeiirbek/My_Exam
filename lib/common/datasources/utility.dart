import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Utility {
  static downloadFileLocally(
    String mediaURL,
    Function(int status) setStatus,
    Function(String filePath, int status) setFilePath, {
    required void Function(int total, int count) downloadProgress,
  }) async {
    String fileName = mediaURL.split('/').last;

    Dio dio = Dio();
    setStatus(1);
    await getApplicationDocumentsDirectory().then((appDir) async {
      if (!File('${appDir.path}/$fileName').existsSync()) {
        print('Downloading');
        var filePath =
            await File('${appDir.path}/$fileName').create(recursive: true);
        await dio.download(mediaURL, filePath.path,
            onReceiveProgress: downloadProgress);
        setFilePath(filePath.path, 2);
      } else {
        print('Already downloaded');
        setFilePath(File('${appDir.path}/$fileName').path, 2);
      }
    });
  }
}
