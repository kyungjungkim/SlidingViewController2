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
    var cell: MenuTableViewHeaderCell?
    var cell1: MenuTableViewCell?
    var isAll1: Bool = false
    var isAll1Clicked: Bool = false
    var clickedSectionNum: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menu = UITableView()
        menu!.dataSource = self
        menu!.delegate = self
        menu!.register(UINib(nibName: "MenuTableViewHeaderCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewHeaderCell")
        menu!.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        menu!.frame = CGRect(x: -(self.view.frame.width - 100.0), y: 20.0, width: self.view.frame.width - 100.0, height: self.view.frame.height - 20.0)
        menu!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        menu!.backgroundColor = UIColor.lightGray
        menu!.separatorStyle = .singleLine
        self.view.addSubview(menu!)
        
        // UISwipeGesture
        leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: Selector(("swipeMenuClose")))
        leftSwipeGesture?.direction = .left
        menu!.addGestureRecognizer(leftSwipeGesture!)
    }
    
    @IBAction func menuOpenBtnClick(_ sender: Any) {
        if (isMenuOpen == false) {
            UIView.animate(withDuration: 0.5, animations: {
                self.menu!.frame = CGRect(x: 0.0, y: 30.0, width: self.view.frame.width - 100.0, height: self.view.frame.height - 20.0)
            }, completion: { finished in
                if (finished) {
                    self.cell!.uilGreetings.frame = CGRect(x: self.cell!.uilGreetings.frame.origin.x, y: self.cell!.uilGreetings.frame.origin.y - 20.0, width: self.cell!.uilGreetings.frame.width, height: self.cell!.uilGreetings.frame.height)
                    
                    self.isMenuOpen = true
                }
            })
        }
    }
    
    func swipeMenuClose() {
        if (isMenuOpen == true) {
            UIView.animate(withDuration: 0.5, animations: {
                self.menu!.frame = CGRect(x: -(self.view.frame.width - 100.0), y: 30.0, width: self.view.frame.width - 100.0, height: self.view.frame.height - 20.0)
            }, completion: { finished in
                if (finished) {
                    self.cell!.uilGreetings.frame = CGRect(x: self.cell!.uilGreetings.frame.origin.x, y: self.cell!.uilGreetings.frame.origin.y + 20.0, width: self.cell!.uilGreetings.frame.width, height: self.cell!.uilGreetings.frame.height)
                    
                    self.isMenuOpen = false
                }
            })
        }
    }
    
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        cell = (tableView.dequeueReusableCell(withIdentifier: "MenuTableViewHeaderCell") as! MenuTableViewHeaderCell)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell1 = (tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell)
 
        if (1 <= indexPath.row) {
            cell1?.uilGreetings.text = ""
        }
        /*
        if (isAll1Clicked && clickedSectionNum == 0) { // 전체버튼 클릭
            if (isAll1) { // 선택.
                [cell setSelected:YES animated:YES];
                [selectedName addObject:cell.nameLbl.text];
                [[isSectionSelected objectForKey:[NSNumber numberWithLong:indexPath.section]] isEqualToString:@"YES"];
                
                if (indexPath.row == [sectionData count] - 1)   // 마지막 셀
                    isAll1Clicked = NO;
                
                [menu layoutIfNeeded];
                
                return cell;
            } else if (!isAll1) { // 해제.
                [cell setSelected:NO animated:YES];
                [selectedName removeObjectAtIndex:indexPath.row];
                
                [[isSectionSelected objectForKey:[NSNumber numberWithLong:indexPath.section]] isEqualToString:@"NO"];
                
                if (indexPath.row == [sectionData count] - 1)   // 마지막 셀
                    isAll1Clicked = NO;
                
                [menu layoutIfNeeded];
            }
        }
    */
        
        return cell1!
    }
}
