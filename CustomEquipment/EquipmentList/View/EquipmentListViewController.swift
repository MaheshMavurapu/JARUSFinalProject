//
//  EquipmentListViewController.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import UIKit

protocol EquipmentListViewProtocol: class {
    var presenter: EquipmentListViewPresenterProtocol? { get set }
    func showEquipments(_ eachEquipments: [EachEquipment])
}

class EquipmentListViewController: UIViewController {

    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    let cellId = "TableViewCell"
    let cellIdTwo = "EquipmentTableCell"
    var expandedSectionHeaderNumber: Int = -1
    
    var presenter: EquipmentListViewPresenterProtocol?
    var eachEquipments: [EachEquipment] = []

    private var sectionIsExpanded = [false, false, false, false, false]
    private let numberOfActualRowsForSection = 1
    
    let operationQueue = OperationQueue()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        let blockOperation = BlockOperation {
            //
            OperationQueue.main.addOperation {
                self.setupTableView()
            }
        }
        operationQueue.addOperation(blockOperation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Choose Equipment"
        presenter?.viewDidLoad()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(EquipmentListTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(EquipmentTableViewCell.self, forCellReuseIdentifier: cellIdTwo)
    }
}

extension EquipmentListViewController: EquipmentListViewProtocol {
    func showEquipments(_ eachEquipments: [EachEquipment]){
        self.eachEquipments = eachEquipments
        if self.eachEquipments.count > 0 {
            DispatchQueue.main.async { [unowned self] in
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.tableView.reloadData()
            }
        }
    }
}

// TableView - Datasource and Delegate.
extension EquipmentListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.eachEquipments.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionIsExpanded[section] ? 1+numberOfActualRowsForSection : 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let status = sectionIsExpanded[indexPath.section]
        if indexPath.row != 0 && status {
            return 200.0
        } else {
            return 50.0
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EquipmentListTableViewCell
            let eachEquipment = self.eachEquipments[indexPath.section]
            cell.equipment = eachEquipment
            cell.checkUncheckStatus = true
            cell.rowNumber = indexPath.row
            cell.sectionNumber = indexPath.section
            cell.delegate = self
            if sectionIsExpanded[indexPath.section] {
                cell.setExpanded()
            } else {
                cell.setCollapsed()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdTwo, for: indexPath) as! EquipmentTableViewCell
            let eachEquipment = self.eachEquipments[indexPath.section]
            cell.equipment = eachEquipment
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showEquipmentDetail(forPost: self.eachEquipments[indexPath.row])
    }
}

// Button Action
extension EquipmentListViewController: EquipmentCellDelegate {
    func numberOfProductsSelected(cell: EquipmentListTableViewCell, row: Int, section: Int) {
        if row == 0 {
            sectionIsExpanded[section] = !sectionIsExpanded[section]
            tableView.reloadSections([section], with: .automatic)
        }
    }
}








