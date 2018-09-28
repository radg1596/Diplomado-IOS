//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by macbook on 09/07/18.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    var athlete: Athlete?

    @IBOutlet weak var nameAthleteTextField: UITextField!
    @IBOutlet weak var ageAthleteTextField: UITextField!
    @IBOutlet weak var leageAthleteTextField: UITextField!
    @IBOutlet weak var teamAthleteTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView() {
        if let uwAthelte = athlete {
            nameAthleteTextField.text = uwAthelte.name
            ageAthleteTextField.text = uwAthelte.age
            leageAthleteTextField.text = uwAthelte.league
            teamAthleteTextField.text = uwAthelte.team
        }
    }
    
    @IBAction func saveAthleteButton(_ sender: Any) {
        guard let name = nameAthleteTextField.text,
        let age = ageAthleteTextField.text,
        let leage = leageAthleteTextField.text,
        let team = teamAthleteTextField.text else {return}
        athlete = Athlete(name: name, age: age, league: leage, team: team)
        performSegue(withIdentifier: "UnwindToAthleteTableWithSegue", sender: self)
    }
    

}
