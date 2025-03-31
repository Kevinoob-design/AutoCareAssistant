import 'package:auto_care_assistant/screens/car_catalog/models/car.dart';
import 'package:auto_care_assistant/shared/components/headings/subtitle.dart' show Subtitle;
import 'package:auto_care_assistant/shared/components/inputs/drop_down_bottom.dart' show InputDropDownBottomFormField;
import 'package:auto_care_assistant/shared/components/inputs/input_text.dart' show InputTextFormField;
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NewCarForm extends StatefulWidget {
  const NewCarForm({super.key, required this.formKey, required this.formData, required this.previousPageCb});

  final GlobalKey<FormState> formKey;
  final Map<String, dynamic> formData;
  final void Function() previousPageCb;

  @override
  State<NewCarForm> createState() => _NewCarFormState();
}

class _NewCarFormState extends State<NewCarForm> {
  DateTime selectedDate = DateTime.now();
  TextEditingController dateTextEditingController = TextEditingController();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1901, 1),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateTextEditingController.value = TextEditingValue(text: picked.toLocal().toString().split(' ')[0]);
      });
    }
  }

  String? formInputTextValidator(String? val) => val!.isEmpty ? 'Field is required' : null;
  String? formInputTextYearValidator(String? val) {
    if (val!.isEmpty) return 'Field is required';
    if (val.length != 4) return 'Year must be 4 digits';
    if (int.parse(val) > DateTime.now().year) return 'Cannot be in the future';
    return null;
  }

  String? formDropDownValidator(DistanceMeasurement? val) => val == null ? 'Field is required' : null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: GestureDetector(onTap: widget.previousPageCb, child: Icon(Icons.arrow_back_ios)),
          title: Subtitle(text: 'Fill in vehicle details'),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Form(
              key: widget.formKey,
              child: Column(
                children: [
                  InputTextFormField(
                    validator: formInputTextValidator,
                    labelText: AppLocalizations.of(context)!.carTitleLabel,
                    hintText: AppLocalizations.of(context)!.carTitleHint,
                    onChanged: (val) {},
                    onSaved: (val) => widget.formData['title'] = val,
                  ),
                  SizedBox(height: 16),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: InputTextFormField(
                          validator: formInputTextValidator,
                          labelText: AppLocalizations.of(context)!.carMakeLabel,
                          hintText: AppLocalizations.of(context)!.carMakeHint,
                          onChanged: (val) {},
                          onSaved: (val) => widget.formData['make'] = val,
                        ),
                      ),
                      Expanded(
                        child: InputTextFormField(
                          validator: formInputTextValidator,
                          labelText: AppLocalizations.of(context)!.carModelLabel,
                          hintText: AppLocalizations.of(context)!.carModelHint,
                          onChanged: (val) {},
                          onSaved: (val) => widget.formData['model'] = val,
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
                          validator: formInputTextValidator,
                          inputType: TextInputType.number,
                          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                          labelText: AppLocalizations.of(context)!.carDistanceTraveledLabel,
                          hintText: AppLocalizations.of(context)!.carDistanceTraveledHint,
                          onChanged: (val) {},
                          onSaved: (val) => widget.formData['distanceTraveled'] = val,
                        ),
                      ),
                      Expanded(
                        child: InputDropDownBottomFormField<DistanceMeasurement>(
                          validator: formDropDownValidator,
                          onChanged: (val) {},
                          onSaved: (val) => widget.formData['distanceMeasurement'] = val,
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
                          validator: formInputTextYearValidator,
                          inputType: TextInputType.number,
                          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                          labelText: AppLocalizations.of(context)!.carYearLabel,
                          hintText: AppLocalizations.of(context)!.carYearHint,
                          onChanged: (val) {},
                          onSaved: (val) => widget.formData['year'] = val,
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => selectDate(context),
                          child: AbsorbPointer(
                            child: InputTextFormField(
                              validator: formInputTextValidator,
                              controller: dateTextEditingController,
                              labelText: AppLocalizations.of(context)!.carLastServiceDateLabel,
                              inputType: TextInputType.datetime,
                              hintText: 'yyyy-mm-dd',
                              onChanged: (val) {},
                              onSaved: (val) => widget.formData['lastServiceDate'] = val,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  InputTextFormField(
                    validator: formInputTextValidator,
                    labelText: AppLocalizations.of(context)!.carPlaqueLabel,
                    hintText: AppLocalizations.of(context)!.carPlaqueHint,
                    onChanged: (val) {},
                    onSaved: (val) => widget.formData['plaque'] = val,
                  ),
                  SizedBox(height: 16),
                  InputTextFormField(
                    validator: formInputTextValidator,
                    labelText: AppLocalizations.of(context)!.carChassisNumberLabel,
                    hintText: AppLocalizations.of(context)!.carChassisNumberHint,
                    onChanged: (val) {},
                    onSaved: (val) => widget.formData['chassisNumber'] = val,
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
