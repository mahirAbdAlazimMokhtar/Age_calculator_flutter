import 'package:age_calculator/Models/age_model.dart';
import 'package:age_calculator/Models/duration_model.dart';
import 'package:age_calculator/date_utilties.dart';
import 'package:age_calculator/logic/calcluator_age.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Age _userAge = Age();

  Duration _nextBirthDay = Duration();

  late DateTime futureDate;

  late DateTime birthday;

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
    Widget _buildClearCalculateButtonsRow = _buildClearCalculatorButtonsRow();
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

  Widget _buildHeading(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

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
                  if (date == null){
                    _dateOfBirthController.text = '';
                  } else{
                   setState(() {
                     _dateOfBirthController.text =DateHelper.formatDate(date);
                   });
                  }
              birthday = date!;
            });
          },
        ),
      ],
    );
  }

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
                if (date ==null){
                  _todayDateController.text= '';
                } else {
                  setState(() {
                    _todayDateController.text = DateHelper.formatDate(date);
                  });
                }
              futureDate = date!;
              //code to handle date
            });
          },
        ),
      ],
    );
  }

  Widget _buildCalculateButton() {
    return ButtonTheme(
      minWidth: 160,
      height: 60,
      child: RaisedButton(
        onPressed: () {

         setState(() {
           _userAge = AgeCalcluator().calcluatorAge(birthday, futureDate);
           _nextBirthDay = AgeCalcluator().calculatorNextBirthdayDuration(futureDate,birthday );
         });

        },
        color: Theme.of(context).primaryColor,
        child: Text(
          'CALCULATE',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildClearButton() {
    return ButtonTheme(
      minWidth: 160,
      height: 60,
      child: RaisedButton(
        onPressed: () {
          setState(() {
            //TODO:
          });
        },
        color: Theme.of(context).primaryColor,
        child: Text(
          'CLEAR',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildClearCalculatorButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildClearButton(),
        _buildCalculateButton(),
      ],
    );
  }

  Widget _buildOutputField(String outputTitle, String outputDate) {
    const double width = 110;
    const double height = 30;
    return Card(
      shadowColor: Colors.greenAccent,
      elevation: 5.0,
      child: Column(
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
                style: TextStyle(color: Colors.black87,
                fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildAgeOutputRow(){
  Widget _buildYearsField = _buildOutputField("Years",_userAge.years.toString());
  Widget _buildMonthsField = _buildOutputField("Months",_userAge.months.toString());
  Widget _buildDaysField = _buildOutputField("Days",_userAge.days.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildYearsField,
        _buildMonthsField,
        _buildDaysField ,
      ],
    );
}

  Widget _buildNextBirthDayOutputRow(){
    Widget _buildYearsField = _buildOutputField("Years",'_');
    Widget _buildMonthsField = _buildOutputField("Months",_nextBirthDay.months.toString());
    Widget _buildDaysField = _buildOutputField("Days",_nextBirthDay.days.toString());
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
