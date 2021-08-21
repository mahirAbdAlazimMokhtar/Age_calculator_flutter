import 'package:age_calculator/Models/age_model.dart';
import 'package:age_calculator/Models/duration_model.dart';
import 'package:age/age.dart' as ag;


class AgeCalcluator {

  Age calcluatorAge (DateTime birthday , DateTime today) {
    //this method to calculate your age
    ag.AgeDuration age;

    // Find out your age
    age = ag.Age.dateDifference(
        fromDate: birthday, toDate: today, includeToDate: false);

    print('Your age is $age'); // Your age is Years: 30, Months: 0, Days: 4

    Age userAge = Age();
    userAge.years = age.years;
    userAge.months = age.months;
    userAge.days = age.days;
    return userAge;
  }

//   Duration calculatorNextBirthdayDuration (DateTime birthday , DateTime today){
//     //this method to calculate next birthday
//

}