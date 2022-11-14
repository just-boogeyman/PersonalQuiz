//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    
    @IBOutlet weak var animalLable: UILabel!
    
    @IBOutlet weak var descriptionLable: UILabel!

    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        searchResult()
    }
    
    private func searchResult() {
        var result: [Animal: Int] = [:]
        let answers = answersChosen
            .map{ $0.animal }
        
        answers.forEach {
            result[$0, default: 0] += 1
        }
        
        let res = result.sorted(by: { $0.value > $1.value } )
        
        guard let animal = res.first?.key else { return }
        switch animal {
        case .cat:
            animalLable.text = String(animal.rawValue)
            descriptionLable.text = animal.definition
        case .dog:
            animalLable.text = String(animal.rawValue)
            descriptionLable.text = animal.definition
        case .rabbit:
            animalLable.text = String(animal.rawValue)
            descriptionLable.text = animal.definition
        default:
            animalLable.text = String(animal.rawValue)
            descriptionLable.text = animal.definition
        }
    }
    

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}
