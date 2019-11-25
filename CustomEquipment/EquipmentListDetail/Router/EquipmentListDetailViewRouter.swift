//
//  EquipmentListDetailViewRouter.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import Foundation
import UIKit

protocol EquipmentListDetailViewRouterProtocol: class {
    static func createEquipmentListDetailViewController(forView: UIViewController?, forEquipment eachEquipment: EachEquipment) -> UIViewController
}

class EquipmentListDetailViewRouter: EquipmentListDetailViewRouterProtocol {
    
    class func createEquipmentListDetailViewController(forView: UIViewController?, forEquipment eachEquipment: EachEquipment) -> UIViewController {
        
        let view = EquipmentListDetailViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
        let interactor: EquipmentListDetailViewInteractorProtocol = EquipmentListDetailViewInteractor()
        let presenter: EquipmentListDetailViewPresenterProtocol = EquipmentListDetailViewPresenter()
        let entity: EquipmentListDetailViewEntityProtocol = EquipmentListDetailViewEntity()
        let router: EquipmentListDetailViewRouterProtocol = EquipmentListDetailViewRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.eachEquipment = eachEquipment // Data
        interactor.presenter = presenter
        interactor.entity = entity

        return view
    }
}
