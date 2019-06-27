void main() {
  future1();
  future2();
  callBackHell1();
  callBackHell2();
  callBackHell3();
  stream();
}

void stream() {
//  使用Stream 会多次读取数据的异步任务 类比future2()
  Stream.fromFutures([
    Future.delayed(new Duration(seconds: 1),(){
      return "hello 1";
    }),
    Future.delayed(new Duration(seconds: 2),(){
      throw AssertionError("error");
    }),
    Future.delayed(new Duration(seconds: 3),(){
      return "hello 3";
    })
  ]).listen((data){
    print(data);
  },onError: (e){
    print(e);
  },onDone: (){

  });
}

//使用async/await消除 callback hell
callBackHell3() async {
  String id = await login("c", "333");
  String userInfo = await getUserInfo(id);
  await saveUserinfo(userInfo);
}

//使用future消除callback hell
void callBackHell2() {
  login("b", "2222").then((id){
    return getUserInfo(id);
  }).then((userInfo){
    return saveUserinfo(userInfo);
  }).then((e){

  }).catchError((e){
    print(e);
  });
}

void callBackHell1() {
  login("alice", "1111").then((id){
    getUserInfo(id).then((userInfo){
      saveUserinfo(userInfo);
    });
  });
}

Future<String> login(String userName,String pwd) async{
  return Future(() => "login + $userName + $pwd");
}

Future<String> getUserInfo(String id) async{
  print(id);
  return Future(() => "getUserInfo + $id");
}

Future saveUserinfo(String userInfo) async{
  print(userInfo);
}

void future2() {
//  使用future 时候会统一返回任务，类比Stream
  Future.wait([
    Future.delayed(new Duration(seconds: 2), () {
      return 'hello';
    }),
    Future.delayed(new Duration(seconds: 4), () {
      return 'world';
    }),
    Future.delayed(new Duration(seconds: 3), () {
      throw new AssertionError("Error");
    })
  ]).then((results) {
    results.forEach((item) => print(item));
  }).catchError((e) {
    print(e);
  });
}

void future1() {
  Future.delayed(new Duration(seconds: 2), () {
    return "hi world!";
  }).then((data) {
    print(data);
  }).catchError((e) {
    //执行任务失败触发
  }).whenComplete(() {
    //无论成功失败都会到
  });
}
