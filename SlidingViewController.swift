//
//  SlidingView.swift
//  exercise
//
//  Created by Kyungjung Kim on 12/11/2018.
//  Copyright © 2018 Kyungjung Kim. All rights reserved.
//

import UIKit

enum AnimationType {
    case BLENDIN
    case GROW
    case BOTH
}

protocol SlidingViewDelegate {
    func SlidingCellSelected(returnIndex: NSInteger) -> ()
}

class SlidingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var uiTableView: UITableView!
    var heightTableView: CGFloat = 0.0
    var arrayData: NSArray = []
    var heightOfCell: CGFloat = 0.0
    var refView: UIView?
    var paddingLeft: CGFloat = 0.0
    var paddingRight: CGFloat = 0.0
    var paddingTop: CGFloat = 0.0
    var open: CGFloat = 0.0
    var close: CGFloat = 0.0
    var delegate: SlidingViewDelegate?
    var type: AnimationType?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
     // UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfCell;
    }
    
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.textAlignment = NSTextAlignment.left
        cell.textLabel!.text = arrayData.object(at: indexPath.row) as? String
        
        return cell
    }
}
