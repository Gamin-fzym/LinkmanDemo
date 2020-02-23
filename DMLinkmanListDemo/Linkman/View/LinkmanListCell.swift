//
//  LinkmanListCell.swift
//  DMLinkmanListDemo
//
//  Created by Gamin on 2020/2/21.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

class LinkmanListCell: UITableViewCell {

    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var phoneLab: UILabel!
    @IBOutlet weak var workLab: UILabel!
    
    var cellModel: LinkmanModel? {
        didSet {
            nameLab.text = cellModel?.name;
            phoneLab.text = cellModel?.phone;
            workLab.text = cellModel?.work;
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
