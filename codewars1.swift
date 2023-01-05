//Declara a função "stockList" que recebe dois parâmetros: uma lista de artigos e uma lista de categorias
func stockList(_ listOfArt: [String], _ listOfCat: [String]) -> String {
    //Se a lista de artigos ou a lista de categorias estiverem vazias, retorna uma string vazia
    if listOfArt.isEmpty || listOfCat.isEmpty {
        return ""
    }

    //Cria uma lista vazia de strings chamada "result"
    var result = [String]()
    //Para cada categoria "cat" na lista de categorias "listOfCat"
    for cat in listOfCat {
        //Declara uma variável inteira chamada "sum" com valor 0
        var sum = 0
        //Para cada artigo "art" na lista de artigos "listOfArt"
        for art in listOfArt {
            //Se o primeiro caractere do artigo for igual à categoria "cat"
            if art.prefix(1) == cat {
                //Adiciona o valor do artigo (que está na segunda posição da string, separada por um espaço) à variável "sum"
                sum += Int(art.components(separatedBy: " ")[1])!
            }
        }
        //Adiciona à lista "result" a string "(categoria : valor da soma)"
        result.append("(\(cat) : \(sum))")
    }
    //Retorna a lista "result" junta em uma string, separada por " - "
    return result.joined(separator: " - ")
}

//Importa a biblioteca XCTest
import XCTest

//Declara a classe "SolutionTest" que herda de XCTestCase
class SolutionTest: XCTestCase {
    //Declara a variável "allTests" como uma lista de tuplas, onde cada tupla contém o nome de um teste e a função correspondente
    static var allTests = [
        ("stockList", testExample),
    ]

    //Declara a função "testing" que recebe três parâmetros: uma lista de artigos, uma lista de categorias e uma string esperada
    func testing(_ listOfArt: [String], _ listOfCat: [String], _ expected: String) {
        //Chama a função "stockList" com os parâmetros "listOfArt" e "listOfCat" e atribui o resultado à variável "ans"
        let ans = stockList(listOfArt, listOfCat)
        //Testa se "ans" é igual à string esperada "expected"
        XCTAssertTrue(ans == expected, "should return \(expected), got \(ans)")
    }
     
    //Declara a função de teste "testExample"
    func testExample() {
        //Declara a lista de artigos "b"
        let b = ["BBAR 150", "CDXE 515", "BKWR 250", "BTSQ 890", "DRTY 600"]
        //Declara a lista de categorias "c"
        let c = ["A", "B", "C", "D"]
        //Declara a string esperada "res"
        let res = "(A : 0) - (B : 1290) - (C : 515) - (D : 600)"
        //Chama a função de teste "testing" com os parâmetros "b", "c" e "res"
        testing(b, c, res)
        }
}

// inicializa os testes
XCTMain([
    testCase(SolutionTest.allTests)
])



