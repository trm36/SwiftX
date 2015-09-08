//
//  Entry+CoreDataProperties.swift
//  SwiftX
//
//  Created by Taylor Mott on 9/8/15.
//  Copyright © 2015 Mott Applications. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Entry {

    @NSManaged var title: String?
    @NSManaged var body: String?
    @NSManaged var dateCreated: NSDate?
    @NSManaged var journal: Journal?

}
