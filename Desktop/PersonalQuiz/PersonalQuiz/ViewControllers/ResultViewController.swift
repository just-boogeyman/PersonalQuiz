//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var youAnimalLable: UILabel!
    @IBOutlet var youNameLable: UILabel!
    
    var anser: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getSortedAnimals()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getSortedAnimals() {
        let result = anser
            .sorted { $0.animal.rawValue > $1.animal.rawValue }
            .map {$0.animal}
        print(result)
        youAnimalLable.text = "Вы - \(result[0].rawValue)"
        youNameLable.text = "Вы - \(result[0])"
    }
}
