import 'package:flutter/material.dart';

class QuoreCard extends StatelessWidget {
  const QuoreCard({
    Key? key,
    required this.quote,
    required this.delete,
  }) : super(key: key);

  final quote;
  final Function() delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 224, 19, 19),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 14, 10, 0),
          child: Text(
            quote.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 24, 247, 255)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              quote.movie,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              ' (${quote.director})',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              ' (${quote.year})',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(28.0, 0, 0, 0),
              child: ElevatedButton.icon(
                  onPressed: delete,
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete')),
            ),
          ],
        )
      ]),
    );
  }
}
