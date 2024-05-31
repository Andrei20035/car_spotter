import 'package:car_spotter/main.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({super.key});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String countryValue = "";

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.07),
          child: Text(
            "Country",
            style: theme.textTheme.titleLarge!.copyWith(
              fontSize: 13,
              color: const Color(0xFFDFA3A3),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.only(
        //     top: 2,
        //   ),
        //   width: double.infinity,
        //   height: screenHeight * 0.06,
        //   decoration: const BoxDecoration(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(300),
        //     ),
        //     color: Color(0xFFD9D9D9),
        //   ),
        // Padding(
        //     padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.00),
        CSCPicker(
          flagState: CountryFlag.ENABLE,
          dropdownDecoration: const BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.all(Radius.circular(300)),

          ),
          disabledDropdownDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              color: Colors.black,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              )),
          dropdownHeadingStyle: theme.textTheme.titleLarge!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          showCities: false,
          showStates: false,
          searchBarRadius: 20,
          defaultCountry: CscCountry.France,
          countryDropdownLabel: countryValue,
          onCountryChanged: (value) {
            setState(() {
              countryValue = value;
            });
          },
        ),
      ],
    );
  }
}
