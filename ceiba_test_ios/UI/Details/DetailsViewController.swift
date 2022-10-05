//
//  DetailsViewController.swift
//  ceiba_test_ios
//
//  Created by smendoza on 4/10/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
 
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var postsView: UIView!
    
    @IBOutlet weak var postsTableView: UITableView!
    
    var user: User = User()

    var posts: [Post] {
        UsersManager.shared.getPostsForUser(user: user)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillData()
        updateUI()
    }
    
    private func getData() {
        UsersManager.shared.getPostsForUser(user: user) { _ in
            self.postsTableView.reloadData()
        } failure: { error in
            print("error")
        }
    }
    
    private func setupTableView() {
        postsTableView.delegate = self
        postsTableView.dataSource = self
    }
    
    private func fillData() {
        emailLabel.text = user.email
        titleLabel.text = user.name
        phoneLabel.text = user.phone
    }
    
    private func updateUI() {
        infoView.layer.cornerRadius = 10
        postsView.layer.cornerRadius = 10
        
        view.backgroundColor = .backgroundColor
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Bundle.main.loadNibNamed(PostTableViewCell.identifier, owner: self, options: nil)?.first as? PostTableViewCell else {
            return PostTableViewCell()
        }
        cell.post = posts[indexPath.row]
        cell.updateUI()
        cell.selectionStyle = .none
        return cell
    }
}

extension UIColor {
    static let backgroundColor = UIColor(named: "BackgroundColor")
}
