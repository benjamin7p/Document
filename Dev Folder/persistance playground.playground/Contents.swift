import UIKit

var str = "Hello, playground"

enum StuffingType: String, Codable {
    case grandmas
    case cornbread
    case grandpas
    case cranberry
    case glutenFree
}

struct Stuffing: Codable {
    var type: StuffingType
    var person: String
}

enum BreadType: String, Codable {
    case dinnerRolls
    case hawaiianRolls
    case cornBreads
}
struct Bread: Codable {
    var type: BreadType
    var person: String
}
enum TurkeyPrepType: String, Codable {
    case deepFried
    case baked
    case rotisserie
    case slowCooked
    case stew
    case sousVide
}

struct Turkey: Codable {
    var preperationType: TurkeyPrepType
    var person: String
}
enum DessertType: String, Codable {
    case cobbler
    case pie
    case iceCream
}

struct Dessert: Codable {
    var type: DessertType
    var person: String
}

struct ThanksgivingFeast: Codable {
    var stuffing: Stuffing
    var bread: Bread
    var turkey: Turkey
    var desserts: [Dessert]
}
let feast: ThanksgivingFeast = ThanksgivingFeast(stuffing: Stuffing(type: .cornbread, person: "Doug"), bread: Bread(type: .hawaiianRolls, person: "joe"), turkey: Turkey(preperationType: .sousVide, person: "toby"), desserts: [Dessert(type: .cobbler, person: "Mckay"),Dessert(type: .pie, person: "tyler")])

let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
print(documentDirectory)

let fileURL = documentDirectory.appendingPathComponent("ThanksgivingFeast").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedData = try? propertyListEncoder.encode(feast)

try? encodedData?.write(to: fileURL, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
if let retrievedData = try? Data(contentsOf: fileURL) {
    let decodedFeast = try? propertyListDecoder.decode(ThanksgivingFeast.self, from: retrievedData)
}


