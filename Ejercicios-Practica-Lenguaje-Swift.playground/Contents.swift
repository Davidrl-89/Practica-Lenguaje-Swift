import UIKit

// MARK: - PRÁCTICA iOS SWIFT DE DAVID ROBLES -

// 1.- Calcular y generar una lista con los 100 primeros números primos y hacer un print de los últimos 10.

var number = 2
var primeNumbers: [Int] = []
while primeNumbers.count < 100 {
    var isPrime = true
    
    for i in 2..<number {
        if number % i == 0{
            isPrime = false
        }
    }
    if isPrime == true {
        primeNumbers.append(number)
    }
    number += 1
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

struct SoccerTeamMember {
    var name: String = ""
    var country: String = ""
    var age: Int = 0
    var charge: TypesOfChargeFootballTeam
}
enum TypesOfChargeFootballTeam {
    case player
    case selector
    case medical
    case utilityMan
}

// 6.- Crear las clases necesarias, con los atributos mínimos, para representar las selecciones de fútbol del Mundial de fútbol 2022.

struct  WorldCup {
    var footballTeam: [Selection]
}

struct Selection {
    var name : String
    var country : String
    var players: Player
    var selector: String
}

struct Player {
    var name: String
    var surname: String
    
}




var spain = Selection(name: "Spain", country: "España", players: Player(name: "Alvaro", surname: "Morata"), selector: "Luis Enrique")
var italy = Selection(name: "Italy", country: "Italia", players: Player(name: "Andrea", surname: "Pirlo"), selector: "Roberto Mancini")
var france = Selection(name: "France", country: "Francia", players: Player(name: "Zidedine", surname: "Zidane"), selector: "Didier Deschamps")
var england = Selection(name: "England", country: "Inglaterra", players: Player(name: "Harry", surname: "Kane"), selector: "Gareth Southgate")

var selections = WorldCup(footballTeam: [spain, italy, france, england])


// 7.- Crear una clase para representar los partidos entre selecciones, deberá contener atributos como equipo local, visitante y resultado como mínimo.Generar una lista aleatoria de partidos entre la lista de selecciones anteriores y hacer un print de este estilo por partido: Partido: España 3 - 1 Brasil

struct MatchTeams {
    var localTeam: Selection
    var visitorTeam: Selection
    var result: String
}

func getMatch(between localTeam: Selection,
              and visitorTeam: Selection,
              callback: (MatchTeams) -> Void) {
    
    var resultLocal = Int.random(in: 0...10)
    var resultVisit = Int.random(in: 0...10)
    
    var match = MatchTeams(localTeam: localTeam, visitorTeam: visitorTeam, result: "\(resultLocal) - \(resultVisit)")
    callback(match)
}

getMatch(between: selections.footballTeam.randomElement() ?? spain, and: selections.footballTeam.randomElement() ?? italy) { match in
    print("Partido: \(match.localTeam.name) \(match.result) \(match.visitorTeam.name) ")
}

// 8.- Genera de forma aleatoria, dentro de la clase Mundial, un listado de grupos con un máximo de 4 selecciones por grupo, se puede crear una nueva clase nueva Grupo que contenga el nombre del grupo, listado de participantes y listado de partidos.Por ejemplo: Grupo A España, Brasil, Francia, Alemania.




// 9.- Para añadir a cada Grupo los puntos de cada seleccion habrá que contabilizar las victorias con 3 puntos, empates con 1 y derrotas con 0.Añadir una funcion de la clase Grupo que le pasemos una selección y nos devuelva sus puntos.


// 10.- Generar los partidos del Mundial en cada grupo y calcular las dos primeras selecciones de cada grupo y hacer un print con los clasificados.
