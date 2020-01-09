//
//  DistanceTableViewCell.swift
//  UnitConverter
//
//  Created by Ufuk Türközü on 08.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class DistanceTableViewCell: UITableViewCell {

    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var factorLabel: UILabel!
    
    var distance: Unit? {
        didSet {
            updateViews()
        }
    }
    
    let distanceVC = DistanceViewController()
    
    func updateViews() {
        
        guard let factor = distance?.factor else { return }
        distanceLabel.text = distance?.name
        factorLabel.text = (String(describing: factor))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
