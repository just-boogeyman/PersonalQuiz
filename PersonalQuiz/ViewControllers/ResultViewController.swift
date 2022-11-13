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

    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        print(answersChosen)
                
        let answers = answersChosen
            .map{"\($0.animal)"}
            .reduce(into: [:]) { counts, letter in
                counts[letter, default: 0] += 1}
            .sorted { $0.1 > $1.1 }
                
        let resul = answers.first?.key ?? "wqeq"
                
        switch resul {
        case String(Animal.cat.rawValue):
            animalLable.text = resul
        default:
            animalLable.text = "🐶"

        }
    }
    

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit{
        print("ResultVC has been delocated")
    }
    
}
