//
//  MarTableViewController.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 08.11.2024.
//
import UIKit

class MarTableViewController: UITableViewController {
    var buddhaDataManager: IBuddha?
    private let cellIdentifier = "cellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        buddhaDataManager?.getBuddhas().count ?? 0
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? CustomCellView else {
            return UITableViewCell()
        }
        
        let buddha = (buddhaDataManager?.getBuddhas()[indexPath.row])!
        
        cell.configure(buddha: buddha)
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.buddhaDataManager?.changeMark(index: indexPath.row)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

//MARK: - Setup view
extension MarTableViewController {
    private func setupView() {
        tableView.register(CustomCellView.self, forCellReuseIdentifier: cellIdentifier)
        tableView.backgroundColor = .white
    }
}
