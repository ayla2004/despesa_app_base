import 'package:despesas_app/model/entities/despesa.dart';

class AdicionaDespesaController {
  var titulo = "";
  var descricao = "";
  var valor = 0.0;
  var data = DateTime.now();
  var tipo = TipoDespesa.OUTROS;

  setTitulo(String? valor) {
    titulo = valor ?? "";
  }

  setDescricao(String? valor) {
    descricao = valor ?? "";
  }

  setValor(String? param) {
    valor = double.tryParse(param ?? "0") ?? 0;
  }

  String? validarTitulo(String? value) {
    if ((value == null) || (value.isEmpty)) {
      return "Digite um título";
    }
    if (value.length < 5) {
      return "Tamanho inválido! Deve ter mais de 5 caracteres!";
    }
  }

  String? validarValor(String? value) {
    if (value == null) {
      return "Digite um valor";
    }
    double? valor = double.tryParse(value);
    if (valor == null) {
      return "Valor inválido!";
    }
    if (valor < 0) {
      return "Valor deve ser maior que 0";
    }
  }

  void cadastrar() {}
}
