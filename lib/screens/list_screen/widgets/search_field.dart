import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String _value = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SearchBar(
        shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
        hintText: 'Filter characters...',
        onChanged: (value) {
          setState(() => _value = value);
        },
        trailing: [
          IconButton(
            onPressed: () {},
            icon: _value.isEmpty
                ? const Icon(Icons.search)
                : const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
