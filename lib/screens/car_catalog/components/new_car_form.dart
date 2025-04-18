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
  final void Function()? previousPageCb;

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

  String? formInputTextValidator(String? val, BuildContext context) =>
      val!.isEmpty ? AppLocalizations.of(context)!.carsFormFieldRequiredMessage : null;
  String? formInputTextYearValidator(String? val, BuildContext context) {
    if (val!.isEmpty) return AppLocalizations.of(context)!.carsFormFieldRequiredMessage;
    if (val.length != 4) return AppLocalizations.of(context)!.carsFormYearMustBeMessage;
    if (int.parse(val) > DateTime.now().year) return AppLocalizations.of(context)!.carsFormDateCannotBeMessage;
    return null;
  }

  String? formDropDownValidator(DistanceMeasurement? val, BuildContext context) =>
      val == null ? AppLocalizations.of(context)!.carsFormFieldRequiredMessage : null;

  @override
  Widget build(BuildContext context) {
    if (widget.formData['lastServiceDate'] != null) {
      dateTextEditingController.value = TextEditingValue(text: widget.formData['lastServiceDate']);
    }

    return Column(
      children: [
        widget.previousPageCb == null
            ? const SizedBox()
            : ListTile(
              leading: GestureDetector(onTap: widget.previousPageCb, child: Icon(Icons.arrow_back_ios)),
              title: Subtitle(text: AppLocalizations.of(context)!.fillDetailsTitle),
            ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Form(
              key: widget.formKey,
              child: Column(
                children: [
                  InputTextFormField(
                    initialValue: widget.formData['title'],
                    validator: (String? val) => formInputTextValidator(val, context),
                    labelText: AppLocalizations.of(context)!.carTitleLabel,
                    hintText: AppLocalizations.of(context)!.carTitleHint,
                    onChanged: (val) => widget.formData['title'] = val,
                    onSaved: (val) => widget.formData['title'] = val,
                  ),
                  SizedBox(height: 16),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: InputTextFormField(
                          initialValue: widget.formData['make'],
                          validator: (String? val) => formInputTextValidator(val, context),
                          labelText: AppLocalizations.of(context)!.carMakeLabel,
                          hintText: AppLocalizations.of(context)!.carMakeHint,
                          onChanged: (val) => widget.formData['make'] = val,
                          onSaved: (val) => widget.formData['make'] = val,
                        ),
                      ),
                      Expanded(
                        child: InputTextFormField(
                          initialValue: widget.formData['model'],
                          validator: (String? val) => formInputTextValidator(val, context),
                          labelText: AppLocalizations.of(context)!.carModelLabel,
                          hintText: AppLocalizations.of(context)!.carModelHint,
                          onChanged: (val) => widget.formData['model'] = val,
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
                          initialValue: widget.formData['distanceTraveled'],
                          validator: (String? val) => formInputTextValidator(val, context),
                          inputType: TextInputType.number,
                          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                          labelText: AppLocalizations.of(context)!.carDistanceTraveledLabel,
                          hintText: AppLocalizations.of(context)!.carDistanceTraveledHint,
                          onChanged: (val) => widget.formData['distanceTraveled'] = val,
                          onSaved: (val) => widget.formData['distanceTraveled'] = val,
                        ),
                      ),
                      Expanded(
                        child: InputDropDownBottomFormField<DistanceMeasurement>(
                          initialValue: widget.formData['distanceMeasurement'],
                          validator: (DistanceMeasurement? val) => formDropDownValidator(val, context),
                          onChanged: (val) => widget.formData['distanceMeasurement'] = val,
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
                          initialValue: widget.formData['year'],
                          validator: (String? val) => formInputTextYearValidator(val, context),
                          inputType: TextInputType.number,
                          inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                          labelText: AppLocalizations.of(context)!.carYearLabel,
                          hintText: AppLocalizations.of(context)!.carYearHint,
                          onChanged: (val) => widget.formData['year'] = val,
                          onSaved: (val) => widget.formData['year'] = val,
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => selectDate(context),
                          child: AbsorbPointer(
                            child: InputTextFormField(
                              validator: (String? val) => formInputTextValidator(val, context),
                              controller: dateTextEditingController,
                              labelText: AppLocalizations.of(context)!.carLastServiceDateLabel,
                              inputType: TextInputType.datetime,
                              hintText: 'yyyy-mm-dd',
                              onChanged: (val) => widget.formData['lastServiceDate'] = val,
                              onSaved: (val) => widget.formData['lastServiceDate'] = val,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  InputTextFormField(
                    initialValue: widget.formData['plaque'],
                    validator: (String? val) => formInputTextValidator(val, context),
                    labelText: AppLocalizations.of(context)!.carPlaqueLabel,
                    hintText: AppLocalizations.of(context)!.carPlaqueHint,
                    onChanged: (val) => widget.formData['plaque'] = val,
                    onSaved: (val) => widget.formData['plaque'] = val,
                  ),
                  SizedBox(height: 16),
                  InputTextFormField(
                    initialValue: widget.formData['chassisNumber'],
                    validator: (String? val) => formInputTextValidator(val, context),
                    labelText: AppLocalizations.of(context)!.carChassisNumberLabel,
                    hintText: AppLocalizations.of(context)!.carChassisNumberHint,
                    onChanged: (val) => widget.formData['chassisNumber'] = val,
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
