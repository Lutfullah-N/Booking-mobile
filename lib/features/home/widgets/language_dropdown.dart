import 'package:booking/l10n/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return DropdownButton<Locale>(
      value: languageProvider.locale,
      items: const [
        DropdownMenuItem(value: Locale('en'), child: Text("English")),
        DropdownMenuItem(value: Locale('es'), child: Text("Español")),
        DropdownMenuItem(value: Locale('fa'), child: Text("Dari")),
        DropdownMenuItem(value: Locale('ps'), child: Text("Pashto")),
        DropdownMenuItem(value: Locale('nl'), child: Text("Dutch")),
      ],
      onChanged: (locale) {
        if (locale != null) {
          languageProvider.setLocale(locale);
        }
      },
    );
  }
}
