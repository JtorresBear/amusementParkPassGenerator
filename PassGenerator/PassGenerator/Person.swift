//
//  Person.swift
//  PassGenerator
//
//  Created by Juan Torres on 10/9/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import Foundation
import UIKit

protocol Person
{
    var firstName: String? {get set}
    var lastName: String? {get set}
    
    var dobDay: Int? {get set}
    var dobMonth: Int? {get set}
    var dobYear: Int? {get set}
    
    var address: String? {get set}
    var city: String? {get set}
    var state: String? {get set}
    var zipCode: String? {get set}
    
    var foodDiscount: Double {get set}
    var merchDiscount: Double {get set}
    
    var areaAccess: AreaAccess {get set}
    var rideAccess: RideAccess {get set}
}




class Employee: Person
{
    var dobDay: Int?
    var dobMonth: Int?
    var dobYear: Int?
    
    var firstName: String?
    var lastName: String?
    
    var address: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var foodDiscount: Double
    var merchDiscount: Double
    var employee: EmployeeType
    
    var areaAccess = AreaAccess()
    var rideAccess = RideAccess()
    
    var socialSecurityNumber: String?
    
    
    
    init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zipCode: String?, employeeType: EmployeeType, dobDay: Int?, dobMonth: Int?, dobYear: Int?, ssn: String?) throws
    {
        if(firstName == "") {throw PossibleErrors.noFIrstName}
        if(lastName == "") {throw PossibleErrors.noLastName}
        if(address == "") {throw PossibleErrors.noAddress}
        if(city == "" ){throw PossibleErrors.noCity}
        if(state == ""){throw PossibleErrors.noState}
        if(zipCode == "") {throw PossibleErrors.noZipCode}
        if(ssn == "") {throw PossibleErrors.noSocial}
        
        
        
        guard let nameOne = firstName else {throw PossibleErrors.noFIrstName}
        guard let nameTwo = lastName else {throw PossibleErrors.noLastName}
        guard let addressone = address else {throw PossibleErrors.noAddress}
        guard let city1 = city else {throw PossibleErrors.noCity}
        guard let state1 = state else {throw PossibleErrors.noState}
        guard let zipcode1 = zipCode else {throw PossibleErrors.noZipCode}
        guard let dobDay = dobDay else {throw PossibleErrors.missingBirthDay}
        guard let dobMonth = dobMonth else {throw PossibleErrors.missingMonth}
        guard let dobYear = dobYear else {throw PossibleErrors.missingYear}
        guard let social = ssn else {throw PossibleErrors.noSocial}
        
        
        self.firstName = nameOne
        self.lastName = nameTwo
        self.address = addressone
        self.city = city1
        self.state = state1
        self.zipCode = zipcode1
        self.dobDay = dobDay
        self.dobMonth = dobMonth
        self.dobYear = dobYear
        self.socialSecurityNumber = social
        
        self.foodDiscount = employeeType.foodDiscount
        self.merchDiscount = employeeType.merchandiseDiscount
        self.areaAccess.figureOutAccess(employeeType: employeeType)
        self.employee = employeeType
    }
    
    init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zipCode: String?, employeeType: EmployeeType, vendor: VendorCompany, dobDay: Int?, dobMonth: Int?, dobYear: Int?, ssn: String?) throws
    {
        
        if(firstName == "") {throw PossibleErrors.noFIrstName}
        if(lastName == "") {throw PossibleErrors.noLastName}
        if(address == "") {throw PossibleErrors.noAddress}
        if(city == "" ){throw PossibleErrors.noCity}
        if(state == ""){throw PossibleErrors.noState}
        if(zipCode == "") {throw PossibleErrors.noZipCode}
        if(ssn == "") {throw PossibleErrors.noSocial}
        
        
        guard let nameOne = firstName else {throw PossibleErrors.noFIrstName}
        guard let nameTwo = lastName else {throw PossibleErrors.noLastName}
        guard let addressone = address else {throw PossibleErrors.noAddress}
        guard let city1 = city else {throw PossibleErrors.noCity}
        guard let state1 = state else {throw PossibleErrors.noState}
        guard let zipcode1 = zipCode else {throw PossibleErrors.noZipCode}
        guard let dobDay = dobDay else {throw PossibleErrors.missingBirthDay}
        guard let dobMonth = dobMonth else {throw PossibleErrors.missingMonth}
        guard let dobYear = dobYear else {throw PossibleErrors.missingYear}
        guard let social = ssn else {throw PossibleErrors.noSocial}
        
        
        self.firstName = nameOne
        self.lastName = nameTwo
        self.address = addressone
        self.city = city1
        self.state = state1
        self.zipCode = zipcode1
        self.dobDay = dobDay
        self.dobMonth = dobMonth
        self.dobYear = dobYear
        self.socialSecurityNumber = social
        
        self.foodDiscount = employeeType.foodDiscount
        self.merchDiscount = employeeType.merchandiseDiscount
        self.areaAccess.figureOutAccess(employeeType: employeeType, vendor: vendor)
        self.employee = employeeType
    }
    
    init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zipCode: String?, employeeType: EmployeeType, projectNumber: ProjectNumber, dobDay: Int?, dobMonth: Int?, dobYear: Int?, ssn: String?) throws
    {
        
        if(firstName == "") {throw PossibleErrors.noFIrstName}
        if(lastName == "") {throw PossibleErrors.noLastName}
        if(address == "") {throw PossibleErrors.noAddress}
        if(city == "" ){throw PossibleErrors.noCity}
        if(state == ""){throw PossibleErrors.noState}
        if(zipCode == "") {throw PossibleErrors.noZipCode}
        if(ssn == "") {throw PossibleErrors.noSocial}
        
        
        guard let nameOne = firstName else {throw PossibleErrors.noFIrstName}
        guard let nameTwo = lastName else {throw PossibleErrors.noLastName}
        guard let addressone = address else {throw PossibleErrors.noAddress}
        guard let city1 = city else {throw PossibleErrors.noCity}
        guard let state1 = state else {throw PossibleErrors.noState}
        guard let zipcode1 = zipCode else {throw PossibleErrors.noZipCode}
        guard let dobDay = dobDay else {throw PossibleErrors.missingBirthDay}
        guard let dobMonth = dobMonth else {throw PossibleErrors.missingMonth}
        guard let dobYear = dobYear else {throw PossibleErrors.missingYear}
        guard let social = ssn else {throw PossibleErrors.noSocial}
        
        
        self.firstName = nameOne
        self.lastName = nameTwo
        self.address = addressone
        self.city = city1
        self.state = state1
        self.zipCode = zipcode1
        self.dobDay = dobDay
        self.dobMonth = dobMonth
        self.dobYear = dobYear
        self.socialSecurityNumber = social
        
        self.foodDiscount = employeeType.foodDiscount
        self.merchDiscount = employeeType.merchandiseDiscount
        self.areaAccess.figureOutAccess(employeeType: employeeType, projectNumber: projectNumber)
        self.employee = employeeType
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
    var dobDay: Int?
    var dobMonth: Int?
    var dobYear: Int?
    
    var firstName: String?
    var lastName: String?
    var address: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var foodDiscount: Double
    var merchDiscount: Double
    
    var areaAccess = AreaAccess()
    var rideAccess = RideAccess()
    
    init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zipCode: String?, guestType: GuestType, dobDay: Int?, dobMonth: Int?, dobYear: Int?) throws
    {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dobDay = dobDay
        self.dobYear = dobYear
        self.dobMonth = dobMonth
        
        self.foodDiscount = guestType.foodDiscount
        self.merchDiscount = guestType.merchandiseDiscount
        self.areaAccess.figureOutAccess(guest: guestType)
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
    override init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zipCode: String?, guestType: GuestType, dobDay: Int?, dobMonth: Int?, dobYear: Int?) throws
    {
        guard let dobDay = dobDay else {throw PossibleErrors.missingBirthDay}
        guard let dobMonth = dobMonth else {throw PossibleErrors.missingMonth}
        guard let dobYear = dobYear else {throw PossibleErrors.missingYear}
        
        let date = Date()
        let calendar = Calendar.current
        
        if(calendar.component(.year, from: date) - dobYear <= 5)
        {
            if(dobMonth <= calendar.component(.month, from: date) )
            {
                if (dobDay <= calendar.component(.day , from: date) )
                {
                    throw PossibleErrors.olderThanFive
                }
            }
        }
        
        try super.init(firstName: firstName, lastName: lastName, address: address, city: city, state: state, zipCode: zipCode, guestType: guestType, dobDay: dobDay, dobMonth: dobMonth, dobYear: dobYear)
    }
}

