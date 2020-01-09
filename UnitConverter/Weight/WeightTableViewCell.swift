//
//  WeightTableViewCell.swift
//  UnitConverter
//
//  Created by Ufuk Türközü on 08.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class WeightTableViewCell: UITableViewCell {

    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var factorLabel: UILabel!
    
    var weight: Unit? {
        didSet {
            updateViews()
        }
    }
    
    let weightVC = WeightViewController()
    
    func updateViews() {
        
        guard let factor = weight?.factor else { return }
        weightLabel.text = weight?.name
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
