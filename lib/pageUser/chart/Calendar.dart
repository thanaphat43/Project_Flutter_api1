import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';

class MyFormField extends StatefulWidget {
  @override
  _MyFormFieldState createState() => _MyFormFieldState();
}

GlobalKey<FormState> myFormKey = new GlobalKey();

class _MyFormFieldState extends State<MyFormField> {
  DateTimeRange myDateRange;

  void _submitForm() {
    final FormState form = myFormKey.currentState;
    form.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Range Form Example"),
      ),
      body: SafeArea(
        child: Form(
          key: myFormKey,
          child: Column(
            children: [
              SafeArea(
                child: DateRangeField(
                    enabled: true,
                    initialValue: DateTimeRange(
                        start: DateTime.now(),
                        end: DateTime.now().add(Duration(days: 5))),
                    decoration: InputDecoration(
                      labelText: 'Date Range',
                      prefixIcon: Icon(Icons.date_range),
                      hintText: 'Please select a start and end date',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value.start.isBefore(DateTime.now())) {
                        return 'Please enter a later start date';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        myDateRange = value;
                      });
                    }),
              ),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: _submitForm,
              ),
              if (myDateRange != null)
                Text("Saved value is: ${myDateRange.toString()}")
            ],
          ),
        ),
      ),
    );
  }
}
