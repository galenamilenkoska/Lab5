import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:finki/model/list_item.dart';

class NovElement extends StatefulWidget {
  final Function addItem;

  NovElement(this.addItem);

  @override
  State<StatefulWidget> createState() => _NovElementState();
}

class _NovElementState extends State<NovElement> {
  final _naslovController = TextEditingController();
  DateTime selectedDate; // Зачувување на датумот
  TimeOfDay selectedTime; // Зачувување на времето

  void _submitData() {
    if (_naslovController.text.isEmpty ||
        selectedDate == null ||
        selectedTime == null) {
      return;
    }
    final vnesenNaslov = _naslovController.text;

    final newItem = ListItem(
      id: nanoid(5),
      naslov: vnesenNaslov,
      datum: selectedDate,
      vreme: selectedTime,
    );
    widget.addItem(context, newItem);
    Navigator.of(context).pop();
  }

  Future<void> _selectTime() async {
    final TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _naslovController,
            decoration: InputDecoration(labelText: "Ime na predmet"),
            onSubmitted: (_) => _submitData(),
          ),
          ListTile(
            title: Text(
              selectedDate == null
                  ? 'Izberi datum'
                  : 'Izbran datum: ${selectedDate.toString().substring(0, 10)}',
            ),
            trailing: Icon(Icons.calendar_today),
            onTap: () async {
              final DateTime pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2021),
                lastDate: DateTime(2101),
              );

              if (pickedDate != null && pickedDate != selectedDate) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
          ),
          ListTile(
            title: Text(
              selectedTime == null
                  ? 'Izberi vreme'
                  : 'Izbrano vreme: ${selectedTime.format(context)}',
            ),
            trailing: Icon(Icons.access_time),
            onTap: () => _selectTime(),
          ),
          TextButton(
            child: Text("Dodaj"),
            onPressed: _submitData,
          ),
        ],
      ),
    );
  }
}
