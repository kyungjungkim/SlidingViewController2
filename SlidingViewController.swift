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

func initWithArrayData(data: NSArray, cHeight: CGFloat, tHeightTableView: CGFloat, tPaddingTop: CGFloat, tPaddingLeft: CGFloat, tPaddingRight: CGFloat, rView: UIView, tAnimation: AnimationType, openDuration: CGFloat, closeDuration: CGFloat) -> (Any) {
        
        self.arrayData = data;
            
        self.heightOfCell = cHeight;
            
        self.refView = rView;
            
        self.paddingTop = tPaddingTop;
            
        self.paddingLeft = tPaddingLeft;
            
        self.paddingRight = tPaddingRight;
            
        self.heightTableView = tHeightTableView;
            
        self.open = openDuration;
            
        self.close = closeDuration;
            
        let refFrame: CGRect = refView!.frame;
        
        var frame: CGRect = self.view.frame
        frame.origin.x = refFrame.origin.x - paddingLeft
        frame.origin.y = refFrame.origin.y + refFrame.size.height + paddingTop
        frame.size.width = refFrame.size.width + paddingRight
        frame.size.height = heightTableView
        self.view.frame = frame
            
        type = tAnimation;
            
        return SlidingViewController()
    }

class SlidingViewController: UIViewController {
    
    var uiTableView: UITableView?
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
    
    
}
