//
//  DistanceTableViewController.swift
//  UnitConverter
//
//  Created by Ufuk Türközü on 07.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class DistanceTableViewController: UITableViewController {
    
    let distanceVC = DistanceViewController()
    var delegate: SelectDistanceDelegate?
    var secDelegate: SelectToDistanceDelegate?

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

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return distanceVC.distances.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DistanceCell", for: indexPath) as? DistanceTableViewCell else { return UITableViewCell() }

        // Configure the cell...
        let distance = distanceVC.distances[indexPath.row]
        
        cell.distance = distance

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentCell = distanceVC.distances[indexPath.row]
        
        delegate?.selectFromDistance(selectedFromDistance: currentCell.name!)
        secDelegate?.selectToDistance(selectedToDistance: currentCell.name!)
    }
}
