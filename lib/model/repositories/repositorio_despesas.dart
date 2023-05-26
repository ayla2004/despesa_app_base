import '../entities/despesa.dart';

abstract class RepositorioDespesas {
  List<Despesa> get despesas;
  void adicionar(Despesa nova);
}
