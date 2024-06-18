import 'package:car_spotter/main.dart';
import 'package:flutter/material.dart';

class CarDropdownButton extends StatefulWidget {
  const CarDropdownButton(
      {super.key, required this.height, required this.hint});

  final double height;
  final String hint;

  @override
  State<CarDropdownButton> createState() {
    return _CarDropdownButtonState();
  }
}

class _CarDropdownButtonState extends State<CarDropdownButton> {
  String? selectedCarModel;
  final List<String> carModels = ["Audi", "BMW", "Chevrolet"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height,
      decoration: const BoxDecoration(
        color: Colors.white,  
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          icon: Image.asset(
            "assets/images/icons/arrow-square-down.png",
            scale: 2.5,
          ),
          value: selectedCarModel,
          hint: Text(
            widget.hint,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: const Color(0xFF4E4E4E),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedCarModel = newValue!;
            });
          },
          padding: const EdgeInsets.only(left: 25, right: 18),
          items: carModels.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: const Color(0xFF4E4E4E),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
