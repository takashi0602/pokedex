import 'package:flutter/material.dart';

import './const/pokeApi.dart';
import './models/pokemon.dart';

class PokeDetail extends StatelessWidget {
  const PokeDetail({Key? key, required this.poke}) : super(key: key);
  final Pokemon poke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(32),
                        child: Image.network(
                          poke.imageUrl,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'No.${poke.id}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    poke.name,
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: poke.types
                        .map(
                          (type) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Chip(
                              backgroundColor:
                                  pokeTypeColors[type] ?? Colors.grey,
                              label: Text(
                                type,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: (pokeTypeColors[type] ?? Colors.grey)
                                              .computeLuminance() >
                                          0.5
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
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
