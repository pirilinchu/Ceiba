//
//  UserTableViewCell.swift
//  ceiba_test_ios
//
//  Created by smendoza on 4/10/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    static let identifier = "UserTableViewCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var user: User = User()
    var onButtonTap: ((User) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUI() {
        nameLabel.text = user.name
        mailLabel.text = user.email
        phoneLabel.text = user.phone
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        onButtonTap?(user)
    }
}
