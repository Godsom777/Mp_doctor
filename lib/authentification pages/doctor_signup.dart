import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DoctorSignUpWidget extends StatefulWidget {
  const DoctorSignUpWidget({super.key});

  @override
  _DoctorSignUpWidgetState createState() => _DoctorSignUpWidgetState();
}

class _DoctorSignUpWidgetState extends State<DoctorSignUpWidget> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';
  String _medicalLicenseNumber = '';
  String _specialty = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // TODO: Sign up the doctor
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Doctor Sign Up'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign up to begin',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _name = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _email = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _password = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Medical License Number',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your medical license number.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _medicalLicenseNumber = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Specialty',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your specialty.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _specialty = value!;
                            });
                          })
                    ]))));
  }
}
