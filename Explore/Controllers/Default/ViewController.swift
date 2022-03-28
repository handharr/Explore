//
//  ViewController.swift
//  Explore
//
//  Created by MEKARI on 27/03/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - PROPERTIES
    //MARK: IBOUTLET
    @IBOutlet weak var tableView: UITableView!
    // MARK: VIEWS
    private let headerView: HeaderPrimary = {
        let header = HeaderPrimary.loadFromNib()
        return header
    }()
    // MARK: DATA
    private var itemList: [Item] = {
        // - Load Data from JSON
        guard let url = Bundle.main.url(forResource: "ItemsSample", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decodedData = try? JSONDecoder().decode([Item].self, from: data)
        else {
            return []
        }
        return decodedData
    }()
    
    // MARK: - LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // - Get Data from Server
        fetchData()
    }
    
    // MARK: - UI SETUP METHODS
    private func setupTableView() {
        // - Table View Delegation
        tableView.delegate = self
        tableView.dataSource = self
        // - Table View Registration
        tableView.registerCell(DefaultPrimaryTableViewCell.self)
        // - Setup Header
        headerView.delegate = self
        tableView.tableHeaderView = headerView
    }
    
    // MARK: - NETWORKING METHODS
    private func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
            self?.headerView.setupUI(
                title: "Oliver Sykes",
                subtitle: "BMTH",
                description: "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet"
            )
        }
    }
}

// MARK: - UITABLEVIEW EXTENSION
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(DefaultPrimaryTableViewCell.self, indexPath: indexPath)
        let model = itemList[indexPath.row]
        cell.titleLabel.text = model.name
        cell.subtitleLabel.text = model.label
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
}

// MARK: HEADER DELEGATE
extension ViewController: HeaderPrimaryDelegate {
    func updateHeight(height: CGFloat) {
        self.headerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: height)
        self.tableView.reloadData()
    }
}
