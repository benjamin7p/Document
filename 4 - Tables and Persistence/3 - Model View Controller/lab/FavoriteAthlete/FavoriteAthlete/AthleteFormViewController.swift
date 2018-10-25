//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Benjamin Poulsen PRO on 10/24/18.
//

import UIKit

class AthleteFormViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leageTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    var athlete: Athlete?
    func updateView() {
        guard let athlete = athlete else {return}
    
        // need to assign values from
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    @IBAction func athleteInfoSaveButton(_ sender: UIButton) {
        guard let name = nameTextField.text,
        let age = ageTextField.text,
            let leage = leageTextField.text,
            let team = teamTextField.text else {return}
        athlete = Athlete(name: name, age: age, leage: leage, team: team)
        performSegue(withIdentifier: "UnwindToAthleteTable", sender: self)
       
    }
}
    
    
    
   
    
        
        
    
    
    
    
    
    
    
    
   
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        
    



