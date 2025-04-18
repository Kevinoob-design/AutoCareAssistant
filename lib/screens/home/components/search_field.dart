import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_care_assistant/shared/config/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor.withValues(alpha: 0.1),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: searchOutlineInputBorder,
          focusedBorder: searchOutlineInputBorder,
          enabledBorder: searchOutlineInputBorder,
          hintText: AppLocalizations.of(context)!.searchBarHint,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
