//
//  EquipmentListViewRouter.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import Foundation
import UIKit

protocol EquipmentListViewRouterProtocol: class {
    static func createEquipmentListViewController() -> UIViewController
    func presentListDetailScreen(from view: EquipmentListViewProtocol, forEquipment eachEquipment: EachEquipment)
}

class EquipmentListViewRouter: EquipmentListViewRouterProtocol {
    
    class func createEquipmentListViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let equipmentListViewController = EquipmentListViewController(nibName: nil, bundle: nil) //ViewController = Name of your controller
        navigationController.viewControllers = [equipmentListViewController]
        if let view = navigationController.children.first as? EquipmentListViewController {
            
            let presenter: EquipmentListViewPresenterProtocol = EquipmentListViewPresenter()
            let interactor: EquipmentListViewInteractorProtocol = EquipmentListViewInteractor()
            let entity: EquipmentListViewEntityProtocol = EquipmentListViewEntity()
            let router: EquipmentListViewRouterProtocol = EquipmentListViewRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            interactor.presenter = presenter
            interactor.entity = entity
            
            return navigationController
        }
        return UIViewController()
    }
    
    func presentListDetailScreen(from view: EquipmentListViewProtocol, forEquipment eachEquipment: EachEquipment) {
        
        let equipmentListDetailViewController = EquipmentListDetailViewRouter.createEquipmentListDetailViewController(forView: view as? UIViewController, forEquipment: eachEquipment)
        if let sourceView = view as? UIViewController {
           sourceView.navigationController?.pushViewController(equipmentListDetailViewController, animated: true)
        }
    }
}

