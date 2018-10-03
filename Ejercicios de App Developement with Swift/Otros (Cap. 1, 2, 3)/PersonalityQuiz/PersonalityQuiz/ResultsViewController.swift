//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by macbook on 28/06/18.
//  Copyright © 2018 macbook. All rights reserved.
//

////////Copia IFE, Credencial UNAM y comprobante de domicilio, así como una carta de compromiso

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]!
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculatePersonalityResult() {
        var frecuencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map{$0.type}
        for response in responseTypes{
            frecuencyOfAnswers[response] = (frecuencyOfAnswers[response] ?? 0) + 1
        }
        
        let frecuentAsnwersSorted = frecuencyOfAnswers.sorted(by:
        {(pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frecuentAsnwersSorted.first!.key
        
        resultAnswerLabel.text = "Yo are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

}
