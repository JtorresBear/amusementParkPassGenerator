//
//  Pass.swift
//  PassGenerator
//
//  Created by Juan Torres on 1/4/19.
//  Copyright © 2019 Juan Torres. All rights reserved.
//

import Foundation


class Pass {
    
    var person: Person
    var entrantType: EntrantType
    var extraInfo: String = ""
    
    
    init(person: Person, entrantType: EntrantType)
    {
        self.person = person
        self.entrantType = entrantType
        
    }
    
    init(person: Person, entrantType: EntrantType, extraInfo: String)
    {
        self.person = person
        self.entrantType = entrantType
        self.extraInfo = extraInfo
    }
    
    
    
    
    
    
    
    
    func getFirstName() -> String
    {
        guard let firstName = person.firstName else
        {
            return "No Name"
        }
        
        return firstName
    }
    
    func getLastName() -> String
    {
        guard  let LastName = person.lastName else
        {
            return " "
        }
        
        return LastName
    }
    
    func getFullName()-> String
    {
        return "\(getFirstName()) \(getLastName())"
    }
    
    func typeOfEntrant() -> String
    {
        switch entrantType
        {
        case .employee: return "\(extraInfo) Employee"
        case .manager: return "\(extraInfo) Manager"
        case .vendor: return "Vendor \(extraInfo)"
        case .contractor: return "Contractor \(extraInfo)"
        case .guest: return "\(extraInfo) Guest"
        }
    }
    
    func foodDiscount()-> String
    {
        var discount = person.foodDiscount
        return "Food Discount: \(discount)%"
    }
    
    func merchDiscount()-> String
    {
        var discount = person.merchDiscount
        return "Merch Discount: \(discount)%"
    }
    
    
    func hasRideAccess()-> String
    {
        if(person.rideAccess.allRides)
        {
            let rideAccess = "Access to all Rides"
            if(person.rideAccess.skipLinesAllRides)
            {
                return "\(rideAccess) \n can skip all lines"
            }
            else {return rideAccess}
        }
        else {return "Cannot Ride the rides"}
    }
    
    
    
    
    
}
