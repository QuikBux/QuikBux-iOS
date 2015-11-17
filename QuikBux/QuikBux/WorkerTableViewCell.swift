//
//  WorkerTableViewCell.swift
//  QuikBux
//
//  Created by Kiran Kunigiri on 11/15/15.
//  Copyright © 2015 Kiran Kunigiri. All rights reserved.
//

import UIKit

class WorkerTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var workerNameLabel: UILabel!
    @IBOutlet weak var occupationsLabel: UILabel!    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        workerNameLabel.textColor = UIColor.blackColor()
        occupationsLabel.textColor = UIColor.blackColor()
        descriptionTextView.textColor = UIColor.blackColor()
        descriptionTextView.backgroundColor = UIColor.whiteColor()
        
        bgView.layer.backgroundColor = UIColor.whiteColor().CGColor
        bgView.layer.borderColor = UIColor.whiteColor().CGColor
        bgView.layer.borderWidth = 2
        bgView.layer.cornerRadius = 5
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
