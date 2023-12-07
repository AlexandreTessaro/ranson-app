import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pancreatite App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PatientForm(),
    );
  }
}

class PatientForm extends StatefulWidget {
  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
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
        title: Text('Pancreatite Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            CheckboxListTile(
              title: Text('Litíase biliar'),
              value: hasGallstones,
              onChanged: (value) {
                setState(() {
                  hasGallstones = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: calculateScoreAndMortality,
              child: Text('Calcular'),
            ),
            if (score > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pontuação: $score'),
                  Text('Mortalidade: $mortality'),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void calculateScoreAndMortality() {
    int age = int.parse(ageController.text);
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
