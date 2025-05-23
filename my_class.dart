/**
 * import 分为三种
 * 类的属性有类型，是空安全的
 * getter和setter是通过get和set来实现的，加上胖箭头
 */
// Importing core libraries
import 'dart:math';

// Importing libraries from external packages
// 类似于pip下载的ku
// import 'package:test/test.dart';

// Importing files
//自己的文件
import 'my_var.dart';

void main() {
  print(fibonacci(20));

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
}

class Spacecraft {
  //三个属性
  String name;
  DateTime? launchDate; //?表示空安全，可以为null

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  //两个构造函数
  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }
  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // 以及一个方法
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}
