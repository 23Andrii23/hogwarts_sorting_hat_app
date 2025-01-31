import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts/models/character_info.model.dart';
import 'package:hogwarts/screens/home_screen/widgets/house_card.dart';

class HomeScreen extends StatelessWidget {
  final CharacterInfo characterInfo;
  final Function(String?) onHouseSelected;
  final VoidCallback onRefresh;
  final String? imageUrl;

  const HomeScreen({
    required this.characterInfo,
    required this.onHouseSelected,
    required this.onRefresh,
    this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isGuessed = characterInfo.isSucceed;

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
                    child: imageUrl?.isNotEmpty ?? false
                        ? CachedNetworkImage(
                            imageUrl: imageUrl!,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(Icons.error),
                            ),
                            height: 200,
                            width: 150,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(
                            height: 200,
                            width: 150,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
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
                        onTap: isGuessed
                            ? null
                            : () => onHouseSelected('Gryffindor'),
                        isDisabled: isGuessed,
                      ),
                      HouseCard(
                        house: 'Slytherin',
                        imagePath: 'assets/images/crests/slytherin.jpg',
                        onTap: isGuessed
                            ? null
                            : () => onHouseSelected('Slytherin'),
                        isDisabled: isGuessed,
                      ),
                      HouseCard(
                        house: 'Ravenclaw',
                        imagePath: 'assets/images/crests/ravenclaw.jpg',
                        onTap: isGuessed
                            ? null
                            : () => onHouseSelected('Ravenclaw'),
                        isDisabled: isGuessed,
                      ),
                      HouseCard(
                        house: 'Hufflepuff',
                        imagePath: 'assets/images/crests/hufflepuff.jpg',
                        onTap: isGuessed
                            ? null
                            : () => onHouseSelected('Hufflepuff'),
                        isDisabled: isGuessed,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: isGuessed ? null : () => onHouseSelected(null),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isGuessed ? Colors.grey : Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Not in House',
                          style: TextStyle(
                            fontSize: 16,
                            color: isGuessed ? Colors.grey : Colors.black,
                          ),
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
