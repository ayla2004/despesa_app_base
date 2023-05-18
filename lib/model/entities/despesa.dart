enum TipoDespesa {
  ALIMENTACAO, //red
  LAZER, //green
  TRANSPORTE, //blue
  SERVICOS, //ambar
  OUTROS, //grey
}

extension DescricaoTipoDespesa on TipoDespesa {
  String get texto {
    switch (index) {
      case 0:
        return "Alimentação";
      case 1:
        return "Lazer";
      case 2:
        return "Transporte";
      case 3:
        return "Serviços";
      case 4:
        return "Outros";
    }
    return "";
  }
}

class Despesa {
  final String id;
  final String titulo;
  final String descricao;
  final double valor;
  final DateTime data;
  final TipoDespesa tipo;

  Despesa({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.valor,
    required this.data,
    required this.tipo,
  });
}
