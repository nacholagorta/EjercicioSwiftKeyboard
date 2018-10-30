//
//  SwitchTableViewCell.swift
//  FinalReplicarSettingsKeyboard
//
//  Created by IGNACIO OLAGORTA VERA on 24/10/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit

protocol SwitchCambioDelegate: class{
    func switchChangedAction(switchState: Bool) -> String
}

class SwitchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNumber: UILabel?
    weak var delegate: SwitchCambioDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func SwitchAction(sender: UISwitch){
        
   delegate?.switchChangedAction(switchState: sender.isOn)
       
}
}
