import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DropDownPage extends StatelessWidget {
  // const DropDownPage({super.key});

  List<Map<String, dynamic>> dataList = [
    {
      "country": "Brazil",
      "id": 1,
    },
    {
      "country": "Tunisia",
      "id": 2,
    },
    {
      "country": "Canada",
      "id": 3,
    },
    {
      "country": "India",
      "id": 4,
    },
    {
      "country": "Indonesia",
      "id": 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Center(
          child: Text(
            "Drop Down",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: DropdownSearch<Map<String, dynamic>>(
          mode: Mode.form,
          items: (f, cs) => dataList,
          selectedItem: {
            "country": "Canada",
            "id": 3,
          },
          dropdownBuilder: (context, selectedItem) =>
              Text(selectedItem?["country"].toString() ?? "Belum pilih data"),
          compareFn: (item, selectedItem) => item?["id"] == selectedItem?["id"],
          onChanged: (value) => print(value?["id"] ?? null),
          popupProps: PopupProps.menu(
            // disabledItemFn: (item) => item.startsWith("i"),
            fit: FlexFit.loose,
            showSearchBox: true,
            showSelectedItems: true,
            itemBuilder: (context, item, isDisabled, isSelected) => ListTile(
              textColor: Colors.red,
              title: Text(item["country"].toString()),
            ),
          ),
        ),
      ),
    );
  }
}
