//
//  UserTblCell.swift
//  Aync-Await-API-Call
//
//  Created by Arvind kumar Singh on 08/04/25.
//

import UIKit

class UserTblCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCell(user: UserModel){
        name.text = user.name
        email.text = user.email 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
