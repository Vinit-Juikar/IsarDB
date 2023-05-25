import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryNameController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
//we have to one list for the dropdown and another predefined value for the initial value of the drop down

  List<String> dropDownList = ['work', 'school', 'home'];
  List<String> dropDownListForDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  String predefinedValueForDropDownList = 'work';
  String predefinedValueForDropDownListOfDays = 'Monday';

  TimeOfDay _selectedTimeByUser = TimeOfDay.now();

  //funtions
  _selectedTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: _selectedTimeByUser,
        initialEntryMode: TimePickerEntryMode.dial);

    //now here we have to set the state of the time according to the timer set by the user

    if (timeOfDay != null && timeOfDay != TimeOfDay.now()) {
      _selectedTimeByUser = timeOfDay;
      setState(() {
        _timeController.text =
            "${_selectedTimeByUser.hour}:${_selectedTimeByUser.minute} ${_selectedTimeByUser.period.name}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: const Center(
          child: Text("Routine Manager"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Categories"),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height / 14,
                    child: DropdownButton(
                      elevation: 0,
                      dropdownColor: const Color(0xffffffff),
                      focusColor: const Color(0xffffffff),
                      isExpanded: true,
                      value: predefinedValueForDropDownList,
                      icon: const Icon(Icons.keyboard_double_arrow_down),
                      items: dropDownList
                          .map<DropdownMenuItem<String>>((String nValue) {
                        return DropdownMenuItem(
                          value: nValue,
                          child: Text(nValue),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            predefinedValueForDropDownList = newValue!;
                          },
                        );
                      },
                    ),
                  ),

                  //we have to make a pop up where the user can select the category and add the category of his type
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("New Category"),
                              actions: [
                                TextFormField(
                                  controller: _categoryNameController,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          //here while adding we have to make sure that the user has not entered anything for that we will use if condition 
                                          if(_categoryNameController.text.isNotEmpty){
                                            _addCategory();
                                          }
                                        },
                                        child: Text(
                                          "Add",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              Text("Title"),
              TextFormField(
                controller: _titleController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Start Time"),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        enabled: false,
                        controller: _timeController,
                      )),
                  IconButton(
                    onPressed: () {
                      _selectedTime(context);
                    },
                    icon: Icon(Icons.calendar_month),
                  ),
                ],
              ),

              //let's make the same for the day
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Day"),
              ),
              DropdownButton(
                isExpanded: true,
                value: predefinedValueForDropDownListOfDays,
                items: dropDownListForDays
                    .map<DropdownMenuItem<String>>((String nDay) {
                  return DropdownMenuItem(value: nDay, child: Text(nDay));
                }).toList(),
                onChanged: (String? newDay) {
                  setState(() {
                    predefinedValueForDropDownListOfDays = newDay!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _addCategory() {
}
