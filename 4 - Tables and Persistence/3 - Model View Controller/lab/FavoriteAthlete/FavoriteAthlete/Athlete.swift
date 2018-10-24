//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Benjamin Poulsen PRO on 10/24/18.
//

import Foundation

struct Athlete {
    var name: String
    var age: String
    var leage: String
    var team: String
    
    var description: String{
        return "\(name) is \(age) years old and plays for the \(team) in the \(leage)"
    }
}

