//
//  SideMenuViewController.swift
//  WeatherApp
//
//  Created by Valentyn Kashkalda on 25.12.2023.
//

import SnapKit

class SideDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()

    var source: [WeatherTableSectionModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.addBlurEffect(alpha: 0.3)
        view.backgroundColor = .clear
        setupTableView()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = source[indexPath.row].items
        switch item {
        case .sunrise(let value):
            cell.textLabel?.text = "Sunrise\n\(value)"
        case .sunset(let value):
            cell.textLabel?.text = "Sunset\n\(value)"
        case .moonrise(let value):
            cell.textLabel?.text = "Moonrise\n\(value)"
        case .moonset(let value):
            cell.textLabel?.text = "Moonset\n\(value)"
        }
        
        cell.textLabel?.numberOfLines = 0
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
}


