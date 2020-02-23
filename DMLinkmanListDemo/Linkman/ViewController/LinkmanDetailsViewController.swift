//
//  LinkmanDetailsViewController.swift
//  DMLinkmanListDemo
//
//  Created by Gamin on 2020/2/21.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

typealias CompleteBlock = (_ mark:Int) -> ();

class LinkmanDetailsViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!    
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var workText: UITextField!
    
    var listModel: LinkmanModel?;
    var jumpClick: CompleteBlock?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText?.text = listModel?.name;
        phoneText?.text = listModel?.phone;
        workText?.text = listModel?.work;
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    @IBAction func tapChangeAction(_ sender: Any) {
        listModel?.name = nameText.text;
        listModel?.phone = phoneText.text;
        listModel?.work = workText.text;
        jumpClick!(1);
        navigationController?.popViewController(animated: true);
    }
    
}