class SeasonPass: Guest
{
    override init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zipCode: String?, guestType: GuestType, dobDay: Int?, dobMonth: Int?, dobYear: Int?) throws {
        
        guard let nameOne = firstName else {throw PossibleErrors.noFIrstName}
        if(firstName == ""){throw PossibleErrors.noFIrstName}
        guard let nameTwo = lastName else {throw PossibleErrors.noLastName}
        if(lastName == ""){throw PossibleErrors.noLastName}
        guard let addressone = address else {throw PossibleErrors.noAddress}
        if(address == "") {throw PossibleErrors.noAddress}
        guard let city1 = city else {throw PossibleErrors.noCity}
        if( city == "") {throw PossibleErrors.noCity}
        guard let state1 = state else {throw PossibleErrors.noState}
        if(state == "") {throw PossibleErrors.noState}
        guard let zipcode1 = zipCode else {throw PossibleErrors.noZipCode}
        if(zipCode == "") {throw PossibleErrors.noZipCode}
        
        try super.init(firstName: nameOne, lastName: nameTwo, address: addressone, city: city1, state: state1, zipCode: zipcode1, guestType: guestType, dobDay: dobDay, dobMonth: dobMonth, dobYear: dobYear)
    }
}



class Senior: Guest
{

    override init(firstName: String?, lastName: String?, address: String?, city: String?, state: String?, zipCode: String?, guestType: GuestType, dobDay: Int?, dobMonth: Int?, dobYear: Int?) throws {

        if(firstName == "") {throw PossibleErrors.noFIrstName}
        if(lastName == "") {throw PossibleErrors.noLastName}
        
        
        guard let nameOne = firstName else {throw PossibleErrors.noFIrstName}
        guard let nameTwo = lastName else {throw PossibleErrors.noLastName}
        guard let dobDay = dobDay else {throw PossibleErrors.missingBirthDay}
        guard let dobMonth = dobMonth else {throw PossibleErrors.missingMonth}
        guard let dobYear = dobYear else {throw PossibleErrors.missingYear}

        let date = Date()
        let calendar = Calendar.current
        
        if(calendar.component(.year, from: date) - dobYear <= 65)
        {
            if(dobMonth >= calendar.component(.month, from: date) )
            {
                if (dobDay > calendar.component(.day , from: date) )
                {
                    throw PossibleErrors.notASenior
                }
            }
        }
        
        try super.init(firstName: nameOne, lastName: nameTwo, address: address, city: city, state: state, zipCode: zipCode, guestType: guestType, dobDay: dobDay, dobMonth: dobMonth, dobYear: dobYear)
        
    }
}











