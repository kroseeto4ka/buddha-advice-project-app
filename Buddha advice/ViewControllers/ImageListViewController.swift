//
//  ImageList.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 06.11.2024.
//

import UIKit

class ImageListViewController: UIViewController {
    var buddhaDataManager: IBuddha?
    
    let tableView = UITableView()
    private let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension ImageListViewController {
    func setupView() {
        view.backgroundColor = .red
        
        view.addSubview(tableView)
        setupTableView()
        setupLayout()
    }
    
    func setupTableView() {
        tableView.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

//MARK: - Setup Layout
extension ImageListViewController {
    func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource
extension ImageListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        buddhaDataManager?.getBuddhas().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let buddha = buddhaDataManager?.getBuddhas()[indexPath.row]
        let monkImage = UIImage(named: buddha?.imageName ?? "")
        
        if buddha?.isMark == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = buddha?.imageName
        configuration.image = monkImage
        
        cell.contentConfiguration = configuration
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ImageListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        100
    }
    
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Delete"
        ) { (_, _, completionHandler) in
            self.buddhaDataManager?.removeBuddha(index: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true)
        }
        
        let markAction = UIContextualAction(
            style: .destructive,
            title: "Mark"
        ) { (_, _, completionHandler) in
            self.buddhaDataManager?.changeMark(index: indexPath.row)
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = .red
        
        markAction.backgroundColor = .black
        
        let configuration = UISwipeActionsConfiguration(actions: [
            deleteAction,
            markAction
            ])
        return configuration
    }
}
