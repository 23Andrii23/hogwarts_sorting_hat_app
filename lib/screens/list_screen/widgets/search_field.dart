import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final Function(String?) onChanged;
  final VoidCallback onClear;
  const SearchField({
    required this.onChanged,
    required this.onClear,
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SearchBar(
        shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
        controller: textController,
        hintText: 'Filter characters...',
        onChanged: widget.onChanged,
        trailing: [
          IconButton(
            onPressed: () {
              setState(() {
                textController.clear();
                widget.onClear();
              });
            },
            icon: textController.text.isEmpty
                ? const Icon(Icons.search)
                : const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
