//
//  EquipmentListDetailViewController.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import UIKit

protocol EquipmentListDetailViewPrototocol: class {
    var presenter: EquipmentListDetailViewPresenterProtocol? { get set }
    func showEquipmentDetail(forEquipment equipment: EachEquipment)
}

class EquipmentListDetailViewController: UIViewController {

    var presenter: EquipmentListDetailViewPresenterProtocol?
    
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    let cellId = "TableViewCell"
    let operationQueue = OperationQueue()
    
    var equipment: EachEquipment? {
        didSet {
            productTitleLabel.text = equipment?.vin
            productCreatedAtLabel.text = equipment?.make
        }
    }
    
    private let productTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let productCreatedAtLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
        
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
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(EquipmentTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Equipment Details"
        presenter?.viewDidLoad()
    }
}

extension EquipmentListDetailViewController: EquipmentListDetailViewPrototocol {
    func showEquipmentDetail(forEquipment equipment: EachEquipment) {
        self.equipment = equipment
        DispatchQueue.main.async { [unowned self] in
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.reloadData()
        }
    }
}

// TableView - Datasource and Delegate.
extension EquipmentListDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EquipmentTableViewCell
        cell.equipment = self.equipment
        return cell
    }
}

