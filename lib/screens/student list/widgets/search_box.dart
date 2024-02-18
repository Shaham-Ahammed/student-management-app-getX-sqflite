import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
      child: TextField(
        // onChanged: (value) => _runfilter(value),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            labelText: "search",
            suffixIcon: Icon(Icons.search)),
      ),
    );
  }
}