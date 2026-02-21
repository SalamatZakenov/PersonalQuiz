//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Salamat Zakenov on 10.02.2026.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        updateResult()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
        private func updateResult() {
            var frequencyOfAnimals: [Animal: Int] = [:]
            
            // Превращаем массив ответов в массив животных
            let animals = responses.map { $0.animal }
            
            // Считаем количество каждого животного
            for animal in animals {
                frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
            }
            
            // Сортируем словарь по значению и берем первое (самое частое)
            let sortedMostFrequencyAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
            guard let mostFrequencyAnimal = sortedMostFrequencyAnimals.first?.key else { return }
            
            updateUI(with: mostFrequencyAnimal)
        }
        
        private func updateUI(with animal: Animal) {
            resultAnimalLabel.text = "Вы — \(animal.rawValue)!"
            resultDefinitionLabel.text = animal.definition
        }

}
