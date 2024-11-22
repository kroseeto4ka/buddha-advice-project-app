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
        buddhaDataManager?.getMarkedBuddhas().count ?? 0
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
        
        let buddha = (buddhaDataManager?.getMarkedBuddhas()[indexPath.row])!
        
        cell.selectionStyle = .none
        
        cell.action = { cell in
            if let indexPath = tableView.indexPath(for: cell) {
                if let buddha = self.buddhaDataManager?.getMarkedBuddhas()[indexPath.row]{
                    self.buddhaDataManager?.toggleMarked(buddha)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            }
        }
        
        cell.configure(buddha: buddha)
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        150
    }
}

//MARK: - Setup view
extension MarTableViewController {
    private func setupView() {
        tableView.register(CustomCellView.self, forCellReuseIdentifier: cellIdentifier)
        tableView.backgroundColor = .white
    }
}
