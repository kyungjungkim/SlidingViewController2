//
//  MainViewController.swift
//  SlidingView
//
//  Created by Kyungjung Kim on 10/03/2019.
//  Copyright © 2019 Kyungjung Kim. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderViewCellDelegate, TableViewCellDelegate {
    var isMenuOpen: Bool = false
    var menu: UITableView?
    var leftSwipeGesture: UISwipeGestureRecognizer?
    var cell: MenuTableViewHeaderViewController?
    var cell1: MenuTableViewCell?
    var isAll1: Bool = false
    var isAll1Clicked: Bool = true
    var clickedSectionNum: Int = 0
    var m_tag: Int = 0
    
    
    @IBOutlet weak var uiScrollView: UIScrollView!
    @IBOutlet weak var uiTableView1: UITableView!
    @IBOutlet weak var uiTableView2: UITableView!
    @IBOutlet weak var uiTableView3: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menu = UITableView()
        menu!.dataSource = self
        menu!.delegate = self
        menu!.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
        menu!.frame = CGRect(x: -(self.view.frame.width - 100.0), y: 30.0, width: self.view.frame.width - 100.0, height: self.view.frame.height - 30.0)
        menu!.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        menu!.backgroundColor = UIColor.lightGray
        menu!.separatorStyle = .singleLine
        self.view.addSubview(menu!)
        
        // UISwipeGesture
        leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeMenuClose))
        leftSwipeGesture!.direction = .left
        menu!.addGestureRecognizer(leftSwipeGesture!)
        
        
        uiScrollView.contentSize = CGSize(width: uiScrollView.frame.width * 3, height: uiScrollView.frame.height);
        
        uiTableView1.frame.origin.x = 0
        uiTableView1.frame.origin.y = 0
        uiTableView1.frame.size.width = uiScrollView.frame.size.width
        uiTableView1.frame.size.height = uiScrollView.frame.size.height
        
        uiTableView2.frame.origin.x = uiScrollView.frame.size.width
        uiTableView2.frame.origin.y = 0
        uiTableView2.frame.size.width = uiScrollView.frame.size.width
        uiTableView2.frame.size.height = uiScrollView.frame.size.height
        
        uiTableView3.frame.origin.x = uiScrollView.frame.size.width * 2
        uiTableView3.frame.origin.y = 0
        uiTableView3.frame.size.width = uiScrollView.frame.size.width
        uiTableView3.frame.size.height = uiScrollView.frame.size.height
    }
    
    @IBAction func menuOpenBtnClick(_ sender: Any) {
        if (isMenuOpen == false) {
            UIView.animate(withDuration: 0.8, animations: {
                self.menu!.frame = CGRect(x: 0.0, y: 30.0, width: self.view.frame.width - 100.0, height: self.view.frame.height - 30.0)
            }, completion: { finished in
                if (finished) {
                    self.cell!.uiBtnAll.frame = CGRect(x: self.cell!.uiBtnAll.frame.origin.x, y: self.cell!.uiBtnAll.frame.origin.y - 10.0, width: self.cell!.uiBtnAll.frame.width, height: self.cell!.uiBtnAll.frame.height)
                    
                    self.isMenuOpen = true
                }
            })
        }
    }
    
    @objc func swipeMenuClose() {
        if (isMenuOpen == true) {
            UIView.animate(withDuration: 0.8, animations: {
                self.menu!.frame = CGRect(x: -(self.view.frame.width - 100.0), y: 30.0, width: self.view.frame.width - 100.0, height: self.view.frame.height - 30.0)
            }, completion: { finished in
                if (finished) {
                    self.cell!.uiBtnAll.frame = CGRect(x: self.cell!.uiBtnAll.frame.origin.x, y: self.cell!.uiBtnAll.frame.origin.y + 10.0, width: self.cell!.uiBtnAll.frame.width, height: self.cell!.uiBtnAll.frame.height)
                    
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
        cell = MenuTableViewHeaderViewController()
        cell!.delegate = self
        
        return cell!.view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell1 = (tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell)
        cell1!.delegate = self
        cell1!.tag = indexPath.row
        
        if (1 <= indexPath.row) {
            cell1!.uilGreetings.text = ""
        }
        
        if (isAll1Clicked && clickedSectionNum == 0) { // 전체버튼 클릭
            if (isAll1) { // 선택.
                // [cell1 setSelected:YES animated:YES];
                cell1!.uiBCheck.titleLabel!.text = "ON"
                
                //if (indexPath.row == [sectionData count] - 1)   // 마지막 셀
                    //isAll1Clicked = NO;
                
                menu!.layoutIfNeeded()
            } else if (!isAll1) { // 해제.
                //[cell1 setSelected:NO animated:YES];
                cell1!.uiBCheck.titleLabel!.text = "OFF"
                
                
                menu!.layoutIfNeeded()
            }
        } else {
            if (m_tag == indexPath.row) {
                if (cell1!.uiBCheck.titleLabel!.text! == "OFF") {
                    cell1!.uiBCheck.setTitle("ON", for: UIControl.State.normal)
                    cell1!.uiBCheck.setTitle("ON", for: UIControl.State.highlighted)
                    cell1!.uiBCheck.setTitle("ON", for: UIControl.State.selected)
                    
                    menu!.layoutIfNeeded()
                } else {
                    cell1!.uiBCheck.setTitle("OFF", for: UIControl.State.normal)
                    cell1!.uiBCheck.setTitle("OFF", for: UIControl.State.highlighted)
                    cell1!.uiBCheck.setTitle("OFF", for: UIControl.State.selected)
                    
                    menu!.layoutIfNeeded()
                }
            }
        }
        
        return cell1!
    }
    
    func clickedBtnAll() {
        isAll1 = !isAll1
        
        isAll1Clicked = true
        clickedSectionNum = 0
        
        menu!.reloadData()
    }
    
    func clickedBtnCheckWithTag(tag: Int) {
        print("tag: %ld", tag);
        
        isAll1Clicked = false
        m_tag = tag
        
        menu!.reloadData()
    }
}
