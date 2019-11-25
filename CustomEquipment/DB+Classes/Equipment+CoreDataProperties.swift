//
//  Equipment+CoreDataProperties.swift
//  CustomEquipment
//
//  Created by Jarus on 11/25/19.
//  Copyright © 2019 MaheshMavurapu-Jarus. All rights reserved.
//
//

import Foundation
import CoreData


extension Equipment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Equipment> {
        return NSFetchRequest<Equipment>(entityName: "Equipment")
    }

    @NSManaged public var id: Int32
    @NSManaged public var length: Int16
    @NSManaged public var year: Int32
    @NSManaged public var make: String?
    @NSManaged public var value: Int64
    @NSManaged public var vin: String?

}
