//
//  EquipmentListViewPresenter.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import Foundation
import UIKit

protocol EquipmentListViewPresenterProtocol: class {
    var view: EquipmentListViewProtocol? { get set }
    var interactor: EquipmentListViewInteractorProtocol? { get set }
    var router: EquipmentListViewRouterProtocol? { get set }
    
    func viewDidLoad()
    func didRetrieveEachEquipments(_ hits: [EachEquipment])
    func didRetrieveEquipments(_ posts: [Equipment])
    func showEquipmentDetail(forPost: EachEquipment)
}

class EquipmentListViewPresenter: EquipmentListViewPresenterProtocol {
    
    weak var view: EquipmentListViewProtocol?
    var interactor: EquipmentListViewInteractorProtocol?
    var router: EquipmentListViewRouterProtocol?
    
    func viewDidLoad() {
        interactor?.retrieveEquipmentList()
    }
    
    func didRetrieveEachEquipments(_ hits: [EachEquipment]) {
        view?.showEquipments(hits)
    }
    
    func didRetrieveEquipments(_ posts: [Equipment]) {
        mapEachEquipmentsFromEquipments(posts)
    }
    
    func mapEachEquipmentsFromEquipments(_ equipmentsList: [Equipment]) {
        let eachEquipmentList = equipmentsList.map() {
            return EachEquipment(id: Int($0.id), vin: $0.vin!, year: Int($0.year), make: $0.make!, value: Double($0.value), length: Double($0.length))
        }
        view?.showEquipments(eachEquipmentList)
    }
    
    func showEquipmentDetail(forPost forEachEquipment: EachEquipment) {
        router?.presentListDetailScreen(from: view!, forEquipment: forEachEquipment)
    }
}
