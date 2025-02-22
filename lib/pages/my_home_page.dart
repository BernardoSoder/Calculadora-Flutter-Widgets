import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/containerResult_widget.dart';
import 'package:flutter_application_1/widgets/input_widget.dart';
import 'package:flutter_application_1/widgets/rowOperators_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var valor1InputController = TextEditingController();
  var valor2InputController = TextEditingController();
  String operacao = "+";
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputWidget(
              title: "Valor1", 
              controller: valor1InputController),
            InputWidget(
              title: "Valor2", 
              controller: valor2InputController),
            RowOperatorsWidget(atualizarOperador: atualizarOperador),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: calcular,
              child: Text('Calcular'),
            ),
            SizedBox(height: 64),
            ContainerResultWidget(resultado: resultado),     
          ],
        ),
      ),
    );
  }

  void calcular() {
    double valor1 = double.tryParse(valor1InputController.text) ?? 0;
    double valor2 = double.tryParse(valor2InputController.text) ?? 0;

    setState(() {
      switch (operacao) {
        case "+":
          resultado = valor1 + valor2;
          break;
        case "-":
          resultado = valor1 - valor2;
          break;
        case "*":
          resultado = valor1 * valor2;
          break;
        case "/":
          resultado = valor2 != 0 ? valor1 / valor2 : 0;
          break;
        default:
          resultado = 0;
      }
    });
  }

  void atualizarOperador(operador){
    setState(() {
      operacao = operador;
    });
  }
}