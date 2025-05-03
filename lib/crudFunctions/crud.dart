import 'package:cloud_firestore/cloud_firestore.dart';


void Creat()async{
  await FirebaseFirestore.instance.collection('students').doc('Info').set({
    'name':'Kaustubh',
    'role':'Developer',
    'age':21,
    
  },
  );
print('Data Inserted');
}



void Update(String collName,docName,field,dynamic newfieldval)async{
  await FirebaseFirestore.instance.collection(collName).doc(docName).update({
   field:newfieldval
    
  },
  );
print('Data updated');
}

