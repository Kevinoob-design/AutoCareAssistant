import 'package:auto_care_assistant/shared/config/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Service {
  final String name;
  final String imageURL;

  Service(this.name, this.imageURL);
}

class ProgramService extends StatefulWidget {
  const ProgramService({super.key});

  static String routeName = '/program-service';

  @override
  State<ProgramService> createState() => _ProgramServiceState();
}

class _ProgramServiceState extends State<ProgramService> {
  List<Service> services = [
    Service('Tyres & Wheel', 'assets/images/Tyres & Wheel Care.png'),
    Service('Periodic Service', 'assets/images/Periodic Service.png'),
    Service('Car Detailing', 'assets/images/Detailing Service.png'),
    Service('Car Wash & Cleaning', 'assets/images/Car Spa & Cleaning.png'),
    Service('Insurance Help', 'assets/images/Insurance Claims.png'),
    Service('Suspension', 'assets/images/Suspension & Fitments.png'),
    Service('Clutch & Bodywork', 'assets/images/Clutch & Body Parts.png'),
    Service('Glass & Lights', 'assets/images/Windshields & Lights.png'),
    Service('Body Repair & Paint', 'assets/images/Denting & Painting.png'),
  ];

  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton()),
      floatingActionButton:
          selectedService >= 0
              ? FloatingActionButton(
                onPressed:
                    () => Navigator.pushNamed(context, '/program-date', arguments: services[selectedService].name),
                backgroundColor: kPrimaryColor,
                child: Icon(Icons.arrow_forward_ios, size: 20),
              )
              : null,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  AppLocalizations.of(context)!.programServiceTitle,
                  style: TextStyle(fontSize: 40, color: kPrimaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                    return serviceContainer(services[index].imageURL, services[index].name, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index) {
            selectedService = -1;
          } else {
            selectedService = index;
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: selectedService == index ? kPrimaryColor.withValues(alpha: 0.1) : Colors.transparent,
          border: Border.all(
            color: selectedService == index ? kPrimaryColor : kPrimaryColor.withValues(alpha: 0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image, height: 80),
            SizedBox(height: 20),
            Text(name, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
