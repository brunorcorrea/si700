import '../model/question.dart';
import '../model/questions.dart';

class QuestionProvider {
  static QuestionProvider helper = QuestionProvider._createInstance();
  QuestionProvider._createInstance();
  Questions questions = Questions(questionList: [
    Question(
        titulo: "Qual é a sua marca de carro favorita?",
        subTitulo: "",
        alternatives: ["Toyota", "Ford", "Chevrolet", "Honda"],
        type: QuestionType.multiple),
    Question(
        titulo: "Qual é o modelo do seu carro atual?",
        subTitulo: "Se você possui um carro",
        alternatives: [],
        type: QuestionType.text),
    Question(
        titulo: "Você prefere carros elétricos ou a combustão?",
        subTitulo: "",
        alternatives: ["Elétricos", "Combustão"],
        type: QuestionType.singleShort),
    Question(
        titulo: "Qual é a cor do seu carro dos sonhos?",
        subTitulo: "",
        alternatives: ["Vermelho", "Azul", "Preto", "Branco"],
        type: QuestionType.multiple),
    Question(
        titulo: "Com que frequência você realiza a manutenção do seu carro?",
        subTitulo: "",
        alternatives: ["Mensalmente", "Trimestralmente", "Anualmente", "Nunca"],
        type: QuestionType.singleShort),
    Question(
        titulo: "Descreva a sua viagem de carro mais memorável.",
        subTitulo: "",
        alternatives: [],
        type: QuestionType.text),
  ], breakpoints: [
    2, 4, 6 // Defina os pontos de quebra desejados
  ]);
}
