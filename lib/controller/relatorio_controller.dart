import 'package:despesas_app/model/entities/despesa.dart';
import 'package:despesas_app/model/repositories/local_repositorio_despesas.dart';

class RelatorioController {
  List<Despesa> despesas = repositorio.despesas;

  double get valorTotalDespesas {
    double valorTotal = 0;

    if (despesas.isNotEmpty) {
      for (int i = 0; i < despesas.length; i++) {
        valorTotal += despesas[i].valor;
      }
      return valorTotal;
    } else {
      return 0.0;
    }
  }

  double get valorTotalTrintaDias {
    double valorTotal = 0;

    if (despesas.isNotEmpty) {
      for (int i = 0; i < despesas.length; i++) {
        if (DateTime.now().month - despesas[i].data.month <= 1) {
          valorTotal += despesas[i].valor;
        }
      }
      return valorTotal;
    } else {
      return 0.0;
    }
  }

  String get maiorDespesa {
    if (despesas.isNotEmpty) {
      double valor = 0.0;
      Despesa despesa = Despesa(
          id: "",
          titulo: "",
          descricao: "",
          valor: 0,
          data: DateTime.now(),
          tipo: TipoDespesa.OUTROS);

      for (int i = 0; i < despesas.length; i++) {
        if (despesas[i].valor > valor) {
          valor += despesas[i].valor;
          despesa = despesas[i];
        }
      }

      return despesa.titulo;
    } else {
      return "Sem despesas cadastradas";
    }
  }
}
