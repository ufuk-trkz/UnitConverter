//
//  TimeTableViewCell.swift
//  UnitConverter
//
//  Created by Ufuk Türközü on 08.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {

    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var factorLabel: UILabel!
    
    var time: Unit? {
        didSet {
            updateViews()
        }
    }
    
    let timeVC = TimeViewController()
    
    func updateViews() {
        
        guard let factor = time?.factor else { return }
        timeZoneLabel.text = time?.name
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
