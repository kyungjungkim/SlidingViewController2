//
//  MenuTableViewCell.swift
//  SlidingView
//
//  Created by Kyungjung Kim on 10/03/2019.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var uilGreetings: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
