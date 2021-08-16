import 'package:age_calculator/Models/age_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Age _userAge = Age();
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
    Widget _todayDateTextField = _buildTodayDateTextField();
    Widget _buildClearCalculateButtonsRow = _buildClearCalaButtonsRow();
    Widget _ageOutputHeading = _buildHeading('Age is');
    Widget _buildAgeOutputRows = _buildAgeOutputRow();
    Widget _buildNextBirthDayHeading = _buildHeading('Next Birth Day in');
    Widget _nextBirthOutputRow = _buildNextBirthDayOutputRow();

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          _dateOfBirthHeading,
          _birthDateTextField,
          _spaceBetweenElement,
          _todayDateHeading,
          _todayDateTextField,
          _spaceBetweenElement,
          _buildClearCalculateButtonsRow,
          _spaceBetweenElement,
          _ageOutputHeading,
          _buildAgeOutputRows,
          _spaceBetweenElement,
          _buildNextBirthDayHeading,
          _nextBirthOutputRow,
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
        hintText: '2002-04-20');
  }

  //this widget for add space between an elements in screen
  Widget _spaceBetweenElements(double size) {
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

  //this widget for build button for calculate
  Widget _buildCalculateButton() {
    return ButtonTheme(
      minWidth: 160,
      height: 60,
      child: RaisedButton(
        onPressed: () {},
        color: Theme.of(context).primaryColor,
        child: Text(
          'CALCULATE',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  //this widget for build clear button
  Widget _buildClearButton() {
    return ButtonTheme(
      minWidth: 160,
      height: 60,
      child: RaisedButton(
        onPressed: () {},
        color: Theme.of(context).primaryColor,
        child: Text(
          'CLEAR',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  //this widget for handle two buttons in row
  Widget _buildClearCalaButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildClearButton(),
        _buildCalculateButton(),
      ],
    );
  }

//this widget for build outPut filed
  Widget _buildOutputField(String outputTitle, String outputDate) {
    const double width = 115;
    const double height = 30;
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          height: height,
          width: width,
          child: Center(
            child: Text(
              outputTitle,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              border: Border.all(
            color: Theme.of(context).primaryColor,
          )),
          child: Center(
            child: Text(
              outputDate,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
  //this widget for custom row in Age is
Widget _buildAgeOutputRow(){
  Widget _buildYearsField = _buildOutputField("Years",_userAge.years.toString());
  Widget _buildMonthsField = _buildOutputField("Months",_userAge.months.toString());
  Widget _buildDaysField = _buildOutputField("Days",_userAge.day.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildYearsField,
        _buildMonthsField,
        _buildDaysField ,
      ],
    );
}
//this widget for build next birth day
  Widget _buildNextBirthDayOutputRow(){
    Widget _buildYearsField = _buildOutputField("Years",_userAge.years.toString());
    Widget _buildMonthsField = _buildOutputField("Months",_userAge.months.toString());
    Widget _buildDaysField = _buildOutputField("Days",_userAge.day.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildYearsField,
        _buildMonthsField,
        _buildDaysField ,
      ],
    );
  }
}
