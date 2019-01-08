//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Benjamin Poulsen PRO on 1/7/19.
//  Copyright © 2019 Benjamin Poulsen PRO. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var ageLabel: UITextField!
    @IBOutlet weak var aliveLabel: UITextField!
    @IBOutlet weak var saveFamilyMemberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("Joe Black", forKey: "username")
        newUser.setValue("1234", forKey: "password")
        newUser.setValue("19", forKey: "age")
        
        do {
            try context.save()
        } catch {
            print("failed saving")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print("data group start")
                print(data.value(forKey: "username") as! String)
                print(data.value(forKey: "age") as! String)
                print(data.value(forKey: "password") as! String)
                print("data group end")
            }
        } catch {
            print("failed to fetch data")
        }
        
    }
    
    
    
    
}

