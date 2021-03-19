//
//  CustomTableViewCell.swift
//  TestTaskCFT
//
//  Created by Станислав Сутурин on 16.03.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfTheNote: UILabel!
    @IBOutlet weak var date: UILabel!
    /*override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/
    
    /*class CheckBox: UIButton {
        // Images
        let checkedImage = UIImage(named: "checkedCheckbox")! as UIImage
        let uncheckedImage = UIImage(named: "uncheckedCheckbox")! as UIImage
        
        // Bool property
        var isChecked: Bool = false {
            didSet {
                if isChecked == true {
                    self.setImage(checkedImage, for: UIControl.State.normal)
                } else {
                    self.setImage(uncheckedImage, for: UIControl.State.normal)
                }
            }
        }
            
        override func awakeFromNib() {
            self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
            self.isChecked = false
        }
            
        @objc func buttonClicked(sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
        }
    }*/


}
