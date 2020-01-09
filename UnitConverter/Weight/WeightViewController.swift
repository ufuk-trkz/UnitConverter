//
//  WeightViewController.swift
//  UnitConverter
//
//  Created by Ufuk Türközü on 07.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

protocol SelectFromWeightDelegate {
    func selectFromWeight(selectedFromWeight: String)
}

protocol SelectToWeightDelegate {
    func selectToWeight(selectedToWeight: String)
}

class WeightViewController: UIViewController {

    @IBOutlet weak var fromWeightButton: UIButton!
    @IBOutlet weak var fromWeightTF: UITextField!
    @IBOutlet weak var toWeightButton: UIButton!
    @IBOutlet weak var toWeightTF: UITextField!
    
    var selectedFromWeight: String? = "kilogram [kg]"
    var selectedToWeight: String = "pound [lbs]"
    
    var weights: [Unit] = [Unit(name: "gram [g]", factor: 1),
                           Unit(name: "kilogram [kg]", factor: 0.001),
                           Unit(name: "pound [lbs]", factor: 0.0022046226),
                           Unit(name: "ounce [oz]", factor: 0.0352739619)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fromWeightButton.setTitle(selectedFromWeight, for: .normal)
        toWeightButton.setTitle(selectedToWeight, for: .normal)
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if fromWeightTF.isEditing {
            fromWeightTF.text! += (String(sender.tag))
        } else if toWeightTF.isEditing {
            toWeightTF.text! += (String(sender.tag))
        }
        
    }
    
    @IBAction func equalTapped(_ sender: Any) {
        
        var solution1: Double = 0
        var solution2: Double = 0
            
        for weight in weights {
                
            if fromWeightButton.currentTitle == weight.name {
                solution1 = (Double(fromWeightTF.text ?? "0") ?? 0) / (Double(weight.factor))
            }
        }
        
        for weight in weights {
            
            if toWeightButton.currentTitle == weight.name {
                solution2 = solution1 * weight.factor
            }
        }
            
        toWeightTF.text = String(format: "%.2f", solution2)
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        fromWeightTF.text = ""
        toWeightTF.text = ""
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "FromWeightSegue" {
            
            guard let destinationTVC = segue.destination as? WeightTableViewController else { return }
                 
                destinationTVC.delegate = self
        } else if segue.identifier == "ToWeightSegue" {

            guard let destinationTVC = segue.destination as? WeightTableViewController else { return }
                        
            destinationTVC.secDelegate = self
        }
    }
}

extension WeightViewController: SelectFromWeightDelegate {
    func selectFromWeight(selectedFromWeight: String) {
        self.selectedFromWeight = selectedFromWeight
    }
}
    
extension WeightViewController: SelectToWeightDelegate {
    func selectToWeight(selectedToWeight: String) {
        self.selectedToWeight = selectedToWeight
    }
}
