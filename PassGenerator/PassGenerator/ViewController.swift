//
//  ViewController.swift
//  PassGenerator
//
//  Created by Juan Torres on 10/9/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       //testGuestClassic()
       // testVIPGuest()
       // testChildGuest()
       // testManager()
       // testEmployee()
        
    }
    

    
    //Tests ClassicGuests
    func testGuestClassic()
    {
        let guestClassic: Guest = try! Guest(firstName: "nil", lastName: "nil", address: "nil", city: nil, state: nil, zipCode: nil, guestType: .classic, dobDay: nil, dobMonth: nil, dobYear: nil)
        do
        {
            try guestClassic.guestSwipe(for: .amusementArea) //Doesn't throw an error
            try guestClassic.guestSwipe(for: .kitchenArea) // throws an error because they don't have access
            try guestClassic.guestSwipe(for: .maintenanceArea)// isn't executed due to the last error, but if commented out, would throw an error.
            try guestClassic.guestSwipe(for: .rideControlArea)// isn't executed due to the last error, but if commented out, would throw an error.
            try guestClassic.guestSwipe(for: .officeArea)// isn't executed due to the last error, but if commented out, would throw an error.
            
        }
        catch PossibleErrors.notAllowed
        {
            print("You are not allowed here")
        }
        catch
        {
            print("UnHandled Error")
        }
        
        print("Classic Guest Food Discount: \(guestClassic.foodDiscount) \nClassicGuest Merch Discount \(guestClassic.merchDiscount) ")
    }
    
    
    //tests VIP Guests
    func testVIPGuest()
    {
        let guestVIP: Guest = try! Guest(firstName: "nil", lastName: "nil", address: "nil", city: nil, state: nil, zipCode: nil, guestType: .VIP, dobDay: nil, dobMonth: nil, dobYear: nil)
        do
        {
            try guestVIP.guestSwipe(for: .amusementArea) //Doesn't throw an error
            try guestVIP.guestSwipe(for: .kitchenArea) // throws an error because they don't have access
            try guestVIP.guestSwipe(for: .maintenanceArea)// isn't executed due to the last error, but if commented out, would throw an error.
            try guestVIP.guestSwipe(for: .rideControlArea)// isn't executed due to the last error, but if commented out, would throw an error.
            try guestVIP.guestSwipe(for: .officeArea)// isn't executed due to the last error, but if commented out, would throw an error.
            
        }
        catch PossibleErrors.notAllowed
        {
            print("You are not allowed here")
        }
        catch
        {
            print("UnHandled Error")
        }
        
        print("VIP Guest Food Discount: \(guestVIP.foodDiscount) \nVIPGuest Merch Discount \(guestVIP.merchDiscount) ")
    }
    
    
    // tests child guest
    func testChildGuest()
    {
        do
        {
            let guestChild: Guest = try ChildGuest(firstName: "nil", lastName: "nil", address: "nil", city: nil, state: nil, zipCode: nil, guestType: .freeChildGuest, dobDay: 26, dobMonth: 10, dobYear: nil)
            
            try guestChild.guestSwipe(for: .amusementArea) //Doesn't throw an error
            try guestChild.guestSwipe(for: .kitchenArea) // throws an error because they don't have access
            try guestChild.guestSwipe(for: .maintenanceArea)// isn't executed due to the last error, but if commented out, would throw an error.
            try guestChild.guestSwipe(for: .rideControlArea)// isn't executed due to the last error, but if commented out, would throw an error.
            try guestChild.guestSwipe(for: .officeArea)// isn't executed due to the last error, but if commented out, would throw an error.
            print("Child Guest Food Discount: \(guestChild.foodDiscount) \nChildGuest Merch Discount \(guestChild.merchDiscount) ")
        }
        catch PossibleErrors.notAllowed
        {
            print("You are not allowed here")
        }
        catch PossibleErrors.olderThanFive
        {
            print("Older Than Five")
        }
        catch PossibleErrors.missingYear
        {
         print("Missing Year")
        }
        catch PossibleErrors.missingMonth
        {
          print("Missing Month")
        }
            catch PossibleErrors.missingBirthDay
            {
                print("Missing Day")
        }
        catch
        {}
        
    }
    
    
    //tests managers
    func testManager()
    {
        do
        {
            let manager = try Employee(firstName: nil, lastName: nil, address: nil, city: nil, state: nil, zipCode: nil, employeeType: .manager)
        }
        catch PossibleErrors.noFIrstName
        {
            print("no first name included")
        }
        catch {}
        
        do
        {
            let manager = try Employee(firstName: "Juan", lastName: "Torres", address: "1234 w yesterday Drive", city: "Chicago", state: "IL", zipCode: "60806", employeeType: .manager)
            
            try manager.employeeSwipe(for: .kitchenArea)
            print("Your Merch Discount is \(manager.merchDiscount) and your food discount is \(manager.foodDiscount)")
        }
        catch {}
    }
    
    
    // tests various employees
    func testEmployee()
    {
        do
        {
            let foodEmp = try Employee(firstName: "Dan", lastName: "Strong", address: "nowhere", city: "Nowhere", state: "Nowhere", zipCode: "69696", employeeType: .foodServicesHourly)
            print("Your Merch Discount is \(foodEmp.merchDiscount) and your food discount is \(foodEmp.foodDiscount)")
            try foodEmp.employeeSwipe(for: .amusementArea)
            try foodEmp.employeeSwipe(for: .kitchenArea)
            try foodEmp.employeeSwipe(for: .officeArea)
        }
        catch PossibleErrors.notAllowed
        {
            print("Not Allowed")
        }
        catch
        {
        }
        
        do
        {
            let rideEmp = try Employee(firstName: "Blah", lastName: "Blah", address: "Blah", city: "Blah", state: "blah", zipCode: "blah", employeeType: .rideServicesHourly)
            
            try rideEmp.employeeSwipe(for: .amusementArea)
            try rideEmp.employeeSwipe(for: .rideControlArea)
            
        }
        catch PossibleErrors.notAllowed
        {
            print("Not Allowed")
        }
        catch
        {
        }
        
        do
        {
            let maintenanceEmp = try Employee(firstName: "stove", lastName: "light", address: "wall", city: "stuff", state: "into", zipCode: "area", employeeType: .maintenanceHourly)
            try maintenanceEmp.employeeSwipe(for: .maintenanceArea)
            try maintenanceEmp.employeeSwipe(for: .amusementArea)
            
            print("Your Merch Discount is \(maintenanceEmp.merchDiscount) and your food discount is \(maintenanceEmp.foodDiscount)")
            
        }
        catch PossibleErrors.notAllowed
        {
            print("Not Allowed")
        }
        catch
        {
        }
    }
    
    
    
    
}







