import 'package:flutter/material.dart';

Widget searchBox() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: SizedBox(
      width: 200,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            size: 30,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          label: const Text(
            "Search for user",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    ),
  );
}
