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
    let selections: [Selection]
    var groups: [Group]
    
    init(selections: [Selection]) {
        self.selections = selections
        self.groups = []
    }
    
    mutating func createGroups() {
        var selectionGroup: [Selection] = []
        var totalSelections = selections
        
        while totalSelections.count > 0 {
            while selectionGroup.count < 4 {
                var selectionIndex = Int.random(in: 0...totalSelections.count - 1)
                
                selectionGroup.append(totalSelections[selectionIndex])
                totalSelections.remove(at: selectionIndex)
                
            }
            self.groups.append(Group(selections: selectionGroup))
            selectionGroup = []
        }
        
    }
}

struct Selection {
    let name : String
    let country : String
    let players: [Player]
    let selector: String
    var points: Int = .zero
    
    mutating func addPoints(points: Int) {
        self.points += points
    }
}

struct Player {
    let name: String
    let surname: String
    
}

let spain = Selection(name: "Spain", country: "España", players: [Player(name: "Alvaro", surname: "Morata")], selector: "Luis Enrique")
let italy = Selection(name: "Italy", country: "Italia", players: [Player(name: "Andrea", surname: "Pirlo")], selector: "Roberto Mancini")
let france = Selection(name: "France", country: "Francia", players: [Player(name: "Zidedine", surname: "Zidane")], selector: "Didier Deschamps")
let england = Selection(name: "England", country: "Inglaterra", players: [Player(name: "Harry", surname: "Kane")], selector: "Gareth Southgate")
let brazil = Selection(name: "Brazil", country: "Brazil", players: [Player(name: "Vinicius", surname: "Junior")], selector: "Scolari")
let portugal = Selection(name: "Portugal", country: "Portugal", players: [Player(name: "Cristiano", surname: "Ronaldo")], selector: "Fernando Santos")
let argentina = Selection(name: "Argentina", country: "Argentina", players: [Player(name: "Lionel", surname: "Messi")], selector: "Scaloni")
let holanda = Selection(name: "Holanda", country: "Holanda", players: [Player(name: "Menphis", surname: "Depay")], selector: "Louis Van Gaal")


var worldCup = WorldCup(selections: [spain, italy, france, england, brazil, portugal, argentina, holanda])


// 7.- Crear una clase para representar los partidos entre selecciones, deberá contener atributos como equipo local, visitante y resultado como mínimo.Generar una lista aleatoria de partidos entre la lista de selecciones anteriores y hacer un print de este estilo por partido: Partido: España 3 - 1 Brasil

struct MatchTeams {
    var localTeam: Selection
    var visitorTeam: Selection
    var result: String
    let winner: Winner
}

enum Winner {
    case localTeam
    case visiterTeam
    case tie
}

func getMatch(between localTeam: Selection,
              and visitorTeam: Selection,
              callback: (MatchTeams) -> Void) {
    
    var resultLocal = Int.random(in: 0...10)
    var resultVisit = Int.random(in: 0...10)
    var winner: Winner = .tie
    if resultLocal > resultVisit {
        winner = .localTeam
    } else if resultLocal < resultVisit {
        winner = .visiterTeam
    } else {
        winner = .tie
    }
    
    var match = MatchTeams(localTeam: localTeam, visitorTeam: visitorTeam, result: "\(resultLocal) - \(resultVisit)", winner: winner)
    callback(match)
}

getMatch(between: worldCup.selections.randomElement() ?? spain, and: worldCup.selections.randomElement() ?? italy) { match in
    print("Partido: \(match.localTeam.name) \(match.result) \(match.visitorTeam.name) ")
}

// 8.- Genera de forma aleatoria, dentro de la clase Mundial, un listado de grupos con un máximo de 4 selecciones por grupo, se puede crear una nueva clase nueva Grupo que contenga el nombre del grupo, listado de participantes y listado de partidos.Por ejemplo: Grupo A España, Brasil, Francia, Alemania.

struct Group {
    var selections: [Selection]
    
    func getPoints(selectionName: String) -> Int {
        let selection = selections.filter { selection in
            selection.name == selectionName
        }.first
        
        return selection?.points ?? .zero
    }
    
    func getSelectionOrderByPoints() -> [Selection] {
        selections.sorted(by: { $0.points > $1.points })
    }
}

worldCup.createGroups()

worldCup.groups.enumerated().forEach { index, group in
    print("Grupo \(index):")
    group.selections.forEach { selection in
        print(selection.name)
    }
}


//9.- Para añadir a cada Grupo los puntos de cada seleccion habrá que contabilizar las victorias con 3 puntos, empates con 1 y derrotas con 0. Añadir una funcion en la clase Grupo que le pasemos una selección y nos devuelva sus puntos.

func playMatchAndSaveResult(groupIndex: Int) {
    getMatch(between: worldCup.groups[groupIndex].selections.randomElement() ?? spain, and: worldCup.groups[groupIndex].selections.randomElement() ?? italy) { match in
        
        guard let localTeamIndex = worldCup.groups[groupIndex].selections.firstIndex(where: { selection in
            selection.name == match.localTeam.name
        }) else { return }
        
        guard let visitorTeamIndex = worldCup.groups[groupIndex].selections.firstIndex(where: { selection in
            selection.name == match.visitorTeam.name
        }) else { return }
        
        switch match.winner {
        case .localTeam:
            worldCup.groups[groupIndex].selections[localTeamIndex].addPoints(points: 3)
        case .visiterTeam:
            worldCup.groups[groupIndex].selections[visitorTeamIndex].addPoints(points: 3)
        case .tie:
            worldCup.groups[groupIndex].selections[localTeamIndex].addPoints(points: 1)
            worldCup.groups[groupIndex].selections[visitorTeamIndex].addPoints(points: 1)
        }
    }
}

playMatchAndSaveResult(groupIndex: 0)

print(worldCup.groups[0].getPoints(selectionName: "Spain"))





// 10.- Generar los partidos del Mundial en cada grupo y calcular las dos primeras selecciones de cada grupo y hacer un print con los clasificados.

// Este ejercicio lo podía haber mejorado, para que no me salieran partidos con las mismas selecciones, ya que al utilizar un random, podría pasar, pero por falta de tiempo lo he tenido que dejar así


playMatchAndSaveResult(groupIndex: 0)
playMatchAndSaveResult(groupIndex: 0)
playMatchAndSaveResult(groupIndex: 0)


playMatchAndSaveResult(groupIndex: 1)
playMatchAndSaveResult(groupIndex: 1)
playMatchAndSaveResult(groupIndex: 1)


print(worldCup.groups [0].getSelectionOrderByPoints())
print(worldCup.groups[1].getSelectionOrderByPoints())









