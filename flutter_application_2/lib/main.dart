import 'package:flutter/material.dart';
import 'quote.dart';
import 'quotecard.dart';

void main() {
  runApp(const MaterialApp(
    home: Quote(),
  ));
}

class Quote extends StatefulWidget {
  const Quote({Key? key}) : super(key: key);

  @override
  _QuoteState createState() => _QuoteState();
}

class _QuoteState extends State<Quote> with SingleTickerProviderStateMixin {
  List<Quote1> q = [
    Quote1(
        movie: 'Persona',
        director: 'Ingmar Bergman',
        year: 1966,
        text: 'Reality has its own ways. You are forced to react'),
    Quote1(
        movie: 'Secrets and Leigh',
        director: 'Mike Leigh',
        year: 1996,
        text: 'You dont miss something you never had. Why not? '),
    Quote1(
        movie: 'Un Prophete',
        year: 2009,
        director: 'Jacques Audiard',
        text: 'How do you do it. Are you Prophet or What?'),
  ];

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: const Text('Movies Quotes'),
          titleTextStyle:
              const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
              children: q
                  .map((e) => QuoreCard(
                      quote: e,
                      delete: () {
                        setState(() {
                          q.remove(e);
                        });
                      }))
                  .toList()),
        ));
  }
}
