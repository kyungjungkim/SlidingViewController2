//
//  MainViewController.swift
//
//  Created by Kyungjung Kim on 26/11/2018.
//  Copyright © 2018 Kyungjung Kim. All rights reserved.
//


import UIKit


class MainViewController: UIViewController {        
        var upSwipeGesture: UISwipeGestureRecognizer
        upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeMenuUp))
        upSwipeGesture.direction = [ .up ]
        self.uivTopMenu.addGestureRecognizer(upSwipeGesture)
        
        // TopMenu(Hamburger)
        var tempFrame: CGRect = self.uivTopMenu.frame
        tempFrame.origin.x = 0.0
        tempFrame.origin.y = -(self.uivTopMenu.frame.size.height)
        tempFrame.size.width = self.uivTopMenu.frame.size.width
        tempFrame.size.height = self.uivTopMenu.frame.size.height
        self.uivTopMenu.frame = tempFrame
        
        self.view.addSubview(self.uivTopMenu)
        
        uivTopMenu.isHidden = true
}