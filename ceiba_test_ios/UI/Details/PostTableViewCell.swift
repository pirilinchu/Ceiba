//
//  PostTableViewCell.swift
//  ceiba_test_ios
//
//  Created by smendoza on 4/10/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    static let identifier = "PostTableViewCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var post: Post = Post()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }
    
    func updateUI() {
        nameLabel.text = post.title
        bodyLabel.text = post.body
    }
    
}
