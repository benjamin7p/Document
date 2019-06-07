//
//  AppDelegate.swift
//  NotPinder
//
//  Created by Benjamin Poulsen PRO on 3/28/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//
import Foundation
import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var seven: Pet?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //addPerson()
        addPet()
//        let pets = PetController.sharedController.performNewPetFetchRequest
//        let people = PersonController.sharedController.performNewPetFetchRequest
//
//        if let pet = pets.first,
//            let person = people.first {
//            let petId = pet.petId
//            let personName = person.name
//
//            let response = [personName: petId] as? [String: Any]
//
//
//            let petCard = PetCard(dictionary: response!, context: Stack.context)
        
        
            if let newPet = PetController.sharedController.performNewPetFetchRequest.first{
                
                PetController.sharedController.saveToPersistentStorage(pet: newPet)
                print(newPet)
                
                
            }
            
        
        
        
//        if let pet = pets.first {
//            let petId = pet.petId
//            print("hello I am a \(pet) and my petId is \(petId)")
//        }
        
        
        
        
//       let people = PersonController.sharedController.performNewPetFetchRequest
//        if let person = people.first {
//            let personName = person.name
//            print("hello I am a \(person) and my name is \(personName)")
//
//            let response = []
//
//            let petCard = Pet(dictionary: Dictionary<String, Any>, context: <#T##NSManagedObjectContext#>)
//
//        }
        
        return true
    }
    
    func addPerson() {
        guard let entity = NSEntityDescription.entity(forEntityName: "Person", in: Stack.context)  else {
            fatalError("could not make person")
        }
        
        
        for i in 1...25 {
            let person = NSManagedObject(entity: entity, insertInto: Stack.context)
            
            person.setValue("Person name #\(i)", forKey: "name")
        }
        
    }
    
    //pet
    
    func addPet() {
        guard let entity = NSEntityDescription.entity(forEntityName: "Pet", in: Stack.context) else {
            fatalError("could make pet")
        }
        
        for x in 1...25 {
            let pet = NSManagedObject(entity: entity, insertInto: Stack.context)
            pet.setValue("Pet id #\(x)", forKey: "petId")
        }
    }
    

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