extension Person
{
    func printAccessMessage(forArea: Bool, area: AreaAccessList)
    {
        var areaAccess: String = "nothing"
        switch area
        {
        case .amusementArea: areaAccess = "Amusement Areas"
        case .kitchenArea: areaAccess = "Kitchen Areas"
        case .maintenanceArea: areaAccess = "Maintenance Areas"
        case .officeArea: areaAccess = "Office Areas"
        case .rideControlArea: areaAccess = "Ride Control Areas"
        }

        if (forArea)
        {
            print("You May Proceed into \(areaAccess)")
        } else
        {
            print("You Have No Access Here")
        }
    }
    
    func swipe(for access: AreaAccessList) -> Bool
    {
        switch access
        {
        case .amusementArea: printAccessMessage(forArea: areaAccess.amusementAreas, area: access); return areaAccess.amusementAreas
        case .kitchenArea: printAccessMessage(forArea: areaAccess.kitchenAreas, area: access); return areaAccess.kitchenAreas
        case .maintenanceArea:printAccessMessage(forArea: areaAccess.maintenanceAreas, area: access); return areaAccess.maintenanceAreas
        case .officeArea: printAccessMessage(forArea: areaAccess.OfficeAreas, area: access);return areaAccess.OfficeAreas
        case .rideControlArea:printAccessMessage(forArea: areaAccess.rideControlAreas, area: access);return areaAccess.rideControlAreas
        }
    }
    
    
}





















