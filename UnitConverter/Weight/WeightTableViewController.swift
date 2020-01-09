//
//  WeightTableViewController.swift
//  UnitConverter
//
//  Created by Ufuk Türközü on 07.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class WeightTableViewController: UITableViewController {
    
    let weightVC = WeightViewController()
    var delegate: SelectFromWeightDelegate?
    var secDelegate: SelectToWeightDelegate?

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
        
        return weightVC.weights.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeightCell", for: indexPath) as? WeightTableViewCell else { return UITableViewCell() }
        
        // Configure the cell...
        let weight = weightVC.weights[indexPath.row]
               
        cell.weight = weight

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCell = weightVC.weights[indexPath.row]
        
        delegate?.selectFromWeight(selectedFromWeight: currentCell.name!)
        secDelegate?.selectToWeight(selectedToWeight: currentCell.name!)
    }
}
