import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Sign Up'),
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const SizedBox(height: 24.0),
Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(12.0),
color: Colors.grey[300],
boxShadow: [
BoxShadow(
color: Colors.grey.withOpacity(0.2),
spreadRadius: 2,
blurRadius: 5,
offset: const Offset(0, 3),
),
],
),
child: Column(
children: [
const SizedBox(height: 16.0),
const Text(
'Legal Name',
style: TextStyle(fontWeight: FontWeight.bold),
),
const SizedBox(height: 8.0),
TextField(
obscureText: true,
decoration: const InputDecoration(
border: OutlineInputBorder(),
hintText: 'Type your full name',
),
onChanged: (value) {},
),
const SizedBox(height: 24.0),
const Text(
'Password',
style: TextStyle(fontWeight: FontWeight.bold),
),
const SizedBox(height: 8.0),
TextField(
obscureText: true,
decoration: const InputDecoration(
border: OutlineInputBorder(),
hintText: 'Use a secure password',
),
onChanged: (value) {},
),
const SizedBox(height: 24.0),
Row(
children: [
IconButton(
onPressed: () {},
icon: const Icon(Icons.person),
),
const SizedBox(width: 8),
IconButton(
onPressed: () {},
icon: const Icon(Icons.lock),
),
],
),
],
),
),
],
),
),
);
}
}