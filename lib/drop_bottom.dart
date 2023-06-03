import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);
  static const String routename ='drop down menu';

  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,

                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights() {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(4);
      }
    }
    return _itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(padding: const EdgeInsets.symmetric(horizontal: 100),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(30),
                  borderSide:   const BorderSide(style:BorderStyle.none,width: 0 ,)),
              filled: true,
              fillColor: Colors.white,


            ),





            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 20,

                color: Theme.of(context).hintColor,
              ),
            ),
            items: _addDividersAfterItems(items),

            value: selectedValue,
            icon: const Icon(Icons.arrow_drop_down_circle,
                color: Color.fromRGBO(220, 205, 168, 1)),


            onChanged: (value) {
              setState(() {
                selectedValue = value as String;

              });

            },
          ),
        ),
      ),
    );

  }
}