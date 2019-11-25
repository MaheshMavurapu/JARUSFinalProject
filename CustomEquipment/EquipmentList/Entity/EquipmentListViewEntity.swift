//
//  EquipmentListViewEntity.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol EquipmentListViewEntityProtocol: class {
    func retrievePostList() throws -> [Equipment]
    func saveEquipments(_ equipments: [EachEquipment]) throws
}

class EquipmentListViewEntity: EquipmentListViewEntityProtocol {
    
    func retrievePostList() throws -> [Equipment]  {
        guard let managedOC = CoreDataManager.sharedManager.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        let request: NSFetchRequest<Equipment> = NSFetchRequest(entityName: String(describing: Equipment.self))
        return try managedOC.fetch(request)
    }
    
    func saveEquipments(_ equipments: [EachEquipment]) throws {
        guard let managedOC = CoreDataManager.sharedManager.managedObjectContext else {
            throw PersistenceError.managedObjectContextNotFound
        }
        
        if let newEquipment = NSEntityDescription.entity(forEntityName: "Equipment",
                                                           in: managedOC) {
            do {
                try equipments.forEach { (eachEquipment) in
                    let equipment = Equipment(entity: newEquipment, insertInto: managedOC)
                    equipment.id = Int32(eachEquipment.id)
                    equipment.vin = eachEquipment.vin
                    equipment.year = Int32(eachEquipment.year)
                    equipment.make = eachEquipment.make
                    equipment.value = Int64(eachEquipment.value)
                    equipment.length = Int16(eachEquipment.length)
                    try managedOC.save()
                }
            } catch {
                print(error)
            }
        }
        throw PersistenceError.couldNotSaveObject
    }
}
