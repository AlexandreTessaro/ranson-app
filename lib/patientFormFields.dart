import 'package:flutter/material.dart';

class PatientFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController leukocytesController;
  final TextEditingController glucoseController;
  final TextEditingController astController;
  final TextEditingController ldhController;
  final bool hasGallstones;
  final void Function(bool?) toggleGallstones;

  PatientFormFields({
    required this.nameController,
    required this.ageController,
    required this.leukocytesController,
    required this.glucoseController,
    required this.astController,
    required this.ldhController,
    required this.hasGallstones,
    required void Function(bool?) toggleGallstones,
  }) : toggleGallstones = toggleGallstones ?? ((bool? value) {});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Nome'),
        ),
        TextField(
          controller: ageController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Idade'),
        ),
        CheckboxListTile(
          title: Text('Litíase biliar'),
          value: hasGallstones,
          onChanged: toggleGallstones,
        ),
        TextField(
          controller: leukocytesController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Leucócitos'),
        ),
        TextField(
          controller: glucoseController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Glicemia'),
        ),
        TextField(
          controller: astController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'AST/TGO'),
        ),
        TextField(
          controller: ldhController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'LDH'),
        ),
      ],
    );
  }
}
