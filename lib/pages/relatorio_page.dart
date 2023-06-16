import 'package:despesas_app/controller/relatorio_controller.dart';
import 'package:flutter/material.dart';

class RelatorioPage extends StatefulWidget {
  const RelatorioPage({super.key});

  @override
  State<RelatorioPage> createState() => _RelatorioPageState();
}

class _RelatorioPageState extends State<RelatorioPage> {
  @override
  Widget build(BuildContext context) {
    final controller = RelatorioController();
    return Scaffold(
      appBar: AppBar(title: Text("Página relatório")),
      body: Center(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color.fromARGB(250, 220, 140, 240),
                    ),
                    height: 350,
                    child: Column(
                      children: [
                        Padding(padding: const EdgeInsets.all(10)),
                        Text("- Valor Total das Despesas -",
                            style: Theme.of(context).textTheme.headlineSmall),
                        Text(
                          "R\$${controller.valorTotalDespesas.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: 30),
                        Text("- Valor Total / Ultimos 30 dias -",
                            style: Theme.of(context).textTheme.headlineSmall),
                        Text(
                            "R\$${controller.valorTotalTrintaDias.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(height: 30),
                        Text("- Maior Despesa -",
                            style: Theme.of(context).textTheme.headlineSmall),
                        Text("${controller.maiorDespesa}",
                            style: Theme.of(context).textTheme.headlineSmall)
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
