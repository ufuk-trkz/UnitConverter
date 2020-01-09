//
//  DistanceViewController.swift
//  UnitConverter
//
//  Created by Ufuk Türközü on 07.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

protocol SelectDistanceDelegate {
    func selectFromDistance(selectedFromDistance: String)
}

protocol SelectToDistanceDelegate {
    func selectToDistance(selectedToDistance: String)
}

class DistanceViewController: UIViewController {

    @IBOutlet weak var fromDistanceButton: UIButton!
    @IBOutlet weak var fromDistanceTF: UITextField!
    @IBOutlet weak var toDistanceButton: UIButton!
    @IBOutlet weak var toDistanceTF: UITextField!
    
    var selectedFromDistance: String? = "meter [m]"
    var selectedToDistance: String? = "inch [in]"
    
    
    var distances: [Unit] = [Unit(name: "meter [m]",                                 factor: 1),
                             Unit(name: "centimeter [cm]", factor: 100),
                             Unit(name: "kilometer [km]", factor: 0.001),
                             Unit(name: "mile [mi]", factor: 0.0006213712),
                             Unit(name: "foot [ft]", factor: 3.280839895),
                             Unit(name: "inch [in]", factor: 39.37007874)]
    // meter is the base factor
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fromDistanceButton.setTitle(selectedFromDistance, for: .normal)
        toDistanceButton.setTitle(selectedToDistance, for: .normal)
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if fromDistanceTF.isEditing {
            fromDistanceTF.text! += (String(sender.tag))
        } else if toDistanceTF.isEditing {
            toDistanceTF.text! += (String(sender.tag))
        }
    }
    
    @IBAction func equalTapped(_ sender: Any) {

        var solution1: Double = 0
        var solution2: Double = 0
            
        for distance in distances {
                
            if fromDistanceButton.currentTitle == distance.name {
                solution1 = (Double(fromDistanceTF.text ?? "0") ?? 0) / (Double(distance.factor))
            }
        }
        
        for distance in distances {
                
            if toDistanceButton.currentTitle == distance.name {
                solution2 = solution1 * distance.factor
            }
        }
            
        toDistanceTF.text = String(format: "%.2f", solution2)
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        fromDistanceTF.text = ""
        toDistanceTF.text = ""
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "FromDistanceSegue" {
            
            guard let destinationTVC = segue.destination as? DistanceTableViewController else { return }
                 
                destinationTVC.delegate = self
        } else if segue.identifier == "ToDistanceSegue" {

            guard let destinationTVC = segue.destination as? DistanceTableViewController else { return }
                        
            destinationTVC.secDelegate = self
        }
    }
}

extension DistanceViewController: SelectDistanceDelegate {
    func selectFromDistance(selectedFromDistance: String) {
        self.selectedFromDistance = selectedFromDistance
    }
}

extension DistanceViewController: SelectToDistanceDelegate { 
    func selectToDistance(selectedToDistance: String) {
        self.selectedToDistance = selectedToDistance
    }
}

