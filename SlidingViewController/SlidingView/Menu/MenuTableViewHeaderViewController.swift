//
//  MenuTableViewHeaderViewController.swift
//  SlidingView
//
//  Created by Kyungjung Kim on 2020/03/10.
//  Copyright © 2020 prosoft. All rights reserved.
//

import UIKit


protocol HeaderViewCellDelegate {
    func clickedBtnAll() -> Void
}

class MenuTableViewHeaderViewController: UIViewController {
    
    var delegate: HeaderViewCellDelegate!
    
    @IBOutlet weak var uiBtnAll: UIButton!
    
    @IBAction func clickedBtnAll(_ sender: UIButton) {
        self.delegate.clickedBtnAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
