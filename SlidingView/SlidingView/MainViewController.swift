//
//  MainViewController.swift
//  SlidingView
//
//  Created by Kyungjung Kim on 10/03/2019.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var isMenuOpen: Bool = false
    var menu: UITableView?
    var leftSwipeGesture: UISwipeGestureRecognizer?
    var cell: MenuTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menu = UITableView()
        menu!.dataSource = self
        menu!.delegate = self
        menu!.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        menu!.frame = CGRect(x: -(self.view.frame.width - 100.0), y: 20.0, width: self.view.frame.width - 100.0, height: self.view.frame.height - 20.0)
        menu!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        menu!.backgroundColor = UIColor.lightGray
        menu!.separatorStyle = .none
        self.view.addSubview(menu!)
        
        // UISwipeGesture
        leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: Selector(("swipeMenuClose")))
        leftSwipeGesture?.direction = .left
        menu!.addGestureRecognizer(leftSwipeGesture!)
    }
    
    @IBAction func menuOpenBtnClick(_ sender: Any) {
        if (isMenuOpen == false) {
            UIView.animate(withDuration: 0.5, animations: {
                self.menu!.frame = CGRect(x: 0.0, y: 20.0, width: self.view.frame.width - 100.0, height: self.view.frame.height - 20.0)
            }, completion: { finished in
                if (finished) {
                    self.cell!.uilGreetings.frame = CGRect(x: self.cell!.uilGreetings.frame.origin.x, y: self.cell!.uilGreetings.frame.origin.y - 20.0, width: self.cell!.uilGreetings.frame.width, height: self.cell!.uilGreetings.frame.height)
                    
                    self.isMenuOpen = true
                }
            })
        }
    }
    
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = (tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell)
 
        return cell!
    }
    
    
    func swipeMenuClose() {
        if (isMenuOpen == true) {
            UIView.animate(withDuration: 0.5, animations: {
                self.menu!.frame = CGRect(x: -(self.view.frame.width - 100.0), y: 20.0, width: self.view.frame.width - 100.0, height: self.view.frame.height - 20.0)
            }, completion: { finished in
                if (finished) {
                    self.cell!.uilGreetings.frame = CGRect(x: self.cell!.uilGreetings.frame.origin.x, y: self.cell!.uilGreetings.frame.origin.y + 20.0, width: self.cell!.uilGreetings.frame.width, height: self.cell!.uilGreetings.frame.height)
                    
                    self.isMenuOpen = false
                }
            })
        }
    }
}
