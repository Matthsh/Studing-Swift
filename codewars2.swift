// roman numbers translator

import Foundation

func solution(_ string:String) -> Int {
    // variavel que irá guardar o resultado final
  var result: Int = 0
    // cria um dicionário que mapeia cada caractere romano para seu valor decimal correspondente
  let values: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    // variavel para guardar o valor anterior
  var previousValue: Int = 0
    // para cada caractere na string roman, começando pelo último caractere
  for char in string.reversed() {
        // pega o valor do caractere atual
    let value = values[char]!
        // verifica se o valor do caractere atual é menor do que o valor do caractere anterior
    if value < previousValue{
          // subtrai esse valor do resultado final
      result -= value
    } else {
          // adiciona esse valor ao resultado final
      result += value
    }
        // atualiza o valor anterior
    previousValue = value
  }
    // retorna o resultado final como o valor decimal inteiro correspondente ao número romano
  return result
}

// Importando a biblioteca para teste
import XCTest

// Classe para testes
class SolutionTest: XCTestCase {
    // Lista de testes
    static var allTests = [
        ("testOneThroughTen", testOneThroughTen),
        ("testBigNumbers", testBigNumbers),
    ]

    // Testando números de 1 a 10
    func testOneThroughTen() {
        XCTAssertEqual(solution("I"), 1)
        XCTAssertEqual(solution("II"), 2)
        XCTAssertEqual(solution("III"), 3)
        XCTAssertEqual(solution("IV"), 4)
        XCTAssertEqual(solution("V"), 5)
        XCTAssertEqual(solution("VI"), 6)
        XCTAssertEqual(solution("VII"), 7)
        XCTAssertEqual(solution("VIII"), 8)
        XCTAssertEqual(solution("IX"), 9)
        XCTAssertEqual(solution("X"), 10)
    }
    
    // Testando números grandes
    func testBigNumbers() {
        XCTAssertEqual(solution("C"), 100)
        XCTAssertEqual(solution("CDXLIV"), 444)
    XCTAssertEqual(solution("M"), 1000)
    XCTAssertEqual(solution("MCMLIV"), 1954)
    XCTAssertEqual(solution("MCMXC"), 1990)
    XCTAssertEqual(solution("MCMXCIX"), 1999)
    XCTAssertEqual(solution("MM"), 2000)
    XCTAssertEqual(solution("MMVIII"), 2008)
    XCTAssertEqual(solution("MMM"), 3000)
    XCTAssertEqual(solution("MMMCM"), 3900)
    XCTAssertEqual(solution("MMMCMXIV"), 3914)
    }

}

// Executando os testes
XCTMain([
    testCase(SolutionTest.allTests)
])
