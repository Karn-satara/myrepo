import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud/crudFunctions/formcurdfunctions.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();

  // Data collection and sending to the actual method
  void _insertStudent() {
    if (_formKey.currentState!.validate()) {
      StudentService.insert(
        _nameController.text,
        int.parse(_ageController.text),
        _emailController.text,
        _districtController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Student inserted successfully')),
      );
    }
  }


void _insertemp() {
    if (_formKey.currentState!.validate()) {
      StudentService.insert(
        _nameController.text,
        int.parse(_ageController.text),
        _emailController.text,
        _districtController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Student inserted successfully')),
      );
    }
  }


  void _updateStudent() {
    if (_formKey.currentState!.validate()) {
      StudentService.update(
        _nameController.text,
        int.parse(_ageController.text),
        _emailController.text,
        _districtController.text,
      );
    }
  }

  void _deleteStudent() {
    StudentService.delete(_emailController.text);
    _clearForm();
  }

  void _getStudent() async {
    Map<String, dynamic>? student =
        await StudentService.get(_emailController.text);

    if (student != null) {
      _nameController.text = student['name'];
      _ageController.text = student['age'].toString();
      _districtController.text = student['district'];
    }
  }

  void _clearForm() {
    _nameController.clear();
    _ageController.clear();
    _emailController.clear();
    _districtController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Form')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _districtController,
                decoration: InputDecoration(labelText: 'District'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: _insertStudent, child: Text('Insert')),
                  ElevatedButton(onPressed: _insertemp, child: Text('Insert by emep')),
                  ElevatedButton(onPressed: _updateStudent, child: Text('Update')),
                  ElevatedButton(onPressed: _deleteStudent, child: Text('Delete')),
                  ElevatedButton(onPressed: _getStudent, child: Text('Get')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
