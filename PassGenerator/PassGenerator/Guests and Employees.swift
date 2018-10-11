//
//  Guests and Employees.swift
//  PassGenerator
//
//  Created by Juan Torres on 10/9/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import Foundation


enum EmployeeType
{
    case foodServicesHourly
    case rideServicesHourly
    case maintenanceHourly
    case manager
    case contract
    case vendor
}

enum GuestType
{
    case classic
    case VIP
    case freeChildGuest
    case seasonPassGuest
    case seniorGuest
}

enum AreaAccessList
{
    case amusementArea
    case kitchenArea
    case rideControlArea
    case maintenanceArea
    case officeArea
}



struct AreaAccess
{
    var amusementAreas: Bool = false
    var kitchenAreas: Bool = false
    var rideControlAreas: Bool = false
    var maintenanceAreas: Bool = false
    var OfficeAreas: Bool = false
    
    
    mutating func figureOutAccess(employeeType: EmployeeType)
    {
        switch employeeType
        {
        case .foodServicesHourly: self.amusementAreas = true; self.kitchenAreas = true
        case .rideServicesHourly: self.rideControlAreas = true; amusementAreas = true
        case .maintenanceHourly: self.amusementAreas = true; kitchenAreas = true; self.rideControlAreas = true; self.maintenanceAreas = true
        case .manager: self.amusementAreas = true; self.kitchenAreas = true; self.rideControlAreas = true; self.maintenanceAreas = true; self.OfficeAreas = true
        case .contract: self.amusementAreas = true; self.kitchenAreas = true
        case .vendor: self.amusementAreas = true; self.kitchenAreas = true
        }
    }
    
    mutating func figureOutAccess(guest: GuestType)
    {
        switch guest
        {
        case .classic: self.amusementAreas = true
        case .VIP: self.amusementAreas = true
        case .freeChildGuest: self.amusementAreas = true
        case .seasonPassGuest: self.amusementAreas = true
        case .seniorGuest: self.amusementAreas = true
        }
    }
}

struct RideAccess
{
    var allRides: Bool = true
    var skipLinesAllRides: Bool = false
    
    mutating func figureOutAccess(guest: GuestType)
    {
        switch guest
        {
        case .classic: break
        case .VIP: self.skipLinesAllRides = true
        case .freeChildGuest: break
        case .seasonPassGuest: self.skipLinesAllRides = true
        case .seniorGuest: self.skipLinesAllRides = true
        }
    }
    
    
    
}


extension EmployeeType
{
    var foodDiscount : Double
    {
        switch self
        {
        case .foodServicesHourly: return 0.15
        case .rideServicesHourly: return 0.15
        case .maintenanceHourly: return 0.15
        case .manager: return 0.25
        case .contract: return 0.0
        case .vendor: return 0.0
        }
    }
    
    var merchandiseDiscount : Double
    {
        switch  self
        {
        case .foodServicesHourly: return 0.25
        case .rideServicesHourly: return 0.25
        case .maintenanceHourly: return 0.25
        case .manager: return 0.25
        case .contract: return 0.0
        case .vendor: return 0.0
        }
    }
}





extension GuestType
{
    var foodDiscount: Double
    {
        switch self
        {
        case .classic: return 0.0
        case .VIP: return 0.10
        case .freeChildGuest: return 0
        case .seasonPassGuest: return 0.10
        case .seniorGuest: return 0.10
        }
    }
    
    var merchandiseDiscount: Double
    {
        switch self
        {
        case .classic: return 0.0
        case .VIP: return 0.20
        case .freeChildGuest: return 0.0
        case .seasonPassGuest: return 0.20
        case .seniorGuest:return 0.10
        }
    }
    
    
}








































