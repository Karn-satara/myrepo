import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/crudFunctions/crud.dart';

class BtnUiCrud extends StatefulWidget {
  const BtnUiCrud({super.key});

  @override
  State<BtnUiCrud> createState() => _BtnUiCrudState();
}

class _BtnUiCrudState extends State<BtnUiCrud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Creat();
            }, child: Text('Create')),
            ElevatedButton(onPressed: (){
              Update('students', 'Info', 'age', 25);
            }, child: Text('Update the Info ')),
            ElevatedButton(onPressed: (){}, child: Text('Delete Info')),
            ElevatedButton(onPressed: (){}, child: Text('Fetch')),
          ],
        ),
      ),
    );
  }
}