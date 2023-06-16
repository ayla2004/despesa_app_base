import 'package:despesas_app/controller/home_controller.dart';
import 'package:despesas_app/model/entities/despesa.dart';
import 'package:despesas_app/pages/adicionar_despesa_page.dart';
import 'package:despesas_app/pages/relatorio_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/formater_utils.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  Color _corDespesa(TipoDespesa tipo) {
    switch (tipo) {
      case TipoDespesa.ALIMENTACAO:
        return Colors.red;
      case TipoDespesa.LAZER:
        return Colors.green;
      case TipoDespesa.TRANSPORTE:
        return Colors.blue;
      case TipoDespesa.SERVICOS:
        return Colors.amber;
      case TipoDespesa.OUTROS:
        return Colors.grey;
    }
  }

  void _abrirRelatorioPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((_) {
          return RelatorioPage();
        }),
      ),
    ).then((value) {
      setState(() {});
    });
  }

  void _abrirAdicionarDespesaPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((_) {
          return AdicionarDespesaPage();
        }),
      ),
    ).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Despesas"),
          actions: [
            IconButton(
              onPressed: _abrirRelatorioPage,
              icon: Icon(Icons.report),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _abrirAdicionarDespesaPage,
          child: Icon(
            Icons.add,
            size: 40.0,
          ),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: _controller.despesas.length,
          itemBuilder: (ctx, index) {
            final despesa = _controller.despesas[index];

            return Card(
              elevation: 3.0,
              child: ListTile(
                //leading - ocupa a primeira parte da lista
                leading: Container(
                    height: 30,
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: _corDespesa(despesa.tipo),
                    ),

                    //despesa.tipo.name == 'ALIMENTACAO'
                    //    ? Colors.red
                    //    : despesa.tipo.name == 'LAZER'
                    //       ? Colors.green
                    //        : despesa.tipo.name == 'TRANSPORTE'
                    //            ? Colors.blue
                    //            : despesa.tipo.name == 'SERVICOS'
                    //                ? Colors.amber
                    //                : Colors.grey,
                    child: Text("R\$${despesa.valor.toStringAsFixed(2)}")),
                //title - titulo principal
                title: Text(despesa.titulo),
                // subtitulo
                subtitle: Text(DateFormat().toBR(despesa.data)),
                trailing: Text("${despesa.tipo.name}"),
              ),
            );
          },
        ));
  }
}
