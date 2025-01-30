import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts/models/character_info.model.dart';
import 'package:hogwarts/screens/home_screen/widgets/house_card.dart';

class HomeScreen extends StatelessWidget {
  final CharacterInfo characterInfo;
  final Function(String?) onHouseSelected;
  final VoidCallback onRefresh;

  const HomeScreen({
    required this.characterInfo,
    required this.onHouseSelected,
    required this.onRefresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
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
                        imagePath: 'assets/images/crests/gryffindor.jpg',
                        onTap: () => onHouseSelected('Gryffindor'),
                      ),
                      HouseCard(
                        house: 'Slytherin',
                        imagePath: 'assets/images/crests/slytherin.jpg',
                        onTap: () => onHouseSelected('Slytherin'),
                      ),
                      HouseCard(
                        house: 'Ravenclaw',
                        imagePath: 'assets/images/crests/ravenclaw.jpg',
                        onTap: () => onHouseSelected('Ravenclaw'),
                      ),
                      HouseCard(
                        house: 'Hufflepuff',
                        imagePath: 'assets/images/crests/hufflepuff.jpg',
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
        ),
      ),
    );
  }
}
