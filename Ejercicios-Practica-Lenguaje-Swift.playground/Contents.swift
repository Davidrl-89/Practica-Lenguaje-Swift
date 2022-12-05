import UIKit

// MARK: - PRÁCTICA iOS SWIFT -

// 1.- Calcular y generar una lista con los 100 primeros números primos y hacer un print de los últimos 10.

var numero = 2
var primeNumbers: [Int] = []
while primeNumbers.count <= 100 {
    var isPrime = true
    
    for i in 2..<numero {
        if numero % i == 0{
            isPrime = false
        }
    }
    if isPrime == true {
        primeNumbers.append(numero)
    }
    numero += 1
}
print("Los 100 primeros numeros primos son \(primeNumbers)")
print("Los ultimos 10 números de nuestra lista son \(primeNumbers.suffix(10))")


// 2.- Calcular la suma de los primeros 50 números primos y hacer un print del resultado.

var sumPrimeNumbers = primeNumbers[0...49]
var sum = sumPrimeNumbers.reduce(0, +)
print("La suma de los 50 primeros numeros primos es \(sum)")



// 3.- Dada la siguiente lista, obtener todos los elementos que contengan más de dos vocales:

var players: [String] = ["Vinicius", "Messi", "Ronaldo", "Pedri", "Mbappe", "Modric", "Militao", "Morata", "Valverde", "Benzema", "Pique"]

var playersFiltered = players.filter { player in
    player.filter { char in
        char == "a" || char == "e" || char == "o" || char == "i" || char == "u"
    }.count > 2
}
print(playersFiltered)

// 4.- Crear un enumerado que permita indicar la posición en el campo de un jugador de fútbol.

enum FooballTeam {
    case Portero
    case LateralDerecho
    case Central
    case LateralIzquierdo
    case Mediocentro
    case ExtremoDerecha
    case ExtremoIzquierda
    case Delantero
    
}

// 5.- Crea una clase,con los atributos necesarios, para representar a los miembros que participan en una selección del mundial y un enumerado que los diferencia por tipo, por ejemplo: Jugador, Seleccionador, Médico

struct MiembroSeleccionFutbol {
    var name: String = ""
    var pais: String = ""
    var edad: Int = 0
    var cargo: TipoDeCargoSeleccionFutbol
}
enum TipoDeCargoSeleccionFutbol {
    case jugador
    case seleccionador
    case medico
    case utillero
}

