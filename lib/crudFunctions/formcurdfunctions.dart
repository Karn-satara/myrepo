import 'package:firebase_database/firebase_database.dart';

class StudentService {
  static final DatabaseReference studentsRef = FirebaseDatabase.instance
      .ref()
      .child('students');
      //employee collection
    static final DatabaseReference employeeRef = FirebaseDatabase.instance
      .ref()
      .child('employee');  
//Employee Collection method
static Future<void> insertemp(
  String name,
  int age,
  String email,
  String district,
) async {
  final sanitizedEmail = email.replaceAll('.', ',');
  final employeeRef = FirebaseDatabase.instance.ref().child('employee');
  await employeeRef.child(sanitizedEmail).set({
    'name': name,
    'age': age,
    'email': email,
    'district': district,
  });
}


  static Future<void> insert(
    String name,
    int age,
    String email,
    String district,
  ) async {
    final sanitizedEmail = email.replaceAll('.', ',');
    
    
    
    /*Error-->
"kaustubhiparkar@gmail.com". Paths must be non-empty strings and
can't contain ".", "#", "$", "[", or "]"
  */
    //why-->  To use an email address as a key in Firebase Realtime Database
    //what--> we are using the sanitizedemail method here
    //Solution--> replace all dots (.) with commas (,),
    final studentRef = studentsRef.child(sanitizedEmail);
    await studentRef.set({
      'name': name,
      'age': age,
      'email': email,
      'district': district,
    });
  }

  // static Future<void> insert(
  //   String name,
  //   int age,
  //   String email,
  //   String district,
  // ) async {
  //   final studentRef = studentsRef.child(email);
  //   //child(email) path create kartay as like tree structure student(collection)->email name
  //   await studentRef.set({
  //     'name': name,
  //     'age': age,
  //     'email': email,
  //     'district': district,
  //   });
  // }

  static Future<void> update(
    String name,
    int age,
    String email,
    String district,
  ) async {
    final sanitizedEmail = email.replaceAll('.', ',');
//we are updating the info as per emailid
    final studentRef = studentsRef.child(sanitizedEmail);
    await studentRef.update({'name': name, 'age': age, 'district': district});
  }

  static Future<void> delete(String email) async {
    final sanitizedEmail = email.replaceAll('.', ',');
    final studentRef = studentsRef.child(sanitizedEmail);
    await studentRef.remove();
  }

  static Future<Map<String, dynamic>?> get(String email) async {
    final sanitizedEmail = email.replaceAll('.', ',');
    final studentRef = studentsRef.child(sanitizedEmail);
    final event = await studentRef.once();
    final snapshot = event.snapshot;

    if (snapshot.exists) {
      return Map<String, dynamic>.from(snapshot.value as Map);
    }
    return null;
  }
}
