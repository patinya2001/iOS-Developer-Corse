//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by ปฏิญญา จารุอริยานนท์ on 15/5/2567 BE.
//

import UIKit

//MARK: - Main
class AccountSummaryViewController: UIViewController {
    
    let profileManager = ProfileManager()
    let accountManager = AccountManager()
    
    var accounts: [AccountModel] = []
    
    var tableView = UITableView()
    let headerView = AccountSummaryHeaderView()
    
    lazy var logoutBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}


//MARK: - Setup
extension AccountSummaryViewController {
    private func setup() {
        view.backgroundColor = .systemTeal
        setupNavigationBar()
        setupTableView()
        setupTableHeaderView()
        fetchDataAndLoadViews()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButtonItem
    }
    
    private func setupTableView() {
        tableView.backgroundColor = .systemTeal
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupTableHeaderView() {
        var size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        headerView.frame.size = size
        tableView.tableHeaderView = headerView
    }
    
    
}


//MARK: - UITableViewDataSource
extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        cell.configure(with: accounts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}


//MARK: - UITableViewDelegate
extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


//MARK: - Action
extension AccountSummaryViewController {
    @objc func logoutTapped(sender: UIButton) {
        NotificationCenter.default.post(name: .login, object: nil)
    }
}


// MARK: - Networking
extension AccountSummaryViewController {
    private func fetchDataAndLoadViews() {
        let group = DispatchGroup()
        
        group.enter()
        profileManager.fetchProfile(forUserId: "1") { result in
            switch result {
            case .success(let profile):
                self.configureTableHeaderView(with: profile)
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        
        group.enter()
        accountManager.fetchAccounts(forUserId: "1") { result in
            switch result {
            case .success(let accounts):
                self.configureTableCells(with: accounts)
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    private func configureTableHeaderView(with profile: Profile) {
        let profileModel = ProfileModel(welcomeMessage: "Good morning,",
                                        name: profile.firstName,
                                        date: Date())
        self.headerView.configure(profileModel: profileModel)
    }
    
    private func configureTableCells(with accounts: [Account]) {
        self.accounts = accounts.map {
            AccountModel(accountType: $0.type, accountName: $0.name, balance: $0.amount)
        }
    }
}
