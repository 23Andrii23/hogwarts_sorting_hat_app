import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts/models/character_info_model.dart';
import 'package:hogwarts/screens/home_screen/widgets/house_card.dart';

class HomeScreen extends StatelessWidget {
  final CharacterInfo characterInfo;
  final Function(String?) onHouseSelected;

  const HomeScreen({
    required this.characterInfo,
    required this.onHouseSelected,
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: CachedNetworkImage(
                  imageUrl: characterInfo.image ?? '',
                  errorWidget: (context, url, error) => const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error),
                      Text('Image not found'),
                    ],
                  ),
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
                children: [
                  HouseCard(
                    house: 'Gryffindor',
                    icon: '🦁',
                    onTap: () => onHouseSelected('Gryffindor'),
                  ),
                  HouseCard(
                    house: 'Slytherin',
                    icon: '🐍',
                    onTap: () => onHouseSelected('Slytherin'),
                  ),
                  HouseCard(
                    house: 'Ravenclaw',
                    icon: '🦅',
                    onTap: () => onHouseSelected('Ravenclaw'),
                  ),
                  HouseCard(
                    house: 'Hufflepuff',
                    icon: '🦡',
                    onTap: () => onHouseSelected('Hufflepuff'),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => onHouseSelected(null),
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
