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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.SlidingCellSelected(returnIndex: indexPath.row)
        
        self.closeAnimation()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return ""
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
    
    
    // SlidingViewDelegate Methods
    
    func SlidngViewCellSelected(returnIndex: NSInteger) -> () {
    
    }
    
    
    // Methods
    
    func openAnimation() -> () {

    }
    
    func closeAnimation() -> () {
        UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveLinear], animations: {
            UIView.setAnimationDuration(TimeInterval(self.close))
            UIView.setAnimationRepeatCount(Float(1.0))
            UIView.setAnimationDelay(TimeInterval(0))
        }, completion: { finished in
            
        })
        
        if (type == AnimationType.BOTH || type == AnimationType.GROW) {
            var tempFrame: CGRect = self.uiTableView.frame
            tempFrame.origin.x = uiTableView.frame.origin.x
            tempFrame.origin.y = uiTableView.frame.origin.y
            tempFrame.size.width = uiTableView.frame.size.width
            tempFrame.size.height = heightTableView
            
            self.uiTableView.frame = tempFrame
        }
        
        if (type == AnimationType.BOTH || type == AnimationType.BLENDIN) {
            self.view.alpha = 0;
        }
        
        self.perform(#selector(hideView), with: nil, afterDelay: TimeInterval(close))
    }
    
    @objc func hideView() -> () {
        self.view.isHidden = true
    }
}
