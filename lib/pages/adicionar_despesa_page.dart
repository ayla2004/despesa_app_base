import 'package:despesas_app/model/entities/despesa.dart';
import 'package:flutter/material.dart';

class AdicionarDespesaPage extends StatelessWidget {
  const AdicionarDespesaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar nova despesa"),
      ),
      body: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Título"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Descrição"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Valor R\$"),
                ),
                InputDatePickerFormField(
                  fieldLabelText: "Data",
                  firstDate: DateTime(2023),
                  lastDate: DateTime.now(),
                  initialDate: DateTime.now(),
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: "Tipo"),
                  items: TipoDespesa.values.map((tipo) {
                    return DropdownMenuItem(
                      child: Text(tipo.texto),
                      value: tipo,
                    );
                  }).toList(),
                  onChanged: (item) {},
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Cadastrar"),
          ),
        ],
      ),
    );
  }
}
