//
//  EquipmentListViewInteractor.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import Foundation
import UIKit

protocol EquipmentListViewInteractorProtocol: class {
    var presenter: EquipmentListViewPresenterProtocol? { get set }
    var entity: EquipmentListViewEntityProtocol? { get set }
    
    func retrieveEquipmentList()
    func onEquipmentsRetrieved(_ equipments: [EachEquipment])
}

class EquipmentListViewInteractor: EquipmentListViewInteractorProtocol {
    weak var presenter: EquipmentListViewPresenterProtocol?
    var entity: EquipmentListViewEntityProtocol?
    
    let operationQueue = OperationQueue()
    
    func retrieveEquipmentList() {
        do {
            if let equipmentList = try entity?.retrievePostList() {
                if  equipmentList.isEmpty {
                    self.retrieveEquipments() // Fetch posts.
                } else {
                   presenter?.didRetrieveEquipments(equipmentList)
                }
            } else {
                self.retrieveEquipments() // Fetch posts.
            }
        } catch {
            presenter?.didRetrieveEquipments([])
        }
    }
    
    func retrieveEquipments() {
        do {
            if let file = Bundle.main.url(forResource: "assignment", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let decoder = JSONDecoder()
                let posts = try decoder.decode([EachEquipment].self, from:
                    data) //Decode JSON Response Data
                self.onEquipmentsRetrieved(posts)
                print(posts)
            }
        } catch {
            self.presenter?.didRetrieveEquipments([])
            print(error.localizedDescription)
        }
    }
    
    func onEquipmentsRetrieved(_ equipments: [EachEquipment]) {
        // Show to Table accoringly
        presenter?.didRetrieveEachEquipments(equipments)
        // Save to DB
        do {
            try self.entity?.saveEquipments(equipments)
        } catch {
            print("Error")
        }
    }
}
