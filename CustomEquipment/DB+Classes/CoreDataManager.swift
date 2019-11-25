//
//  CoreDataManager.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//

import Foundation
import CoreData

// Core data manager
class CoreDataManager {
    // Singleton - Shared Instance
    static let sharedManager: CoreDataManager = CoreDataManager()
    
    // Persistent Container
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CustomEquipment")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved Error: \(error)")
            }
        })
        return container
    }()
    
    // Managed Object Context
    lazy var managedObjectContext: NSManagedObjectContext? = {
        return persistentContainer.viewContext
    }()
    
    // Save to DataBase
    func saveContext() {
        if managedObjectContext!.hasChanges {
            do {
                try managedObjectContext?.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
}
