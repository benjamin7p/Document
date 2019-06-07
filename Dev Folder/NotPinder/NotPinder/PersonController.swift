//
//  PersonController.swift
//  NotPinder
//
//  Created by Benjamin Poulsen PRO on 4/5/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class PersonController {
    
    
    
    let newPetURL = "https://deckofcardsapi.com/api/deck/new/draw/?count=52"
    
    static let sharedController = PersonController()
    
    //checks the stack context container for Pets and returns a collection either full or empty
    
    var performNewPetFetchRequest: [Person] {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            return try Stack.context.fetch(request)
        } catch {
            return []
        }
    }
    
    
    
    func saveToPersistentStorage() {
        
        do {
            try Stack.context.save()
        } catch {
            print("deck not saved to persistent storage")
        }
    }
}
