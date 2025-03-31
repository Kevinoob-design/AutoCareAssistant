import 'package:auto_care_assistant/screens/car_catalog/models/car.dart';
import 'package:auto_care_assistant/shared/components/inputs/drop_down_bottom.dart' show InputDropDownBottomFormField;
import 'package:auto_care_assistant/shared/components/inputs/input_text.dart' show InputTextFormField;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NewCarForm extends StatelessWidget {
  const NewCarForm({super.key, required this.formKey, required this.formData});

  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> formData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              InputTextFormField(
                labelText: AppLocalizations.of(context)!.carTitleLabel,
                hintText: AppLocalizations.of(context)!.carTitleHint,
                onChanged: (val) {},
                onSaved: (val) => formData['title'] = val,
              ),
              SizedBox(height: 16),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: InputTextFormField(
                      labelText: AppLocalizations.of(context)!.carMakeLabel,
                      hintText: AppLocalizations.of(context)!.carMakeHint,
                      onChanged: (val) {},
                      onSaved: (val) => formData['make'] = val,
                    ),
                  ),
                  Expanded(
                    child: InputTextFormField(
                      labelText: AppLocalizations.of(context)!.carModelLabel,
                      hintText: AppLocalizations.of(context)!.carModelHint,
                      onChanged: (val) {},
                      onSaved: (val) => formData['model'] = val,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: InputTextFormField(
                      labelText: AppLocalizations.of(context)!.carDistanceTraveledLabel,
                      hintText: AppLocalizations.of(context)!.carDistanceTraveledHint,
                      onChanged: (val) {},
                      onSaved: (val) => formData['distanceTraveled'] = val,
                    ),
                  ),
                  Expanded(
                    child: InputDropDownBottomFormField<DistanceMeasurement>(
                      onChanged: (val) {},
                      onSaved: (val) => formData['distanceMeasurement'] = val,
                      labelText: AppLocalizations.of(context)!.carDistanceMeasurementLabel,
                      hintText: AppLocalizations.of(context)!.carDistanceMeasurementHint,
                      items: [
                        DropdownMenuItem(
                          value: DistanceMeasurement.km,
                          child: Text(AppLocalizations.of(context)!.carDistanceMeasurementKm),
                        ),
                        DropdownMenuItem(
                          value: DistanceMeasurement.mi,
                          child: Text(AppLocalizations.of(context)!.carDistanceMeasurementMi),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: InputTextFormField(
                      labelText: AppLocalizations.of(context)!.carYearLabel,
                      hintText: AppLocalizations.of(context)!.carYearHint,
                      onChanged: (val) {},
                      onSaved: (val) => formData['year'] = val,
                    ),
                  ),
                  Expanded(
                    child: InputTextFormField(
                      labelText: AppLocalizations.of(context)!.carLastServiceDateLabel,
                      hintText: 'dd/mm/yyyy',
                      onChanged: (val) {},
                      onSaved: (val) => formData['lastServiceDate'] = val,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              InputTextFormField(
                labelText: AppLocalizations.of(context)!.carPlaqueLabel,
                hintText: AppLocalizations.of(context)!.carPlaqueHint,
                onChanged: (val) {},
                onSaved: (val) => formData['plaque'] = val,
              ),
              SizedBox(height: 16),
              InputTextFormField(
                labelText: AppLocalizations.of(context)!.carChassisNumberLabel,
                hintText: AppLocalizations.of(context)!.carChassisNumberHint,
                onChanged: (val) {},
                onSaved: (val) => formData['chassisNumber'] = val,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
