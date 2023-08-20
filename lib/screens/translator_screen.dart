import 'package:flutter/material.dart';
import 'package:lla/components/LLA_app_bar.dart';
import 'package:lla/components/LLA_bottom_navigational_bar.dart';
import 'package:lla/utilities/constants.dart';
import 'package:translator/translator.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({super.key});

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  String translated = 'translated';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LLAAppBar('T R A N S L A T E', true),
      bottomNavigationBar: LLABottomNavigationBar(
        context,
        Theme.of(context).colorScheme.secondary,
        Theme.of(context).colorScheme.secondary,
        Theme.of(context).colorScheme.primary,
      ),
      body: Card(
        margin: const EdgeInsets.all(12),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text('English (US)'),
              const SizedBox(height: 10),
              TextField(
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                decoration:
                    const InputDecoration(hintText: 'type in some text here'),
                onChanged: (text) async {
                  final translation = await text.translate(
                    from: 'auto', //english
                    to: 'es', //spanish
                  );

                  setState(() {
                    translated = translation.text;
                  });
                },
              ),
              const Divider(
                height: 32,
              ),
              Text(
                translated,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
