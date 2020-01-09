//
//  CurrencyTableViewCell.swift
//  UnitConverter
//
//  Created by Ufuk Türközü on 08.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var factorLabel: UILabel!
    
    var currency: Unit? {
        didSet {
            updateViews()
        }
    }
    
    let currencyVC = CurrencyViewController()
       
    func updateViews() {
        
        guard let factor = currency?.factor else { return }
        currencyLabel.text = currency?.name
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
