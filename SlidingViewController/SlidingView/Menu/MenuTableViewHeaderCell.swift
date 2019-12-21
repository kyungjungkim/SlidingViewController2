//
//  MenuTableViewHeaderCell.swift
//  SlidingView
//
//  Created by Kyungjung Kim on 2019/11/04.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

import UIKit

class MenuTableViewHeaderCell: UITableViewCell {
    
    @IBOutlet weak var uilGreetings: UILabel!
    
    @IBAction func clickedButton(_ sender: UIButton) {
        
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
