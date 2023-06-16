import 'package:despesas_app/controller/adiciona_despesa_controller.dart';
import 'package:despesas_app/model/entities/despesa.dart';
import 'package:flutter/material.dart';

class AdicionarDespesaPage extends StatelessWidget {
  AdicionarDespesaPage({super.key});

  final _controller = AdicionaDespesaController();
  final _formKey = GlobalKey<FormState>();

  _cadastrar(BuildContext context) {
    //verificar se os dados do form estao validos
    //se estiver validos, chamar o cadastrar no controller
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _controller.cadastrar();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar despesa")),
      body: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: _controller.validarTitulo,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(labelText: "Titulo"),
                    //submit ao preencher o campo
                    onSaved: (value) {
                      _controller.titulo = value ?? "";
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Descrição"),
                    onSaved: (value) {
                      _controller.descricao = value ?? "";
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Valor"),
                    onSaved: (value) {
                      _controller.valor = double.parse(value ?? "");
                    },
                  ),
                  InputDatePickerFormField(
                    fieldLabelText: "data",
                    firstDate: DateTime(-1956),
                    lastDate: DateTime.now(),
                    initialDate: DateTime.now(),
                    onDateSaved: (value) {
                      _controller.data = value;
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(labelText: "Tipo"),
                    items: TipoDespesa.values.map((tipo) {
                      return DropdownMenuItem(
                        child: Text(tipo.texto),
                        value: tipo,
                      );
                    }).toList(),
                    onChanged: (item) {
                      _controller.tipo = item ?? TipoDespesa.OUTROS;
                    },
                  )
                ],
              )),
          ElevatedButton(
            onPressed: () {
              _cadastrar(context);
            },
            child: Text("Cadastrar"),
          ),
        ],
      ),
    );
  }
}
