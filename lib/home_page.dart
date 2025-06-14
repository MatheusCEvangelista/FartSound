import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'dart:html' as html; // Só funciona na Web

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> sounds = const [
    {'file': 'fart-01.mp3', 'label': 'Peido 1 💨'},
    {'file': 'fart-02.mp3', 'label': 'Peido 2 💨'},
    {'file': 'fart-03.mp3', 'label': 'Peido 3 💨'},
    {'file': 'fart-04.mp3', 'label': 'Peido 4 💨'},
    {'file': 'fart-05.mp3', 'label': 'Peido 5 💨'},
    {'file': 'fart-07.mp3', 'label': 'Peido 6 💨'},
    {'file': 'fart-squeak-01.mp3', 'label': 'Peido 7 🤏💨'},
  ];

  void playSound(String fileName) async {
    final player = AudioPlayer();
    await player.play(AssetSource('sounds/$fileName'));
  }

  void downloadSound(String fileName) {
    if (kIsWeb) {
      final url = 'assets/sounds/$fileName';
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', fileName)
        ..click();
    } else {
      debugPrint('Download só disponível na Web');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emissor de Peidos 💨')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sounds.length,
              itemBuilder: (context, index) {
                final file = sounds[index]['file']!;
                final label = sounds[index]['label']!;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => playSound(file),
                          child: Text(label),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.download),
                        onPressed: () => downloadSound(file),
                        tooltip: 'Baixar som',
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              '⚠️ O botão de download funciona apenas na versão Web do app.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
