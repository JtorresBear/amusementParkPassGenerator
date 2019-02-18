//
//  Guests and Employees.swift
//  PassGenerator
//
//  Created by Juan Torres on 10/9/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import Foundation

enum EntrantType
{
    case employee
    case manager
    case vendor
    case contractor
    case guest
}

enum ManagementType
{
    case shift
    case general
    case senior
}

enum EmployeeType
{
    case foodServicesHourly
    case rideServicesHourly
    case maintenanceHourly
    case manager
    case contract
    case vendor
}

enum ProjectNumber
{
    case n1001
    case n1002
    case n1003
    case n2001
    case n2002
}

enum VendorCompany
{
    case Acme
    case Orkin
    case Fedex
    case NWElectrical
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
        case .vendor: print("should have picked Vendor")
        case .contract: print("should have picked contract")
        }
    }
    
    
    
    
    mutating func figureOutAccess(employeeType: EmployeeType, projectNumber: ProjectNumber)
    {
        //guard let project = projectNumber else {throw PossibleErrors.noProjectNumber}
        
        switch employeeType
        {
        case .foodServicesHourly: self.amusementAreas = true; self.kitchenAreas = true
        case .rideServicesHourly: self.rideControlAreas = true; amusementAreas = true
        case .maintenanceHourly: self.amusementAreas = true; kitchenAreas = true; self.rideControlAreas = true; self.maintenanceAreas = true
        case .manager: self.amusementAreas = true; self.kitchenAreas = true; self.rideControlAreas = true; self.maintenanceAreas = true; self.OfficeAreas = true
        case .vendor: self.amusementAreas = true; self.kitchenAreas = true
        case .contract: switch projectNumber
            {
            case .n1001: self.amusementAreas = true; self.rideControlAreas = true
            case .n1002: self.amusementAreas = true; self.rideControlAreas = true; self.maintenanceAreas = true
            case .n1003: self.amusementAreas = true; self.rideControlAreas = true; self.kitchenAreas = true; self.maintenanceAreas = true; self.OfficeAreas = true
            case .n2001: self.OfficeAreas = true
            case .n2002: self.kitchenAreas = true; self.maintenanceAreas = true;
            }
        }
    }
    
    
    mutating func figureOutAccess(employeeType: EmployeeType, vendor: VendorCompany )
    {
        switch employeeType
        {
        case .foodServicesHourly: self.amusementAreas = true; self.kitchenAreas = true
        case .rideServicesHourly: self.rideControlAreas = true; amusementAreas = true
        case .maintenanceHourly: self.amusementAreas = true; kitchenAreas = true; self.rideControlAreas = true; self.maintenanceAreas = true
        case .manager: self.amusementAreas = true; self.kitchenAreas = true; self.rideControlAreas = true; self.maintenanceAreas = true; self.OfficeAreas = true
        case .vendor: switch vendor
            {
            case .Acme: self.kitchenAreas = true
            case .Fedex: self.maintenanceAreas = true; self.OfficeAreas = true
            case .NWElectrical: self.amusementAreas = true; self.rideControlAreas = true; self.kitchenAreas = true; self.maintenanceAreas = true; self.OfficeAreas = true
            case .Orkin: self.amusementAreas = true; self.rideControlAreas = true; self.kitchenAreas = true
            
            }
        case .contract: print("should have picked contract")
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
    
    mutating func figureOutAccess(employee: EmployeeType)
    {
        switch employee
        {
            case .foodServicesHourly: break
            case .rideServicesHourly: break
            case .maintenanceHourly: break
            case .manager: break
            case .contract: allRides = false
            case .vendor: allRides = false
            
        }
    }
    
    
    
}


extension EmployeeType
{
    var foodDiscount : Double
    {
        switch self
        {
        case .foodServicesHourly: return 15
        case .rideServicesHourly: return 15
        case .maintenanceHourly: return 15
        case .manager: return 25
        case .contract: return 0
        case .vendor: return 0
        }
    }
    
    var merchandiseDiscount : Double
    {
        switch  self
        {
        case .foodServicesHourly: return 25
        case .rideServicesHourly: return 25
        case .maintenanceHourly: return 25
        case .manager: return 25
        case .contract: return 0
        case .vendor: return 0
        }
    }
}





extension GuestType
{
    var foodDiscount: Double
    {
        switch self
        {
        case .classic: return 0
        case .VIP: return 10
        case .freeChildGuest: return 0
        case .seasonPassGuest: return 10
        case .seniorGuest: return 10
        }
    }
    
    var merchandiseDiscount: Double
    {
        switch self
        {
        case .classic: return 0
        case .VIP: return 20
        case .freeChildGuest: return 0
        case .seasonPassGuest: return 20
        case .seniorGuest:return 10
        }
    }
    
    
}








































