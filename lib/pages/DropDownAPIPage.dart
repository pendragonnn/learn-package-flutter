import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:package_flutter/models/CityModel.dart';
import 'package:package_flutter/models/ProvinceModel.dart';

class DropDownAPIPage extends StatelessWidget {
  // const DropDownAPIPage({super.key});

  final String apiKey = dotenv.env['API_KEY'].toString();

  String? idProv = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Center(
          child: Text(
            "Drop Down With API",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<Province>(
            mode: Mode.form,
            items: (f, cs) async {
              // get data
              var response = await http.get(
                Uri.parse(
                    "https://api.binderbyte.com/wilayah/provinsi?api_key=${apiKey}"),
              );
              print(response);
              if (response.statusCode != 200) {
                return [];
              }
              List allProvince =
                  (json.decode(response.body) as Map<String, dynamic>)["value"];
              List<Province> allModelProvince = [];
              allProvince.forEach((element) {
                allModelProvince.add(
                  Province(
                    id: element["id"],
                    name: element["name"],
                  ),
                );
              });
              return allModelProvince;
            },
            compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
            popupProps: PopupProps.menu(
              // disabledItemFn: (item) => item.startsWith("i"),
              fit: FlexFit.loose,
              showSearchBox: true,
              showSelectedItems: true,
              itemBuilder: (context, item, isDisabled, isSelected) => ListTile(
                textColor: Colors.amber,
                title: Text(item.name),
              ),
            ),
            dropdownBuilder: (context, selectedItem) => ListTile(
              title: Text(selectedItem?.name ?? "Pilih kota anda"),
            ),
            onChanged: (value) => idProv = value?.id,
          ),
          SizedBox(
            height: 20,
          ),
          DropdownSearch<City>(
            mode: Mode.form,
            items: (f, cs) async {
              // get data
              var response = await http.get(
                Uri.parse(
                    "https://api.binderbyte.com/wilayah/kabupaten?api_key=${apiKey}&id_provinsi=${idProv}"),
              );
              print(response);
              if (response.statusCode != 200) {
                return [];
              }
              List allCity =
                  (json.decode(response.body) as Map<String, dynamic>)["value"];
              List<City> allModelCity = [];
              allCity.forEach((element) {
                allModelCity.add(
                  City(
                    id: element["id"],
                    idProvinsi: element["id_provinsi"],
                    name: element["name"],
                  ),
                );
              });
              return allModelCity;
            },
            compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
            popupProps: PopupProps.menu(
              // disabledItemFn: (item) => item.startsWith("i"),
              fit: FlexFit.loose,
              showSearchBox: true,
              showSelectedItems: true,
              itemBuilder: (context, item, isDisabled, isSelected) => ListTile(
                textColor: Colors.amber,
                title: Text(item.name),
              ),
            ),
            dropdownBuilder: (context, selectedItem) => ListTile(
              title: Text(selectedItem?.name ?? "Pilih kota anda"),
            ),
            onChanged: (value) => print(value?.toJson()),
          ),
        ],
      ),
    );
  }
}
