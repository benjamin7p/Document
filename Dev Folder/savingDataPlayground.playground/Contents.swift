import UIKit

var str = "Hello, playground"
// must conform to codable protocol
struct FamousBattle: Codable {
    
    let date: String
    let victor: String
    let loser: String
    let location: String
    
}



let belleauWoods = FamousBattle(date: "June 26th, 1918", victor: "US of A", loser: "Germany", location: "Marne River, France")
let PearlHarbor = FamousBattle(date: "December 7, 1941", victor: "Empire of Japan", loser: "US of A", location: "Pearl Harbor, Hawaii")
let BattleOfNewOrleans = FamousBattle(date: "January 8, 1815", victor: "US of A", loser: "British Empire", location: "New Orleans, Louisiana")

let FamousBattles = [belleauWoods, PearlHarbor, BattleOfNewOrleans]

//must have init(from:) and encode(to:) wich takes decoder and encoder as a perameter

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
print(documentsDirectory)
let archiveURL = documentsDirectory.appendingPathComponent("famous_battles_test").appendingPathExtension("plist")
print(archiveURL)
// encoder object to encode a value to a plist
let propertyListEncoder = PropertyListEncoder()
let encodedBattles = try? propertyListEncoder.encode(FamousBattles)
try? encodedBattles?.write(to: archiveURL, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
if let retrievedBattleData = try? Data(contentsOf: archiveURL), let decodedBattles = try? propertyListDecoder.decode([FamousBattle].self, from: retrievedBattleData) {
    for battle in decodedBattles {
        print(battle)
    }
    print(decodedBattles)
}




