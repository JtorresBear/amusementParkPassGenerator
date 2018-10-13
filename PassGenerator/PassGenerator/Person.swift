//
//  Person.swift
//  PassGenerator
//
//  Created by Juan Torres on 10/9/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import Foundation


protocol Person
{
    var firstName: String? {get set}
    var lastName: String? {get set}
    var dateOfBirth: String? {get set}
    
    var address: String? {get set}
    var city: String? {get set}
    var state: String? {get set}
    var zipCode: String? {get set}
}




class Employee: Person
{
    var firstName: String?
    var lastName: String?
    var dateOfBirth: String?
    var address: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var foodDiscount: Double
    var merchDiscount: Double
    
    var areaAccess = AreaAccess()
    var rideaccess = RideAccess()
    
    
    
    init(firstName: String, lastName: String, dateOfBirth: String, address: String, city: String, state: String, zipCode: String, empolyeeType: EmployeeType) throws
    {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
        self.foodDiscount = empolyeeType.foodDiscount
        self.merchDiscount = empolyeeType.merchandiseDiscount
        self.areaAccess.figureOutAccess(employeeType: empolyeeType)
    }
    
    
    
    func employeeSwipe(for access: AreaAccessList) -> Bool
    {
        switch access
        {
        case .amusementArea: printAccessMessage(forArea: areaAccess.amusementAreas); return areaAccess.amusementAreas
        case .kitchenArea: printAccessMessage(forArea: areaAccess.kitchenAreas); return areaAccess.kitchenAreas
        case .maintenanceArea:printAccessMessage(forArea: areaAccess.maintenanceAreas); return areaAccess.maintenanceAreas
        case .officeArea: printAccessMessage(forArea: areaAccess.OfficeAreas); return areaAccess.OfficeAreas
        case .rideControlArea:printAccessMessage(forArea: areaAccess.rideControlAreas); return areaAccess.rideControlAreas
        }
    }
    
    func printAccessMessage(forArea: Bool)
    {
        if (forArea)
        {
            print("You May Proceed")
        } else
        {
            print("You Have No Access Here")
        }
    }
    
    func giveFoodDiscount()-> Double
    {
        return foodDiscount
    }
    
    func giveMerchandiseDiscount() -> Double
    {
        return merchDiscount
    }
    
}


class Guest: Person
{
    var firstName: String?
    var lastName: String?
    var dateOfBirth: String?
    var address: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var foodDiscount: Double
    var merchDiscount: Double
    
    var areaAccess = AreaAccess()
    var rideaccess = RideAccess()
    
    init(firstName: String?, lastName: String?, dateOfBirth: String?, address: String?, city: String?, state: String?, zipCode: String?, guestType: GuestType) throws
    {
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
        self.foodDiscount = guestType.foodDiscount
        self.merchDiscount = guestType.merchandiseDiscount
        self.areaAccess.figureOutAccess(guest: guestType)
    }
    
    
    func employeeSwipe(for access: AreaAccessList) -> Bool
    {
        switch access
        {
        case .amusementArea: printAccessMessage(forArea: areaAccess.amusementAreas); return areaAccess.amusementAreas
        case .kitchenArea: printAccessMessage(forArea: areaAccess.kitchenAreas); return areaAccess.kitchenAreas
        case .maintenanceArea:printAccessMessage(forArea: areaAccess.maintenanceAreas); return areaAccess.maintenanceAreas
        case .officeArea: printAccessMessage(forArea: areaAccess.OfficeAreas); return areaAccess.OfficeAreas
        case .rideControlArea:printAccessMessage(forArea: areaAccess.rideControlAreas); return areaAccess.rideControlAreas
        }
    }
    
    func printAccessMessage(forArea: Bool)
    {
        if (forArea)
        {
            print("You May Proceed")
        } else
        {
            print("You Have No Access Here")
        }
    }
    
    func giveFoodDiscount()-> Double
    {
        return foodDiscount
    }
    
    func giveMerchandiseDiscount() -> Double
    {
        return merchDiscount
    }
    
}


class ChildGuest: Guest
{
    override init(firstName: String?, lastName: String?, dateOfBirth: String?, address: String?, city: String?, state: String?, zipCode: String?, guestType: GuestType) throws {
        try super.init(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth, address: address, city: city, state: state, zipCode: zipCode, guestType: guestType)
    }
}











extension Person
{
    func printAccessMessage(forArea: Bool)
    {
        if (forArea)
        {
            print("You May Proceed")
        } else
        {
            print("You Have No Access Here")
        }
    }
}

































