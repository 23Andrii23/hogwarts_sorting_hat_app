import 'package:flutter/material.dart';
import 'package:hogwarts/screens/list_screen/widgets/character_list_item.dart';
import 'package:hogwarts/screens/list_screen/widgets/search_field.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchField(),
        SizedBox(height: 10),
        CharacterListItem(
          name: 'Harry Potter',
          attempts: 2,
          imageUrl: 'https://ik.imagekit.io/hpapi/harry.jpg',
          isSuccess: true,
        ),
        CharacterListItem(
          name: 'Hermione Granger',
          attempts: 2,
          imageUrl: 'https://ik.imagekit.io/hpapi/hermione.jpeg',
          isSuccess: false,
        ),
      ],
    );
  }
}
