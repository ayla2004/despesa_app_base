class AdicionaDespesaController {
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
}
