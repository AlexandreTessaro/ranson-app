import 'package:flutter/material.dart';
import 'patientFormFields.dart';
import 'patientScoreAndMortality.dart';

class PatientFormData extends StatefulWidget {
  @override
  _PatientFormDataState createState() => _PatientFormDataState();
}

class _PatientFormDataState extends State<PatientFormData> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController leukocytesController = TextEditingController();
  final TextEditingController glucoseController = TextEditingController();
  final TextEditingController astController = TextEditingController();
  final TextEditingController ldhController = TextEditingController();
  bool hasGallstones = false;
  int score = 0;
  String mortality = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Paciente'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PatientFormFields(
              nameController: nameController,
              ageController: ageController,
              hasGallstones: hasGallstones,
              leukocytesController: leukocytesController,
              glucoseController: glucoseController,
              astController: astController,
              ldhController: ldhController,
              toggleGallstones: toggleGallstones,
            ),
            SizedBox(height: 20),
            Center(  // Ou use 'Align' com 'alignment: Alignment.center' se preferir.
              child: ElevatedButton(
                onPressed: calculateScoreAndMortality,
                child: Text('Adicionar Paciente'),
              ),
            ),
            if (score > 0)
              PatientScoreAndMortality(score: score, mortality: mortality),
          ],
        ),
      ),
    );
  }

  void toggleGallstones(bool? value) {
    setState(() {
      hasGallstones = value ?? false;
    });
  }

  void calculateScoreAndMortality() {
    int leukocytes = int.parse(leukocytesController.text);
    double glucose = double.parse(glucoseController.text);
    int ast = int.parse(astController.text);
    int ldh = int.parse(ldhController.text);

    int ageThreshold = hasGallstones ? 70 : 55;
    int leukocytesThreshold = hasGallstones ? 18000 : 16000;
    double glucoseThreshold = hasGallstones ? 12.2 : 11.0;
    int astThreshold = 250;
    int ldhThreshold = hasGallstones ? 400 : 350;

    int currentScore = 0;

    int age = int.parse(ageController.text);

    if (age > ageThreshold) currentScore++;
    if (leukocytes > leukocytesThreshold) currentScore++;
    if (glucose > glucoseThreshold) currentScore++;
    if (ast > astThreshold) currentScore++;
    if (ldh > ldhThreshold) currentScore++;

    setState(() {
      score = currentScore;
      mortality = calculateMortality();
    });
  }

  String calculateMortality() {
    if (score >= 7) {
      return '100%';
    } else if (score >= 5) {
      return '40%';
    } else if (score >= 3) {
      return '15%';
    } else {
      return '2%';
    }
  }
}
