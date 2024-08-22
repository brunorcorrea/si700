class JogoDaVelha {
  
  List<int> tabuleiro = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  int jogador = 1;

  bool jogar(int posicao) {
    if (tabuleiro[posicao] == 0) {
      tabuleiro[posicao] = jogador;
      jogador *= -1;
      return true;
    }

    return false;
  }

  int obterEstadoPosicao(int posicao) {
    return tabuleiro[posicao];
  }
}