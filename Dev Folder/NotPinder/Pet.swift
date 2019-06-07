//
//  cards.swift
//  NotPinder
//
//  Created by Benjamin Poulsen PRO on 3/28/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation
import CoreData



extension Pet {
    convenience init?(dictionary: Dictionary<String, Any>, context: NSManagedObjectContext = Stack.context) {
        
        guard let petId = dictionary["petId"] as? String else {return nil}
//            let petID = dictionary["petID"] as? String,
//            let petPhotoURL = dictionary["petPhotoURL"] as? String,
//            let petAge = dictionary["petAge"] as? String,
//            let petBio = dictionary["petBio"] as? String,
//            let petCardDatePosted = dictionary["petCardDatePosted"] as? String
        
        self.init(context: context)
        
        self.petId = petId
//        self.petID = petID
//        self.petPhotoURL = petPhotoURL
//        self.petAge = petAge
//        self.petBio = petBio
//        self.petCardDatePosted = petCardDatePosted
        
    }
}
//
//
//extension PersonCard {
//    convenience init?(dictionary: Dictionary<String, Any>, context: NSManagedObjectContext = Stack.context) {
//        
//        guard let personName = dictionary["personName"] as? String,
//            let personEmail = dictionary["personEmail"] as? String,
//            let personID = dictionary["personID"] as? String,
//            let personPhoneNumber = dictionary["personPhoneNumber"] as? String else {return nil}
//        
//        self.init(context: context)
//        
//        self.personName = personName
//        self.personEmail = personEmail
//        self.personID = personID
//        self.personPhoneNumber = personPhoneNumber
//        
//    }
//}
//
//
