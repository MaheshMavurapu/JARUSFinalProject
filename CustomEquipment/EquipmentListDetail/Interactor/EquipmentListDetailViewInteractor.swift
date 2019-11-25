//
//  EquipmentListDetailViewInteractor.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import Foundation
import UIKit

protocol EquipmentListDetailViewInteractorProtocol: class {
    var presenter: EquipmentListDetailViewPresenterProtocol? { get set }
    var entity: EquipmentListDetailViewEntityProtocol? { get set }
}

class EquipmentListDetailViewInteractor: EquipmentListDetailViewInteractorProtocol {
    
    weak var presenter: EquipmentListDetailViewPresenterProtocol?
    var entity: EquipmentListDetailViewEntityProtocol?
}
