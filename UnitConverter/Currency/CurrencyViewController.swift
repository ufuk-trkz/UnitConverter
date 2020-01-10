//
//  CurrencyViewController.swift
//  UnitConverter
//
//  Created by Ufuk Türközü on 07.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

/* What I tried:
 protocol SelectCurrencyDelegate {
    func selectFromCurrency(selectedFromCurrency: String)
    func selectToCurrency(selectedToCurrency: String)
 }
 */

protocol SelectCurrencyDelegate {
    func selectFromCurrency(selectedFromCurrency: String)
}

protocol SelectToCurrencyDelegate {
    func selectToCurrency(selectedToCurrency: String)
}

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var fromCurrencyButton: UIButton!
    @IBOutlet weak var fromCurrencyTF: UITextField!
    @IBOutlet weak var toCurrencyButton: UIButton!
    @IBOutlet weak var toCurrencyTF: UITextField!
    
    var selectedFromCurrency: String? = "USD"
    var selectedToCurrency: String? = "EUR"
    
    var currencys: [Unit] = [Unit(name: "USD", factor: 1),
                              Unit(name: "EUR", factor: 0.897),
                              Unit(name: "CAD", factor: 1.3),
                              Unit(name: "MXN", factor: 18.167),
                              Unit(name: "TRY", factor: 5.972),
                              Unit(name: "CHF", factor: 0.971)]
    // USD is the base factor (factor: = 1)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fromCurrencyButton.setTitle(selectedFromCurrency, for: .normal)
        toCurrencyButton.setTitle(selectedToCurrency, for: .normal)
    }
    
    
    @IBAction func numbersTapped(_ sender: UIButton) {
        
        if fromCurrencyTF.isEditing {
            fromCurrencyTF.text! += (String(sender.tag))
        } else if toCurrencyTF.isEditing {
            toCurrencyTF.text! += (String(sender.tag))
        }
    }
    
    @IBAction func equalTapped(_ sender: Any) {
        
        var solution1: Double = 0
        var solution2: Double = 0
        
        for currency in currencys {
            
            if fromCurrencyButton.currentTitle == currency.name {
                solution1 = (Double(fromCurrencyTF.text ?? "0") ?? 0) / (Double(currency.factor))
            }
        }
        
        for currency in currencys {

            if toCurrencyButton.currentTitle == currency.name {
                solution2 = solution1 * currency.factor
            }
        }
        
        toCurrencyTF.text = String(format: "%.2f", solution2)
    }

    @IBAction func clearTapped(_ sender: Any) {
        fromCurrencyTF.text = ""
        toCurrencyTF.text = ""
    }
    

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
        if segue.identifier == "FromCurrencySegue" {
            
            guard let destinationTVC = segue.destination as? CurrencyTableViewController else { return }
                 
                destinationTVC.delegate = self
        } else if segue.identifier == "ToCurrencySegue" {

            guard let destinationTVC = segue.destination as? CurrencyTableViewController else { return }
                        
                 destinationTVC.secDelegate = self
        }
    }
    
}

extension CurrencyViewController: SelectCurrencyDelegate {
    func selectFromCurrency(selectedFromCurrency: String) {
        self.selectedFromCurrency = selectedFromCurrency
/* What I tried:
    func selectToCurrency(selectedToCurrency: String) {
        self.selectedToCurrency = selectedToCurrency
         } */
    }
}
   
extension CurrencyViewController: SelectToCurrencyDelegate {
    func selectToCurrency(selectedToCurrency: String) {
        self.selectedToCurrency = selectedToCurrency
    }
}
        



