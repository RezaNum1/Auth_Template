import 'package:flutter/material.dart';

class DropDownRW extends StatefulWidget {
  String rwText;
  Function(String) callBack;
  bool validate;

  DropDownRW(this.rwText, this.callBack, this.validate);
  @override
  _DropDownRWState createState() => _DropDownRWState();
}

class _DropDownRWState extends State<DropDownRW> {
  List<String> _rw = [
    'Pilih RW Anda',
    'RW 1',
    'RW 2',
    'RW 3',
    'RW 4',
    'RW 5',
    'RW 6',
    'RW 7',
    'RW 8'
  ];

  List<DropdownMenuItem<String>> _dropDownMenuItems;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    widget.rwText = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _rw) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      widget.callBack(selectedCity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[100],
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Anda Merupakan Ketua RW: "),
          new DropdownButton(
            isExpanded: true,
            value: widget.rwText,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
          ),
          (widget.validate == false
              ? Text("Anda Harus Memilih Salah Satu!",
                  style: TextStyle(color: Colors.red))
              : Container()),
        ],
      ),
    );
  }
}
