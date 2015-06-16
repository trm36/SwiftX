//
//  Entry.swift
//  SwiftX
//
//  Created by Taylor Mott on 16 Jun 15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import Foundation
import CoreData

@objc(Entry)

class Entry: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var saveDate: NSDate
    @NSManaged var bodyText: String

}
