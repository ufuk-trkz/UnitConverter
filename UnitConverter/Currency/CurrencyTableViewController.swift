//
//  CurrencyTableViewController.swift
//  UnitConverter
//
//  Created by Ufuk Türközü on 07.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class CurrencyTableViewController: UITableViewController {

    let currencyVC = CurrencyViewController()
    var delegate: SelectCurrencyDelegate?
    var secDelegate: SelectToCurrencyDelegate?
    
    @IBAction func cancelTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currencyVC.currencys.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as? CurrencyTableViewCell else { return UITableViewCell() }

        // Configure the cell...
        let currency = currencyVC.currencys[indexPath.row]
        
        cell.currency = currency

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCell = currencyVC.currencys[indexPath.row]
        
        delegate?.selectFromCurrency(selectedFromCurrency: currentCell.name!)
        
        secDelegate?.selectToCurrency(selectedToCurrency: currentCell.name!)
    }

}
    

