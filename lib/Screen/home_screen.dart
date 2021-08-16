import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  late BuildContext context;
  final TextEditingController _dateOfBirthController =
      TextEditingController(text: '01-01-1990');
  final TextEditingController _todayDateController =
      TextEditingController(text: '15-08-2012');
  @override
  Widget build(BuildContext context) {
    this.context = context;
    //in this place we create a widget to passing in the column
    Widget _dateOfBirthHeading = _buildHeading('Date of Birth');
    Widget _birthDateTextField = _buildBirthDateTextField();
    Widget _spaceBetweenElement = _spaceBetweenElements(20);
    Widget _todayDateHeading = _buildHeading("Today's Day");
    Widget _todayDateTexeField = _buildTodayDateTextField();


    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          _dateOfBirthHeading,
          _buildBirthDateTextField(),
          _spaceBetweenElement,
          _todayDateHeading,
          _todayDateTexeField,
          _spaceBetweenElement,
        ],
      ),
    );
  }

  //this widget for build header in the screen
  Widget _buildHeading(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey,
        ),
      ),
    );
  }

//this widget for build textField for today
  Widget _buildBirthDateTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: _dateOfBirthController,
          showCursor: true,
          readOnly: true,
          decoration: _getTextFieldWithCalenderIconDecoration(),
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1980),
                    lastDate: DateTime.now())
                .then((date) {
              //code to handle date
            });
          },
        ),
      ],
    );
  }
  //this widget for decoration the textField
  InputDecoration _getTextFieldWithCalenderIconDecoration() {
    return InputDecoration(
      //this attr to run fillColor
      // filled: true,
      //this attr to put color in filled
      //   fillColor: Colors.lightBlue.shade50,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      suffixIcon: Icon(
        Icons.date_range,
        color: Theme.of(context).primaryColor,
      ),
      hintText: '2002-04-20'
    );
  }

  //this widget for add space between an elements in screen
Widget _spaceBetweenElements(double size){
    return SizedBox(
      height: size,
    );
}

  Widget _buildTodayDateTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: _todayDateController,
          showCursor: true,
          readOnly: true,
          decoration: _getTextFieldWithCalenderIconDecoration(),
          onTap: () {
            showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1980),
                lastDate: DateTime.now())
                .then((date) {
              //code to handle date
            });
          },
        ),
      ],
    );
  }
}
