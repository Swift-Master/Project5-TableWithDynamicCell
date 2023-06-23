//
//  WorkListTableViewCell.swift
//  Project5-TableWithDynamicCell
//
//  Created by 편성경 on 2023/06/21.
//

import UIKit

class WorkListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var workImageView: UIImageView!
    @IBOutlet weak var workNameLabel: UILabel!
    @IBOutlet weak var workInfoLabel: UILabel! {
        didSet {
            workInfoLabel.isHidden = true
        }
    }
    @IBOutlet weak var selectInfoLabel: UILabel! {
        didSet {
            selectInfoLabel.isHidden = false
        }
    }
}
