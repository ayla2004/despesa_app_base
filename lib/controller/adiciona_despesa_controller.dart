import 'package:despesas_app/model/entities/despesa.dart';
import 'package:despesas_app/model/repositories/local_repositorio_despesas.dart';

class AdicionaDespesaController {
  final _repositorio = repositorio;
  var titulo = "";
  var descricao = "";
  var valor = 0.0;
  var data = DateTime.now();
  var tipo = TipoDespesa.OUTROS;

  String? validarTitulo(String? value) {
    if ((value == null) || (value.isEmpty)) {
      return "Digite um titulo";
    }
    if (value.length < 5) {
      return "Tamanho inválido! Deve ter mais de 5 caracteres!";
    }
  }

  String? validarValor(String? value) {
    if ((value == null) || (value.isEmpty)) {
      return "Digite um valor!";
    }
    double? valor = double.tryParse(value);
    if (valor == null) {
      return "Valor inválido!";
    }
    if (valor < 0) {
      return "Valor deve ser maior que 0";
    }
  }

  void cadastrar() {
    final despesa = Despesa(
        id: "0000",
        titulo:  titulo,
        descricao:  descricao,
        valor:  valor,
        data:  data,
        tipo:  tipo);
    _repositorio.adicionar(despesa);
  }
}
