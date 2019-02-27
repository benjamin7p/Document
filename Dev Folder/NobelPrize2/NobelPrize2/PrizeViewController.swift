//
//  ViewController.swift
//  NobelPrize2
//
//  Created by Benjamin Poulsen PRO on 12/21/18.
//  Copyright © 2018 Benjamin Poulsen PRO. All rights reserved.
//
import UIKit

class PrizeViewController: UIViewController {
    
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var textView: UITextView!
    
    let nobelService = NobelService()
    
    var prize: [Prize] = []
    // let queryOptions = ["physics","chemistry","literature","Peace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = "Show Me Nobel Prizes"
    }
    
    
    func fetchMatchingItems() {
        let searchYear = searchBar.text ?? ""
        let selectedIndex = segmentedController.selectedSegmentIndex
        if let category = segmentedController.titleForSegment(at: selectedIndex)?.lowercased() {
            
            if !searchYear.isEmpty {
                let queryPeramiters = ["category": category, "year": searchYear]
                
                textView.text = ""
                nobelService.requestData(query: queryPeramiters) { (response) in
                    var laureateString = ""
                    guard let response = response else { return }
                    for prize in response.prizes {
                        print(prize)
                        for laureate in prize.laureates {
                            
                            laureateString.append("\u{2022} \(laureate.firstname), \(laureate.surname)\n Moivation \(laureate.motivation)\n")
                        }
                    }
                    DispatchQueue.main.async {
                        self.textView.text = laureateString
                        print("")
                    }
                    
                }
                
            }
            
        }
        
    }
    
    @IBAction func categoryUpdated(_ sender: UISegmentedControl) {
        fetchMatchingItems()
    }
}

extension PrizeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
    
}
        
     
