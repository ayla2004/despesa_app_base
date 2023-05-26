import 'package:despesas_app/controller/adiciona_despesa_controller.dart';
import 'package:despesas_app/model/entities/despesa.dart';
import 'package:flutter/material.dart';

class AdicionarDespesaPage extends StatelessWidget {
  AdicionarDespesaPage({super.key});

  final _controller = AdicionaDespesaController();
  final _formKey = GlobalKey<FormState>();

  _cadastrar() {
    //verificar se os dados do form estão válidos
    //se estiver válidos, chamar o cadastrar no controle
    if (_formKey.currentState!.validate()) {
      _controller.cadastrar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar nova despesa"),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: _controller.validarTitulo,
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(labelText: "Título"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Descrição"),
                ),
                TextFormField(
                  validator: _controller.validarValor,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
            onPressed: () {
              _cadastrar();
            },
            child: Text("Cadastrar"),
          ),
        ],
      ),
    );
  }
}
