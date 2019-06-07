//
//  PetCard.swift
//  NotPinder
//
//  Created by Benjamin Poulsen PRO on 4/7/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import Foundation
import CoreData

extension PetCard {
    convenience init?(dictionary: Dictionary<String, Any>, context: NSManagedObjectContext = Stack.context) {
        
        guard let petId = dictionary["petId"] as? String,
        let personName = dictionary["personName"] as? String else {return nil}
        //            let petID = dictionary["petID"] as? String,
        //            let petPhotoURL = dictionary["petPhotoURL"] as? String,
        //            let petAge = dictionary["petAge"] as? String,
        //            let petBio = dictionary["petBio"] as? String,
        //            let petCardDatePosted = dictionary["petCardDatePosted"] as? String
        
        self.init(context: context)
        
        self.petId = petId
        self.personName = personName
        //        self.petID = petID
        //        self.petPhotoURL = petPhotoURL
        //        self.petAge = petAge
        //        self.petBio = petBio
        //        self.petCardDatePosted = petCardDatePosted
        
    }
}
//
