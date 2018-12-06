void main() {
  print('Hello, World!');
  var number = 42;
  printNumber(number);
//  所有未初始化的值为null
  int intDefault;
//  生产环境默认忽略了assert 但是开发环境中，除非条件为真，否则会引发异常
  assert(intDefault == null);
  print(intDefault);
}

void printNumber(num number) {
  print('The number is $number');
}
