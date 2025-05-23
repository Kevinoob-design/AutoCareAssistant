import 'package:auto_care_assistant/shared/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart' show DateFormat;

class ProgramDate extends StatefulWidget {
  const ProgramDate({super.key});

  static String routeName = '/program-date';

  @override
  State<ProgramDate> createState() => _ProgramDateState();
}

class _ProgramDateState extends State<ProgramDate> {
  int? _selectedDay;
  String? _selectedHour;

  final List<List> _days = [];

  final List<String> _hours = <String>[
    // '00:00 AM',
    // '01:00 AM',
    // '01:30 AM',
    // '02:00 AM',
    // '02:30 AM',
    // '03:00 AM',
    // '03:30 AM',
    // '04:00 AM',
    // '04:30 AM',
    // '05:00 AM',
    // '05:30 AM',
    // '06:00 AM',
    // '06:30 AM',
    '07:00 AM',
    '07:30 AM',
    '08:00 AM',
    '08:30 AM',
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '01:00 PM',
    '01:30 PM',
    '02:00 PM',
    '02:30 PM',
    '03:00 PM',
    '03:30 PM',
    '04:00 PM',
    '04:30 PM',
    '05:00 PM',
    // '05:30 PM',
    // '06:00 PM',
    // '06:30 PM',
    // '07:00 PM',
    // '07:30 PM',
    // '08:00 PM',
    // '08:30 PM',
    // '09:00 PM',
    // '09:30 PM',
    // '10:00 PM',
    // '10:30 PM',
    // '11:00 PM',
    // '11:30 PM',
  ];

  @override
  void initState() {
    super.initState();

    for (
      DateTime indexDay = DateTime(DateTime.now().year, DateTime.now().month, 1);
      indexDay.month == DateTime.now().month;
      indexDay = indexDay.add(Duration(days: 1))
    ) {
      _days.add([indexDay.day, DateFormat.E().format(indexDay).toString()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(), backgroundColor: Colors.transparent, surfaceTintColor: Colors.transparent),
      floatingActionButton:
          (_selectedDay != null && _selectedHour != null)
              ? FloatingActionButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false),
                backgroundColor: kPrimaryColor,
                child: Icon(Icons.arrow_forward_ios),
              )
              : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              AppLocalizations.of(context)!.programDateTitle,
              style: TextStyle(fontSize: 35, color: kPrimaryColor, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(DateFormat.yMMMM().format(DateTime.now()), style: TextStyle(fontSize: 16)),
                ),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.5, color: kPrimaryColor),
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      childAspectRatio: 1 / 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: _days.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          setState(() {
                            _selectedDay = _days[index][0];
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                _selectedDay == _days[index][0]
                                    ? kPrimaryColor.withValues(alpha: 0.1)
                                    : Colors.transparent,
                            border: Border.all(
                              color:
                                  _selectedDay == _days[index][0] ? kPrimaryColor : kPrimaryColor.withValues(alpha: 0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _days[index][0].toString(),
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(_days[index][1], style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.5, color: kPrimaryColor),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _hours.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          setState(() {
                            _selectedHour = _hours[index];
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:
                                _selectedHour == _hours[index]
                                    ? kPrimaryColor.withValues(alpha: 0.1)
                                    : Colors.transparent,
                            border: Border.all(
                              color:
                                  _selectedHour == _hours[index] ? kPrimaryColor : kPrimaryColor.withValues(alpha: 0),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(_hours[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
