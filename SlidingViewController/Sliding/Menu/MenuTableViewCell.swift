//
//  MenuTableViewCell.swift
//  SlidingView
//
//  Created by Kyungjung Kim on 10/03/2019.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate {
    func clickedBtnCheckWithTag(tag: Int) -> Void
}

class MenuTableViewCell: UITableViewCell {

    var delegate: TableViewCellDelegate!
    
    @IBOutlet weak var uilGreetings: UILabel!
    @IBOutlet weak var uiBCheck: UIButton!
    
    @IBAction func clickedBtnCheck(_ sender: UIButton) {
        self.delegate.clickedBtnCheckWithTag(tag: self.tag)
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
