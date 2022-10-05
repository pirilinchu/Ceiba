//
//  HomeViewController.swift
//  ceiba_test_ios
//
//  Created by smendoza on 4/10/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    private var searchText: String?
    private var users: [User] {
        if let searchText = searchText {
            return UsersManager.shared.getUsers.filter({ $0.name.contains(searchText)})
        }
        return UsersManager.shared.getUsers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchBar()
        fillData()
    }
    
    @objc private func fillData() {
        UsersManager.shared.getUsers { _ in
            self.tableView.reloadData()
        } failure: { error in
            print("Error")
        }
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = Bundle.main.loadNibNamed(UserTableViewCell.identifier, owner: self, options: nil)?.first as? UserTableViewCell else {
            return UserTableViewCell()
        }
        cell.user = users[indexPath.row]
        cell.setupUI()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText.isEmpty ? nil : searchText
        self.tableView.reloadData()
    }
}
