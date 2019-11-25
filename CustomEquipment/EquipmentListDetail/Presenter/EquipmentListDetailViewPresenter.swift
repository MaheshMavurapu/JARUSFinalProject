//
//  EquipmentListDetailViewPresenter.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import Foundation
import UIKit

protocol EquipmentListDetailViewPresenterProtocol: class {
    var view: EquipmentListDetailViewPrototocol? { get set }
    var interactor: EquipmentListDetailViewInteractorProtocol? { get set }
    var router: EquipmentListDetailViewRouterProtocol? { get set }
    
    var eachEquipment: EachEquipment? { get set }
    func viewDidLoad()
}

class EquipmentListDetailViewPresenter: EquipmentListDetailViewPresenterProtocol {
    
    weak var view: EquipmentListDetailViewPrototocol?
    var interactor: EquipmentListDetailViewInteractorProtocol?
    var router: EquipmentListDetailViewRouterProtocol?
    
    var eachEquipment: EachEquipment?
    
    func viewDidLoad() {
        view?.showEquipmentDetail(forEquipment: eachEquipment!)
    }
}
