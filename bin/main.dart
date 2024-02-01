import 'package:test/test.dart';

void main(List<String> arguments) async {
  // String studentName = '';
  Map<String, dynamic> resultName = await getStudentName(3);
  List<String> courseList = await getCourseInfo(resultName['studentName']);
  String courseGrade = await getGrade(courseList[0]);
  print(courseGrade);

  Future<int> bigNumber = Future(() {
    int bigNumber = 0;

    for (int i = 0; i < 10000000; i++) {
      bigNumber = i;
    }
    // return bigNumber;
    throw "Did not calculate";
  });

  bigNumber.then((value) => prints(value)).catchError((error) => print(error));

  //Mock Data
  var s1 = Future.value(() => 'Hello');
  var s2 = Future.error(() => 'Error');
  s1.then((value) => null);
  // s2.catchError('onError');
}

Future<String> getGrade(String courseName) {
  return Future.delayed(Duration(seconds: 3), () {
    return 'Grade: $courseName : 98%';
  });
}

Future<List<String>> getCourseInfo(String studentName) {
  print("Student $studentName Courses:");
  return Future.delayed(Duration(seconds: 4), () {
    return ['Dart', 'Flutter', 'Java'];
  });
}

Future<Map<String, dynamic>> getStudentName(int id) {
  print("Studnet name is: $id");
  return Future<Map<String, dynamic>>.delayed(Duration(seconds: 3), () {
    return {'id': id, 'studentName': 'Rose'};
  });
}
