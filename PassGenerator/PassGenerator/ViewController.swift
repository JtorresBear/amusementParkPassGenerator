//
//  ViewController.swift
//  PassGenerator
//
//  Created by Juan Torres on 10/9/18.
//  Copyright © 2018 Juan Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var GuestButton: UIButton!
    @IBOutlet weak var EmployeeButton: UIButton!
    @IBOutlet weak var ManagerButton: UIButton!
    @IBOutlet weak var VendorButton: UIButton!
    @IBOutlet weak var ContractorButton: UIButton!
    
    @IBOutlet weak var ButtonOne: UIButton!
    @IBOutlet weak var ButtonTwo: UIButton!
    @IBOutlet weak var ButtonThree: UIButton!
    @IBOutlet weak var ButtonFour: UIButton!
    @IBOutlet weak var ButtonFive: UIButton!
    
    @IBOutlet weak var MMTextField: UITextField!
    @IBOutlet weak var DDTextField: UITextField!
    @IBOutlet weak var YYYYTextField: UITextField!
    @IBOutlet weak var SSNTextField: UITextField!
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    
    @IBOutlet weak var CompanyTextField: UITextField!
    
    @IBOutlet weak var StreetAddressTextField: UITextField!
    @IBOutlet weak var CityTextField: UITextField!
    @IBOutlet weak var StateTextField: UITextField!
    @IBOutlet weak var ZipCodeTextField: UITextField!
    
    @IBOutlet weak var GeneratePassButton: UIButton!
    @IBOutlet weak var PopulateDataButton: UIButton!
    
    @IBOutlet weak var EntrantTypeLabel: UILabel!
    @IBOutlet weak var SubEntrantTypeLabel: UILabel!
    
    
    var buttonPressed: Bool = false
    var pass : Pass? = nil
    
    
    var entrantP: EntrantType = .employee
    
    var employeeTypeP: EmployeeType = .foodServicesHourly
    var projectNumberP: ProjectNumber = .n1001
    var vendorCompanyP: VendorCompany = .Acme
    var guestTypeP: GuestType = .classic
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       //testGuestClassic()
       // testVIPGuest()
        //testSeniorGuest()
       // testManager()
       // testEmployee()
        
        hideStackView2Buttons()
        EntrantTypeLabel.text = ""
        SubEntrantTypeLabel.text = ""
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreatePass"
        {
            let viewController = segue.destination as! PassController
            viewController.pass = pass  }
    }
    
    @IBAction func ChangeBottomToGuestButtons(_ sender: UIButton) {
        //hideStackView2Buttons()
        //setTitleButtonToBlank()
        ButtonOne.setTitle("Classic", for: .normal)
        ButtonTwo.setTitle("VIP", for: .normal)
        ButtonThree.setTitle("Child Guest", for: .normal)
        ButtonFour.setTitle("Season Pass", for: .normal)
        ButtonFive.setTitle("Senior", for: .normal)
        
        showFiveButtons()
        
        entrantP = .guest
        EntrantTypeLabel.text = "Guest"
        SubEntrantTypeLabel.text = ""
        
        enableAllTextFields(isEnabled: true)
        
        buttonPressed = true
    }
    
    
   
    
    @IBAction func changeBottomToEmployeeButtons(_ sender: UIButton) {
        //hideStackView2Buttons()
        //setTitleButtonToBlank()
        ButtonOne.setTitle("Food Service", for: .normal)
        ButtonTwo.setTitle("Ride Service", for: .normal)
        ButtonThree.setTitle("Maintenance", for: .normal)

        
        showThreeButtons()
        
        entrantP = .employee
        enableAllTextFields(isEnabled: true)
        
        EntrantTypeLabel.text = "Employee"
        SubEntrantTypeLabel.text = ""
        buttonPressed = true
    }
    
    
    @IBAction func changeForManager(_ sender: UIButton) {
        
        hideStackView2Buttons()
        
        entrantP = .manager
        employeeTypeP = .manager
        enableAllTextFields(isEnabled: true)
        
        EntrantTypeLabel.text = "Employee"
        SubEntrantTypeLabel.text = "Manager"
        
        buttonPressed = true
    }
    
 
    @IBAction func changeBottomToVendorButtons(_ sender: UIButton) {
        //hideStackView2Buttons()
        
        ButtonOne.setTitle("Acme", for: .normal)
        ButtonTwo.setTitle("Orkin", for: .normal)
        ButtonThree.setTitle("Fedex", for: .normal)
        ButtonFour.setTitle("NW Electrical", for: .normal)
        
        showFourButtons()
        
        entrantP = .vendor
        
        employeeTypeP = .vendor
        enableAllTextFields(isEnabled: true)
        
        EntrantTypeLabel.text = "Vendor"
        SubEntrantTypeLabel.text = ""
        buttonPressed = true
    }
    
    @IBAction func changeBottomToContractorButtons(_ sender: UIButton) {
        
        ButtonOne.setTitle("1001", for: .normal)
        ButtonTwo.setTitle("1002", for: .normal)
        ButtonThree.setTitle("1003", for: .normal)
        ButtonFour.setTitle("2001", for: .normal)
        ButtonFive.setTitle("2002", for: .normal)
        
        showFiveButtons()
        
        entrantP = .contractor
        
        employeeTypeP = .contract
        enableAllTextFields(isEnabled: true)
        
        EntrantTypeLabel.text = "Contractor"
        SubEntrantTypeLabel.text = ""
        buttonPressed = true
    }
    
    
    
    
    
    
    @IBAction func firstButtonAction(_ sender: UIButton) {
        
        switch entrantP
        {
        case .employee: employeeTypeP = .foodServicesHourly
            SubEntrantTypeLabel.text = "Food Service"
        case .manager: break;
        case .vendor: vendorCompanyP = .Acme
            SubEntrantTypeLabel.text = "Acme"
        case .contractor: projectNumberP = .n1001
        SubEntrantTypeLabel.text = "Project# 1001"
        case .guest: guestTypeP = .classic
            enableAllTextFields(isEnabled: false)
            enable(textField: FirstNameTextField, enabled: true)
            enable(textField: LastNameTextField, enabled: true)
            SubEntrantTypeLabel.text = "Classic"
        }
    }
    
    @IBAction func secondButtonAction(_ sender: UIButton) {
        switch entrantP
        {
            case .employee: employeeTypeP = .rideServicesHourly
                SubEntrantTypeLabel.text = "Ride Service"
            case .manager: break;
            case .vendor: vendorCompanyP = .Orkin
                SubEntrantTypeLabel.text = "Orkin"
            case .contractor: projectNumberP = .n1002
            SubEntrantTypeLabel.text = "Project# 1002"
            case .guest: guestTypeP = .VIP
                enableAllTextFields(isEnabled: false)
                enable(textField: FirstNameTextField, enabled: true)
                enable(textField: LastNameTextField, enabled: true)
                SubEntrantTypeLabel.text = "VIP Guest"
        }
    }
    
    
    
    @IBAction func thirdButtonAction(_ sender: UIButton) {
        switch entrantP
        {
            case .employee: employeeTypeP = .maintenanceHourly
                SubEntrantTypeLabel.text = "Maintencance"
            case .manager: break;
            case .vendor: vendorCompanyP = .Fedex
                SubEntrantTypeLabel.text = "Fedex"
            case .contractor: projectNumberP = .n1003
            SubEntrantTypeLabel.text = "Project# 1003"
            case .guest: guestTypeP = .freeChildGuest
                enableAllTextFields(isEnabled: false)
                enable(textField: MMTextField, enabled: true)
                enable(textField: DDTextField, enabled: true)
                enable(textField: YYYYTextField, enabled: true)
                SubEntrantTypeLabel.text = "Child Guest"
        }
    }
    
    
    @IBAction func fourthButtonAction(_ sender: UIButton) {
        switch entrantP
        {
            case .employee: break;
            case .manager: break;
            case .vendor: vendorCompanyP = .NWElectrical
                SubEntrantTypeLabel.text = "NW Electrical"
            case .contractor: projectNumberP = .n2001
            SubEntrantTypeLabel.text = "Project# 2001"
            case .guest: guestTypeP = .seasonPassGuest
                enableAllTextFields(isEnabled: true)
                enable(textField: SSNTextField, enabled: false)
                enable(textField: CompanyTextField, enabled: false)
                SubEntrantTypeLabel.text = "Season Pass"
        }
    }
    
    @IBAction func fifthButtonAction(_ sender: UIButton) {
        switch entrantP
        {
            case .employee: break;
            case .manager: break;
            case .vendor: break;
            case .contractor: projectNumberP = .n2002
            SubEntrantTypeLabel.text = "Project# 2002"
            case .guest: guestTypeP = .seniorGuest
                enableAllTextFields(isEnabled: false)
                enable(textField: MMTextField, enabled: true)
                enable(textField: DDTextField, enabled: true)
                enable(textField: YYYYTextField, enabled: true)
                enable(textField: FirstNameTextField, enabled: true)
                enable(textField: LastNameTextField, enabled: true)
                SubEntrantTypeLabel.text = "Senior Guest"
            
            
        }
        
    }
    
    

    func hideStackView2Buttons()
    {
        ButtonOne.isHidden = true
        ButtonTwo.isHidden = true
        ButtonThree.isHidden = true
        ButtonFour.isHidden = true
        ButtonFive.isHidden = true
    }
    
    func setTitleButtonToBlank()
    {
        ButtonOne.setTitle(" ", for: .normal)
        ButtonTwo.setTitle(" ", for: .normal)
        ButtonThree.setTitle(" ", for: .normal)
        ButtonFour.setTitle(" ", for: .normal)
        ButtonFive.setTitle(" ", for: .normal)
    }
    
    func enable(textField: UITextField, enabled: Bool)
    {
        if(enabled)
        {
            textField.isEnabled = enabled
            textField.backgroundColor = UIColor.white
            textField.text = ""
        }else
        {
            textField.isEnabled = enabled
            textField.backgroundColor = UIColor.lightGray
            textField.text = " "
        }
    }
    
    func enableAllTextFields(isEnabled: Bool)
    {
        enable(textField: MMTextField, enabled: isEnabled)
        enable(textField: DDTextField, enabled: isEnabled)
        enable(textField: YYYYTextField, enabled: isEnabled)
        enable(textField: SSNTextField, enabled: isEnabled)
        enable(textField: FirstNameTextField, enabled: isEnabled)
        enable(textField: LastNameTextField, enabled: isEnabled)
        enable(textField: CompanyTextField, enabled: isEnabled)
        enable(textField: StreetAddressTextField, enabled: isEnabled)
        enable(textField: CityTextField, enabled: isEnabled)
        enable(textField: StateTextField, enabled: isEnabled)
        enable(textField: ZipCodeTextField, enabled: isEnabled)
        
    }
    
   
    
    @IBAction func GeneratePass(_ sender: Any)
    {
        switch entrantP
        {
        case .manager:
            do{
                let manager = try Employee(firstName: FirstNameTextField.text, lastName: LastNameTextField.text, address: StreetAddressTextField.text, city: CityTextField.text, state: StateTextField.text, zipCode: ZipCodeTextField.text, employeeType: employeeTypeP, dobDay: Int(DDTextField.text!) , dobMonth: Int(MMTextField.text!), dobYear: Int(YYYYTextField.text!), ssn: SSNTextField.text)
                print("there's no problem here?")
                pass = Pass(person: manager, entrantType: .manager)
                print("there's no problem here?")
            }
            catch {print("there's a problem")}
        case .employee: switch employeeTypeP
        {
            
            
        case .foodServicesHourly:
            break
        case .rideServicesHourly:
            break
        case .maintenanceHourly:
            break
        case .manager:
            break
        case .contract:
            break
        case .vendor:
            break
            }
        case .vendor: if employeeTypeP == .vendor
        {
            
            }
        case .contractor: if employeeTypeP == .contract
        {
            
            }
        case .guest: if guestTypeP == .classic{}
        }
    }
    
    
    
    @IBAction func populateData(_ sender: UIButton) {
        
        DDTextField.text = "12"
        MMTextField.text = "12"
        YYYYTextField.text = "1221"
        
        FirstNameTextField.text = "Jones"
        LastNameTextField.text = "LEE"
        
        SSNTextField.text = "112121212"
        
        CompanyTextField.text = "Bazaar"
        
        StreetAddressTextField.text = "1232"
        CityTextField.text = "albany"
        StateTextField.text = "new york"
        ZipCodeTextField.text = "23232"
        
        
    }
    
    
    
    
    
    
    
    func showFiveButtons()
    {
        ButtonOne.isHidden = false
        ButtonTwo.isHidden = false
        ButtonThree.isHidden = false
        ButtonFour.isHidden = false
        ButtonFive.isHidden = false
    }
    
    func showFourButtons()
    {
        ButtonOne.isHidden = false
        ButtonTwo.isHidden = false
        ButtonThree.isHidden = false
        ButtonFour.isHidden = false
        ButtonFive.isHidden = true
    }
    
    func showThreeButtons()
    {
        ButtonOne.isHidden = false
        ButtonTwo.isHidden = false
        ButtonThree.isHidden = false
        ButtonFour.isHidden = true
        ButtonFive.isHidden = true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    //Tests ClassicGuests
//    func testGuestClassic()
//    {
//        let guestClassic: Guest = try! Guest(firstName: "nil", lastName: "nil", address: "nil", city: nil, state: nil, zipCode: nil, guestType: .classic, dobDay: nil, dobMonth: nil, dobYear: nil)
//        do
//        {
//            try guestClassic.guestSwipe(for: .amusementArea) //Doesn't throw an error
//            try guestClassic.guestSwipe(for: .kitchenArea) // throws an error because they don't have access
//            try guestClassic.guestSwipe(for: .maintenanceArea)// isn't executed due to the last error, but if commented out, would throw an error.
//            try guestClassic.guestSwipe(for: .rideControlArea)// isn't executed due to the last error, but if commented out, would throw an error.
//            try guestClassic.guestSwipe(for: .officeArea)// isn't executed due to the last error, but if commented out, would throw an error.
//
//        }
//        catch PossibleErrors.notAllowed
//        {
//            print("You are not allowed here")
//        }
//        catch
//        {
//            print("UnHandled Error")
//        }
//
//        print("Classic Guest Food Discount: \(guestClassic.foodDiscount) \nClassicGuest Merch Discount \(guestClassic.merchDiscount) ")
//    }
//
//
//    //tests VIP Guests
//    func testVIPGuest()
//    {
//        let guestVIP: Guest = try! Guest(firstName: "nil", lastName: "nil", address: "nil", city: nil, state: nil, zipCode: nil, guestType: .VIP, dobDay: nil, dobMonth: nil, dobYear: nil)
//        do
//        {
//            try guestVIP.guestSwipe(for: .amusementArea) //Doesn't throw an error
//            try guestVIP.guestSwipe(for: .kitchenArea) // throws an error because they don't have access
//            try guestVIP.guestSwipe(for: .maintenanceArea)// isn't executed due to the last error, but if commented out, would throw an error.
//            try guestVIP.guestSwipe(for: .rideControlArea)// isn't executed due to the last error, but if commented out, would throw an error.
//            try guestVIP.guestSwipe(for: .officeArea)// isn't executed due to the last error, but if commented out, would throw an error.
//
//        }
//        catch PossibleErrors.notAllowed
//        {
//            print("You are not allowed here")
//        }
//        catch
//        {
//            print("UnHandled Error")
//        }
//
//        print("VIP Guest Food Discount: \(guestVIP.foodDiscount) \nVIPGuest Merch Discount \(guestVIP.merchDiscount) ")
//    }
//
//
//    // tests child guest
//    func testChildGuest()
//    {
//        do
//        {
//            let guestChild: Guest = try ChildGuest(firstName: nil, lastName: "nil", address: "nil", city: nil, state: nil, zipCode: nil, guestType: .freeChildGuest, dobDay: 13, dobMonth: 1, dobYear: 2014)
//
//            try guestChild.guestSwipe(for: .amusementArea) //Doesn't throw an error
//            try guestChild.guestSwipe(for: .kitchenArea) // throws an error because they don't have access
//            try guestChild.guestSwipe(for: .maintenanceArea)// isn't executed due to the last error, but if commented out, would throw an error.
//            try guestChild.guestSwipe(for: .rideControlArea)// isn't executed due to the last error, but if commented out, would throw an error.
//            try guestChild.guestSwipe(for: .officeArea)// isn't executed due to the last error, but if commented out, would throw an error.
//            print("Child Guest Food Discount: \(guestChild.foodDiscount) \nChildGuest Merch Discount \(guestChild.merchDiscount) ")
//        }
//        catch PossibleErrors.notAllowed
//        {
//            print("You are not allowed here")
//        }
//        catch PossibleErrors.olderThanFive
//        {
//            print("Older Than Five")
//        }
//        catch PossibleErrors.missingYear
//        {
//         print("Missing Year")
//        }
//        catch PossibleErrors.missingMonth
//        {
//          print("Missing Month")
//        }
//            catch PossibleErrors.missingBirthDay
//            {
//                print("Missing Day")
//        }
//        catch
//        {}
//
//    }
//
//    func testSeniorGuest()
//    {
//        do
//        {
//            let seniorGuest: Guest = try Senior(firstName: "Juan", lastName: "Torres", address: nil, city: nil, state: nil, zipCode: nil, guestType: .seniorGuest, dobDay: 12, dobMonth: 1, dobYear: 1954)
//
//        }
//
//        catch PossibleErrors.notASenior
//        {
//            print("not a senior guy")
//        }
//        catch {}
//    }
//
//
//
//
//
//
//
//
//
//    func testEmployee()
//    {
//        do
//        {
//            let foodEmp = try Employee(firstName: "Dan", lastName: "Strong", address: "nowhere", city: "Nowhere", state: "Nowhere", zipCode: "69696", employeeType: .foodServicesHourly)
//            print("Your Merch Discount is \(foodEmp.merchDiscount) and your food discount is \(foodEmp.foodDiscount)")
//            try foodEmp.employeeSwipe(for: .amusementArea)
//            try foodEmp.employeeSwipe(for: .kitchenArea)
//            try foodEmp.employeeSwipe(for: .officeArea)
//        }
//        catch PossibleErrors.notAllowed
//        {
//            print("Not Allowed")
//        }
//        catch
//        {
//        }
//
//        do
//        {
//            let rideEmp = try Employee(firstName: "Blah", lastName: "Blah", address: "Blah", city: "Blah", state: "blah", zipCode: "blah", employeeType: .rideServicesHourly, projectNumber: .n1001)
//
//            try rideEmp.employeeSwipe(for: .amusementArea)
//            try rideEmp.employeeSwipe(for: .rideControlArea)
//
//        }
//        catch PossibleErrors.notAllowed
//        {
//            print("Not Allowed")
//        }
//        catch
//        {
//        }
//
//        do
//        {
//            let maintenanceEmp = try Employee(firstName: "stove", lastName: "light", address: "wall", city: "stuff", state: "into", zipCode: "area", employeeType: .maintenanceHourly, projectNumber: .n1001)
//            try maintenanceEmp.employeeSwipe(for: .maintenanceArea)
//            try maintenanceEmp.employeeSwipe(for: .amusementArea)
//
//            print("Your Merch Discount is \(maintenanceEmp.merchDiscount) and your food discount is \(maintenanceEmp.foodDiscount)")
//
//        }
//        catch PossibleErrors.notAllowed
//        {
//            print("Not Allowed")
//        }
//        catch
//        {
//        }
//    }
//
//
//
//
}







