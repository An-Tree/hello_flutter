import 'dart:io';
import 'dart:async';
import 'my_class.dart';
// 异步编程的作用是处理耗时操作
// （如文件读写、网络请求等）而不阻塞主线程，
// 从而提高程序的响应性和性能。

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt'); // 创建文件对象
      if (await file.exists()) {
        // 检查文件是否存在
        var modified = await file.lastModified(); // 获取最后修改时间
        print('File for $object already exists. It was modified on $modified.');
        continue; // 跳过已存在的文件
      }
      await file.create(); // 创建新文件
      await file.writeAsString(
        'Start describing $object in this file.',
      ); // 写入初始内容
    } on IOException catch (e) {
      // 捕获文件操作异常
      print('Cannot create description for $object: $e'); // 打印错误信息
    }
  }
}

void main() {
  var astronauts = 0;
  if (astronauts == 0) {
    throw StateError('No astronauts.');
  }
}

Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}
