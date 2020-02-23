//
//  HomeViewController.swift
//  DMLinkmanListDemo
//
//  Created by Gamin on 2020/2/21.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let navRightBut: UIButton = UIButton();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页";
        navRightBut.frame = CGRect(x: 0, y: 0, width: 88, height: 44);
        navRightBut.setTitle("联系人", for: .normal);
        navRightBut.setTitleColor(UIColor.blue, for: .normal);
        navRightBut.titleLabel?.font = UIFont.systemFont(ofSize: 15);
        navRightBut.tag = 290;
        navRightBut.addTarget(self, action: #selector(tapRightButtonAction(sender:)), for: .touchUpInside);
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navRightBut);
    }

    @objc func tapRightButtonAction(sender: UIButton) -> () {
        if (sender.tag == 290) {
            print("点击联系人按钮");
            let linkmamList = LinkmanListViewController();
            navigationController?.pushViewController(linkmamList, animated: true);
        }
    }
}
