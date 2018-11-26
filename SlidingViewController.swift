//
//  SlidingView.swift
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
        return heightOfCell
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
        return arrayData.count
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
        self.view.isHidden = false
        
        UIView.animate(withDuration: TimeInterval(open), delay: TimeInterval(0), options: [.curveLinear], animations: {
            UIView.setAnimationRepeatCount(Float(1.0))
        }, completion: { finished in
            if (self.type == AnimationType.BOTH || self.type == AnimationType.GROW) {
                var tempFrame: CGRect = self.uiTableView.frame
                tempFrame.origin.x = self.uiTableView.frame.origin.x
                tempFrame.origin.y = self.uiTableView.frame.origin.y
                tempFrame.size.width = self.uiTableView.frame.size.width
                tempFrame.size.height = self.heightTableView
            }
            
            if (self.type == AnimationType.BOTH || self.type == AnimationType.BLENDIN) {
                self.view.alpha = 1;
            }
        })
    }
    
    func closeAnimation() -> () {
        UIView.animate(withDuration: TimeInterval(close), delay: TimeInterval(0), options: [.curveLinear], animations: {
            UIView.setAnimationRepeatCount(Float(1.0))
        }, completion: { finished in
            if (self.type == AnimationType.BOTH || self.type == AnimationType.GROW) {
                var tempFrame: CGRect = self.uiTableView.frame
                tempFrame.origin.x = self.uiTableView.frame.origin.x
                tempFrame.origin.y = self.uiTableView.frame.origin.y
                tempFrame.size.width = self.uiTableView.frame.size.width
                tempFrame.size.height = self.heightTableView
                
                self.uiTableView.frame = tempFrame
            }
            
            if (self.type == AnimationType.BOTH || self.type == AnimationType.BLENDIN) {
                self.view.alpha = 0;
            }
            
            self.perform(#selector(self.hideView), with: nil, afterDelay: TimeInterval(self.close))
        })
    }
    
    @objc func hideView() -> () {
        self.view.isHidden = true
    }
}
