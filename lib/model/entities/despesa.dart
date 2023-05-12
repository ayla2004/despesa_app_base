enum TipoDespesa { ALIMENTACAO, LAZER, TRANSPORTE, SERVICOS, OUTROS }

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
