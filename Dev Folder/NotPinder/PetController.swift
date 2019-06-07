//
//  PetController.swift
//  NotPinder
//
//  Created by Benjamin Poulsen PRO on 4/4/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation
import CoreData

//name this modelController or petModelController
class PetController {
    
    
    
    let newPetURL = "https://deckofcardsapi.com/api/deck/new/draw/?count=52"
    
    static let sharedController = PetController()
    
    //checks the stack context container for Pets and returns a collection either full or empty
    
    var performNewPetFetchRequest: [Pet] {
        let request: NSFetchRequest<Pet> = Pet.fetchRequest()
        
        do {
            return try Stack.context.fetch(request)
        } catch {
            return []
        }
    }
    
    
    
    func saveToPersistentStorage(pet: Pet) {
        
        do {
            try Stack.context.save()
        } catch {
            print("deck not saved to persistent storage")
        }
    }


//func turnIntoPet(completion: ((Pet?) -> Void)? = nil) {
//    guard let pet = Pet(dictionary: <#T##Dictionary<String, Any>#>, context: <#T##NSManagedObjectContext#>) else {
//        print("couldnt turn into Pet")
//    }
//    
//    pet.setValue("seven", forKey: "petName")
//    
//    
//}
    
    
    
    
    
   
}

//func GetNewDeck(completion: ((Deck?) -> Void)? = nil) {
//    guard let url = URL(string: newDeckURL) else {
//        print("url not working")
//        return
//    }
//    NetworkController.performNetworkRequest(for: url) { (data, error) in
//        guard let data = data else { return }
//
//        do {
//            let response = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
//
//
//            let newDeck = Deck(dictionary: response, context: Stack.context)
//
//            if let cardsInDeck = response["cards"] as? [[String: Any]] {
//                for cardInfo in cardsInDeck {
//                    let newCardInDeck = Card(dictionary: cardInfo)
//                    newCardInDeck!.deck = newDeck
//                    //print(cardInfo)
//                    //print(newDeck?.card?.count)
//                    //print(newDeck)
//
//                    //let newCardValue = [cardValue]
//                    //let thisCard = Card
//                }
//            }
//
//
//
//            if let completion = completion {
//                completion(newDeck)
//            }
//
//        } catch {
//            print(error)
//        }
//    }
//
//}
//
//
//
//func deleteDeck(deckToDelete: Deck) {
//    Stack.context.delete(deckToDelete)
//    saveToPersistentStorage()
//}
//
//
//// func delete(deckToDelete: Deck) {
////        appDelegate.persistentContainer.viewContext.delete(deckToDelete)
////
////    }
////    func saveDeck(deck: Deck) {
////        guard let deckId = deck.deckId else { return }
////          let cardsRemaining = deck.cardsRemaining
////
////        for deck in searchNewDeck {
////            deleteDeck(deck: deck)
////        }
////
////        let deckToSave = Deck(context: Stack.context)
////        deckToSave.deckId = deckId
////        deckToSave.cardsRemaining = cardsRemaining
////        saveToPersistentStorage()
////    }
//

