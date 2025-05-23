// 不区分类型，代码类型安全
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg',
};
// 主函数入口
void main() {
  fun1();
  var result = fibonacci(20);
  print(result);
  // 胖箭头
  flybyObjects.where((name) => name.contains('n')).forEach(print);
}

// 流程控制
void fun1() {
  //流程控制关键字都得加上括号
  // if 语句
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }
  // for in
  for (final object in flybyObjects) {
    print(object);
  }
  // for 循环
  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }

  print(year / 2);
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
