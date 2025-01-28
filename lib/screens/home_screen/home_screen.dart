import 'package:flutter/material.dart';
import 'package:hogwarts/models/character_info_model.dart';
import 'package:hogwarts/screens/home_screen/widgets/house_card.dart';

class HomeScreen extends StatelessWidget {
  final CharacterInfo characterInfo;
  const HomeScreen({
    required this.characterInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: Column(
            children: [
              ClipRRect(
                child: Image.network(
                  characterInfo.image ?? '',
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                characterInfo.name ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: (1 / .45),
                children: const [
                  HouseCard(
                    house: 'Gryffindor',
                    icon: '🦁',
                  ),
                  HouseCard(
                    house: 'Slytherin',
                    icon: '🐍',
                  ),
                  HouseCard(
                    house: 'Ravenclaw',
                    icon: '🦅',
                  ),
                  HouseCard(
                    house: 'Hufflepuff',
                    icon: '🦡',
                  ),
                ],
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  debugPrint('Not in House');
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      'Not in House',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
