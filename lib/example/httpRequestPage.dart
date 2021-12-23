import 'dart:convert';
import 'dart:io';
// import 'package:flutter_html/flutter_html.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class HttpRequestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HttpRequestPageState();
  }
}

class _HttpRequestPageState extends State<HttpRequestPage> {
  String msg = "";
  //httpClient 网络请求
  get() async {
    //创建网络调用示例，设置通用请求行为(超时时间)
    var httpClient = HttpClient();
    httpClient.idleTimeout = Duration(seconds: 5);
    //构造URI，设置user-agent为"Custom-UA"
    var uri = Uri.parse("https://flutter.dev");
    var request = await httpClient.getUrl(uri);
    request.headers.add("user-agent", "Custom-UA");
    //发起请求，等待响应
    var response = await request.close();
    //收到响应，打印结果
    if (response.statusCode == HttpStatus.ok) {
      // setState(() {
      //   msg = jsonDecode(response.transform(utf8.decoder).join().toString());
      //   print("打印结果:" + msg);
      // });
      print(await response.transform(utf8.decoder).join());
    } else {
      print('Error: \nHttp status ${response.statusCode}');
    }
  }

  //Dio 网络请求
  void getRequest() async {
    Dio dio = Dio();
    var response = await dio.get("https://flutter.dev",
        options: Options(headers: {"user-agent": "Custom-UA"}));
    if (response.statusCode == HttpStatus.ok) {
      print("Dio GET请求:" + response.data.toString());
    } else {
      print("Error: ${response.statusCode}");
    }
  }

  //Dio 上传文件 FormData
  void uploadFile() async {
    Dio dio = Dio();
//增加拦截器
/*
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      //为每个请求头都增加user-agent
      options.headers["user-agent"] = "Custom-UA";
      //检查是否有token，没有则直接报错
      if (options.headers['token'] == null) {
        return dio.reject("Error:请先登录");
      }
      //检查缓存是否有数据
      if (options.uri == Uri.parse('http://xxx.com/file1')) {
        return dio.resolve("返回缓存数据");
      }
      //放行请求
      return options;
    }));
    */
//增加try catch，防止请求报错
    try {
      var response = await dio.get("https://xxx.com/xxx.zip");
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
    FormData formData = FormData.fromMap(
        {"file1": UploadFileInfo(File("./file1.txt"), "file1.txt")});
    var response = await dio.post("https://xxx.com/upload", data: formData);
    print(response.toString());
    //下载文件
    dio.download("https://xxx.com/file1", "xx1.zip");
    dio.download("", "", onReceiveProgress: (count, total) => {});

    //同时发起多个并行请求
    List<Response> responseX = await Future.wait([
      dio.get("https://flutter.dev"),
      dio.get("https://pub.dev/packages/dio")
    ]);
    //打印请求1响应结果
    print("Response1: ${responseX[0].toString()}");
    //打印请求2响应结果
    print("Response2: ${responseX[1].toString()}");
  }

  void loadStudent() {
    final jsonRespose = JsonDecoder();
    // Student stu = Student.fromJson(jsonRespose);
    // print(stu.name);
  }

  @override
  void initState() {
    // this.get();
    this.getRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("HttpClient")), body: Text(msg));
  }
}

class UploadFileInfo {
  final File? filePath;
  final String? fileName;
  UploadFileInfo(this.filePath, this.fileName);
}

class File {
  final String? fileName;
  File(this.fileName);
}

class Student {
  final String? id;
  final String? name;
  final int? score;
  final Teacher? teacher;
  final List<Course>? courses;

  Student({this.id, this.name, this.score, this.teacher, this.courses});
  //JSON解析工厂类，使用字典数据为对象初始化赋值
  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        id: parsedJson['id'],
        name: parsedJson['name'],
        score: parsedJson['score'],
        courses: getCourses(parsedJson['courses']),
        //增加映射规则
        teacher: Teacher.fromJson(parsedJson['teacher'],
        ));
  }

   static List<Course> getCourses(List<dynamic> list) {
    List<Course> projects = [];
    for (var v in list) {
      projects.add(Course.fromJson(v));
    }
    return projects;
  }
}

class Course {
  final String? projectName;
  Course({this.projectName});

  factory Course.fromJson(Map<String, dynamic> parsedJson) {
    return Course(projectName: parsedJson['projectName']);
  }
}

class Teacher {
  //Teacher的名字与年龄
  final String? name;
  final int? age;
  //构造方法
  Teacher({this.name, this.age});
  //JSON解析工厂类，使用字典数据为对象初始化赋值
  factory Teacher.fromJson(Map<String, dynamic> parsedJson) {
    return Teacher(name: parsedJson['name'], age: parsedJson['age']);
  }
}
/*
    String jsonString = '''
    { "id":"123",
      "name":"张三",
      "score" : 95,
      "teacher": {
                  "name": "李四",
                  "age" : 40
                  }
      }
    ''';
*/