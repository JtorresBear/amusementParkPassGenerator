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
    var managerTypeP: ManagementType = .shift
    
    var projectNSelected = false
    var compSelected = false
    var managerSelected = false
    var employeeSelected = false
    var guestSelected = false
    
    
    

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
        clearTextFields()
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
        projectNSelected = false
        compSelected = false
        guestSelected = false
        managerSelected = false
        employeeSelected = false
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

        projectNSelected = false
        compSelected = false
        guestSelected = false
        managerSelected = false
        employeeSelected = false
        showThreeButtons()
        
        entrantP = .employee
        enableAllTextFields(isEnabled: true)
        
        EntrantTypeLabel.text = "Employee"
        SubEntrantTypeLabel.text = ""
        buttonPressed = true
    }
    
    
    @IBAction func changeForManager(_ sender: UIButton) {
        
        ButtonOne.setTitle("Shift M", for: .normal)
        ButtonTwo.setTitle("General M", for: .normal)
        ButtonThree.setTitle("Senior M", for: .normal)
        
        
        
        
        projectNSelected = false
        compSelected = false
        guestSelected = false
        managerSelected = false
        employeeSelected = false
        
        showThreeButtons()
        entrantP = .manager
        employeeTypeP = .manager
        enableAllTextFields(isEnabled: true)
        
        EntrantTypeLabel.text = "Manager"
        SubEntrantTypeLabel.text = ""
        
        buttonPressed = true
    }
    
 
    @IBAction func changeBottomToVendorButtons(_ sender: UIButton) {
        //hideStackView2Buttons()
        projectNSelected = false
        compSelected = false
        guestSelected = false
        managerSelected = false
        employeeSelected = false
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
        projectNSelected = false
        compSelected = false
        guestSelected = false
        managerSelected = false
        employeeSelected = false
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
            employeeSelected = true
        case .manager: managerTypeP = .shift
        SubEntrantTypeLabel.text = "Shift M"
            managerSelected = true
        case .vendor: vendorCompanyP = .Acme
            SubEntrantTypeLabel.text = "Acme"
        compSelected = true
        case .contractor: projectNumberP = .n1001
        SubEntrantTypeLabel.text = "Project# 1001"
        projectNSelected = true
        case .guest: guestTypeP = .classic
            enableAllTextFields(isEnabled: false)
            enable(textField: FirstNameTextField, enabled: true)
            enable(textField: LastNameTextField, enabled: true)
            SubEntrantTypeLabel.text = "Classic"
            guestSelected = true
        }
    }
    
    @IBAction func secondButtonAction(_ sender: UIButton) {
        switch entrantP
        {
            case .employee: employeeTypeP = .rideServicesHourly
                SubEntrantTypeLabel.text = "Ride Service"
                employeeSelected = true
            case .manager: managerTypeP = .general
            SubEntrantTypeLabel.text = "General M"
            managerSelected = true
            case .vendor: vendorCompanyP = .Orkin
                SubEntrantTypeLabel.text = "Orkin"
            compSelected = true
            case .contractor: projectNumberP = .n1002
            SubEntrantTypeLabel.text = "Project# 1002"
            projectNSelected = true
            case .guest: guestTypeP = .VIP
                enableAllTextFields(isEnabled: false)
                enable(textField: FirstNameTextField, enabled: true)
                enable(textField: LastNameTextField, enabled: true)
                SubEntrantTypeLabel.text = "VIP Guest"
            guestSelected = true
        }
    }
    
    
    
    @IBAction func thirdButtonAction(_ sender: UIButton) {
        switch entrantP
        {
            case .employee: employeeTypeP = .maintenanceHourly
                SubEntrantTypeLabel.text = "Maintencance"
                employeeSelected = true
            case .manager: managerTypeP = .senior
            SubEntrantTypeLabel.text = "Senior M"
            managerSelected = true
            case .vendor: vendorCompanyP = .Fedex
                SubEntrantTypeLabel.text = "Fedex"
            compSelected = true
            case .contractor: projectNumberP = .n1003
            SubEntrantTypeLabel.text = "Project# 1003"
            projectNSelected = true
            case .guest: guestTypeP = .freeChildGuest
                enableAllTextFields(isEnabled: false)
                enable(textField: MMTextField, enabled: true)
                enable(textField: DDTextField, enabled: true)
                enable(textField: YYYYTextField, enabled: true)
                SubEntrantTypeLabel.text = "Child Guest"
            guestSelected = true
        }
    }
    
    
    @IBAction func fourthButtonAction(_ sender: UIButton) {
        switch entrantP
        {
            case .employee: break;
            case .manager: break;
            case .vendor: vendorCompanyP = .NWElectrical
                SubEntrantTypeLabel.text = "NW Electrical"
            compSelected = true
            case .contractor: projectNumberP = .n2001
            SubEntrantTypeLabel.text = "Project# 2001"
            projectNSelected = true
            case .guest: guestTypeP = .seasonPassGuest
                enableAllTextFields(isEnabled: true)
                enable(textField: SSNTextField, enabled: false)
                enable(textField: CompanyTextField, enabled: false)
                SubEntrantTypeLabel.text = "Season Pass"
            guestSelected = true
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
            projectNSelected = true
            case .guest: guestTypeP = .seniorGuest
                enableAllTextFields(isEnabled: false)
                enable(textField: MMTextField, enabled: true)
                enable(textField: DDTextField, enabled: true)
                enable(textField: YYYYTextField, enabled: true)
                enable(textField: FirstNameTextField, enabled: true)
                enable(textField: LastNameTextField, enabled: true)
                SubEntrantTypeLabel.text = "Senior Guest"
            guestSelected = true
            
            
        }
        
    }
    
    

    
    
   
    
    @IBAction func GeneratePass(_ sender: Any)
    {
        if(buttonPressed)
        {
                switch entrantP
                {
                    
                    //Manager has a special case so it's first in the switch statement so it can be skipped first
                    case .manager:
                            do{
                                if(!managerSelected){throw PossibleErrors.ManagerTypeNotSelected}
                                
                                let manager = try Employee(firstName: FirstNameTextField.text, lastName: LastNameTextField.text, address: StreetAddressTextField.text, city: CityTextField.text, state: StateTextField.text, zipCode: ZipCodeTextField.text, employeeType: employeeTypeP, dobDay: Int(DDTextField.text!) , dobMonth: Int(MMTextField.text!), dobYear: Int(YYYYTextField.text!), ssn: SSNTextField.text)
                                var extraInfo = ""
                                switch managerTypeP
                                {
                                case .shift: extraInfo = "Shift"
                                case .senior: extraInfo = "Senior"
                                case .general: extraInfo = "General"
                                }
                                
                                pass = Pass(person: manager, entrantType: .manager, extraInfo: extraInfo)
                                
                            }
                            catch {genericAlert(error: error)}
                    //employee have three different types, the reas will break
                case .employee:
                    do{
                        if(!employeeSelected){throw PossibleErrors.EmployeeTypeNotSelected}
                        
                        let employee = try Employee(firstName: FirstNameTextField.text, lastName: LastNameTextField.text, address: StreetAddressTextField.text, city: CityTextField.text, state: StateTextField.text, zipCode: ZipCodeTextField.text, employeeType: employeeTypeP, dobDay: Int(DDTextField.text!) , dobMonth: Int(MMTextField.text!), dobYear: Int(YYYYTextField.text!), ssn: SSNTextField.text)

                        var extraInfo: String
                        switch employeeTypeP
                        {
                        case .foodServicesHourly: extraInfo = "Food Service"
                        case .maintenanceHourly: extraInfo = "Maintenance"
                        case .rideServicesHourly: extraInfo = "Ride Service"
                        default: extraInfo = ""
                        }
                        
                        pass = Pass(person: employee, entrantType: .employee, extraInfo: extraInfo)
                    } catch {genericAlert(error: error)}
                    
                case .vendor: do
                {
                    if(!compSelected){throw PossibleErrors.noCompanySelected}
                    
                    let vendor = try Employee(firstName: FirstNameTextField.text, lastName: LastNameTextField.text, address: StreetAddressTextField.text, city: CityTextField.text, state: StateTextField.text, zipCode: ZipCodeTextField.text, employeeType: employeeTypeP, vendor: vendorCompanyP, dobDay: Int(DDTextField.text!) , dobMonth: Int(MMTextField.text!), dobYear: Int(YYYYTextField.text!), ssn: SSNTextField.text)
                    var extraInfo: String
                    switch vendorCompanyP
                    {
                    case .Acme: extraInfo = "Acme"
                    case.Fedex: extraInfo = "Fedex"
                    case .NWElectrical: extraInfo = "NW Electrical"
                    case .Orkin: extraInfo = "Orkin"
                    }
                    
                    
                    
                    pass = Pass(person: vendor, entrantType: .vendor, extraInfo: extraInfo)
                }
                catch {genericAlert(error: error)}
                case .contractor: do
                {
                    if(!projectNSelected){throw PossibleErrors.noProjectNumber}
                    
                    let projectN = try Employee(firstName: FirstNameTextField.text, lastName: LastNameTextField.text, address: StreetAddressTextField.text, city: CityTextField.text, state: StateTextField.text, zipCode: ZipCodeTextField.text, employeeType: employeeTypeP, projectNumber: projectNumberP, dobDay: Int(DDTextField.text!) , dobMonth: Int(MMTextField.text!), dobYear: Int(YYYYTextField.text!), ssn: SSNTextField.text)
                    
                    var extraInfo: String
                    switch projectNumberP
                    {
                    case .n1001: extraInfo = "Project #1001"
                    case .n1002: extraInfo = "Project #1002"
                    case .n1003: extraInfo = "Project #1003"
                    case .n2001: extraInfo = "Project #2001"
                    case .n2002: extraInfo = "project #2002"
                    }
                    
                    pass = Pass(person: projectN, entrantType: .contractor, extraInfo: extraInfo)
                    
                }
                catch {genericAlert(error: error)}

                case .guest: switch guestTypeP
                {
                case .classic: do
                {
                    var fName = ""
                    var lName = ""
                    if(FirstNameTextField.hasText)
                    {
                        fName = FirstNameTextField.text!
                    } else {fName = "No name"}
                    
                    if(LastNameTextField.hasText)
                    {
                        lName = LastNameTextField.text!
                    } else {lName = "" }
                    
                    
                    let guest = try Guest(firstName: fName, lastName: lName, address: nil, city: nil, state: nil, zipCode: nil, guestType: guestTypeP, dobDay: nil, dobMonth: nil, dobYear: nil)
                    pass = Pass(person: guest, entrantType: .guest, extraInfo: "Classic")
                } catch {genericAlert(error: error)}
                case .freeChildGuest: do
                {
                    let childGuest = try ChildGuest(firstName: nil, lastName: nil, address: nil, city: nil, state: nil, zipCode: nil, guestType: guestTypeP, dobDay: Int(DDTextField.text!), dobMonth: Int(MMTextField.text!), dobYear: Int(YYYYTextField.text!))
                    
                    pass = Pass(person: childGuest, entrantType: .guest, extraInfo: "Child")
                } catch {genericAlert(error: error)}
                case .seasonPassGuest: do
                {
                    let seasonGuest = try SeasonPass(firstName: FirstNameTextField.text, lastName: LastNameTextField.text, address: StreetAddressTextField.text, city: CityTextField.text, state: StateTextField.text, zipCode: ZipCodeTextField.text, guestType: guestTypeP, dobDay: Int(DDTextField.text!), dobMonth: Int(DDTextField.text!), dobYear: Int(YYYYTextField.text!))
                    
                    pass = Pass(person: seasonGuest, entrantType: .guest, extraInfo: "Season Pass")
                } catch {genericAlert(error: error)}
                case .seniorGuest: do
                {
                    let seniorGuest = try Senior(firstName: FirstNameTextField.text, lastName: LastNameTextField.text, address: nil, city: nil, state: nil, zipCode: nil, guestType: guestTypeP, dobDay: Int(DDTextField.text!), dobMonth: Int(MMTextField.text!), dobYear: Int(YYYYTextField.text!))
                    
                    pass = Pass(person: seniorGuest, entrantType: .guest, extraInfo: "Senior")
                } catch
                {
                    genericAlert(error: error)
                }
                case .VIP: do
                {
                    var fName = ""
                    var lName = ""
                    if(FirstNameTextField.hasText)
                    {
                        fName = FirstNameTextField.text!
                    } else {fName = "No name"}
                    
                    if(LastNameTextField.hasText)
                    {
                        lName = LastNameTextField.text!
                    } else {lName = "" }
                    
                    
                    let guest = try Guest(firstName: fName, lastName: lName, address: nil, city: nil, state: nil, zipCode: nil, guestType: guestTypeP, dobDay: nil, dobMonth: nil, dobYear: nil)
                    pass = Pass(person: guest, entrantType: .guest, extraInfo: "VIP")
                } catch {genericAlert(error: error)}
                }
                    
                }
    }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Please Select Something", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try Agian", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
    
    @IBAction func populateData(_ sender: UIButton) {
        
        switch entrantP
        {
        case .manager: DDTextField.text = "12"
        MMTextField.text = "03"
        YYYYTextField.text = "1990"
        
        FirstNameTextField.text = "Tom"
        LastNameTextField.text = "Hariot"
        
        SSNTextField.text = "773461234"
        
        CompanyTextField.text = "FunLand"
        
        StreetAddressTextField.text = "12890 N Tumor Road"
        CityTextField.text = "Albany"
        StateTextField.text = "New York"
        ZipCodeTextField.text = "33889"
        case .employee: switch employeeTypeP
        {
        case .foodServicesHourly: DDTextField.text = "01"
        MMTextField.text = "11"
        YYYYTextField.text = "1997"
        
        FirstNameTextField.text = "Larry"
        LastNameTextField.text = "Hule"
        
        SSNTextField.text = "987631827"
        CompanyTextField.text = "FunLand"
        
        StreetAddressTextField.text = "1234 w Upper East ave"
        CityTextField.text = "Albany"
        StateTextField.text = "New York"
        ZipCodeTextField.text = "40889"
        
        case .maintenanceHourly: DDTextField.text = "01"
        MMTextField.text = "10"
        YYYYTextField.text = "1987"
        
        FirstNameTextField.text = "Lard"
        LastNameTextField.text = "Hules"
        
        SSNTextField.text = "917691827"
        CompanyTextField.text = "FunLand"
        
        StreetAddressTextField.text = "190 s 33rd st"
        CityTextField.text = "Albany"
        StateTextField.text = "New York"
        ZipCodeTextField.text = "33089"
        case .rideServicesHourly: DDTextField.text = "08"
        MMTextField.text = "18"
        YYYYTextField.text = "2000"
        
        FirstNameTextField.text = "Jimmy"
        LastNameTextField.text = "Tuco"
        
        SSNTextField.text = "987630987"
        CompanyTextField.text = "FunLand"
        
        StreetAddressTextField.text = "134 E NoRiver Blvd"
        CityTextField.text = "Albany"
        StateTextField.text = "New York"
        ZipCodeTextField.text = "33555"
        case .vendor: break
        case .manager: break
        case .contract: break
        }
        case .contractor:switch projectNumberP
        {
        case .n1001: DDTextField.text = "22"
        MMTextField.text = "12"
        YYYYTextField.text = "1970"
        
        FirstNameTextField.text = "Carry"
        LastNameTextField.text = "Underwood"
        
        SSNTextField.text = "997341827"
        CompanyTextField.text = "1001"
        
        StreetAddressTextField.text = "1234 blooomWood Ave"
        CityTextField.text = "Polar"
        StateTextField.text = "New Jersey"
        ZipCodeTextField.text = "22889"
        case .n1002: DDTextField.text = "01"
        MMTextField.text = "08"
        YYYYTextField.text = "1976"
        
        FirstNameTextField.text = "Larry"
        LastNameTextField.text = "Croft"
        
        SSNTextField.text = "222631827"
        CompanyTextField.text = "FunLand"
        
        StreetAddressTextField.text = "1234 n otReal Rd"
        CityTextField.text = "JacobsVille"
        StateTextField.text = "New Jersey"
        ZipCodeTextField.text = "33844"
        case .n1003: DDTextField.text = "04"
        MMTextField.text = "02"
        YYYYTextField.text = "1999"
        
        FirstNameTextField.text = "Luarie"
        LastNameTextField.text = "House"
        
        SSNTextField.text = "987632227"
        CompanyTextField.text = "1003"
        
        StreetAddressTextField.text = "1444 S Ouncool ST"
        CityTextField.text = "Sway"
        StateTextField.text = "Illinois"
        ZipCodeTextField.text = "60804"
        case .n2001: DDTextField.text = "28"
        MMTextField.text = "02"
        YYYYTextField.text = "1988"
        
        FirstNameTextField.text = "Michele"
        LastNameTextField.text = "Delacruz"
        
        SSNTextField.text = "111224444"
        CompanyTextField.text = "HomeField"
        
        StreetAddressTextField.text = "1903 S RiverRoad Rd"
        CityTextField.text = "Chicago"
        StateTextField.text = "Florida"
        ZipCodeTextField.text = "33889"
        case .n2002: DDTextField.text = "01"
        MMTextField.text = "11"
        YYYYTextField.text = "1997"
        
        FirstNameTextField.text = "Kenny"
        LastNameTextField.text = "Rivera"
        
        SSNTextField.text = "676761827"
        CompanyTextField.text = "2002"
        
        StreetAddressTextField.text = "9898 S 56th CT"
        CityTextField.text = "Chicago"
        StateTextField.text = "Alaska"
        ZipCodeTextField.text = "20289"
            }
        case .guest: switch guestTypeP
        {
        case .classic:
        FirstNameTextField.text = "John"
        LastNameTextField.text = "Johnny"
        case .freeChildGuest: DDTextField.text = "12"
        MMTextField.text = "12"
        YYYYTextField.text = "2015"
        
        case .seasonPassGuest:
            FirstNameTextField.text = "Sam"
            LastNameTextField.text = "Penny"
            StreetAddressTextField.text = "77 Lucky St"
            CityTextField.text = "Brook"
            StateTextField.text = "Illinois"
            ZipCodeTextField.text = "60807"
            DDTextField.text = "29"
            MMTextField.text = "07"
            YYYYTextField.text = "1998"
        
        
        case .seniorGuest: DDTextField.text = "01"
        MMTextField.text = "11"
        YYYYTextField.text = "1950"
        
        FirstNameTextField.text = "Mario"
        LastNameTextField.text = "Guzman"
        case .VIP: FirstNameTextField.text = "Smith"
        LastNameTextField.text = "Torres"
        }
        case .vendor:
            switch vendorCompanyP
            {
            case .Acme: DDTextField.text = "12"
            MMTextField.text = "12"
            YYYYTextField.text = "1980"
            
            FirstNameTextField.text = "Timmy"
            LastNameTextField.text = "Louis"
            
            SSNTextField.text = "123121234"
            
            CompanyTextField.text = "Acme"
            
            StreetAddressTextField.text = "1 nowhere road"
            CityTextField.text = "not here"
            StateTextField.text = "florida"
            ZipCodeTextField.text = "09098"
            case .Fedex:DDTextField.text = "11"
            MMTextField.text = "11"
            YYYYTextField.text = "1981"
            
            FirstNameTextField.text = "Bimmy"
            LastNameTextField.text = "Pouis"
            
            SSNTextField.text = "123155234"
            
            CompanyTextField.text = "Fedex"
            
            StreetAddressTextField.text = "2 nowhere road"
            CityTextField.text = "not there"
            StateTextField.text = "florida"
            ZipCodeTextField.text = "09097"
            case .NWElectrical: DDTextField.text = "10"
            MMTextField.text = "10"
            YYYYTextField.text = "1989"
            
            FirstNameTextField.text = "Cimmy"
            LastNameTextField.text = "Wouis"
            
            SSNTextField.text = "126655234"
            
            CompanyTextField.text = "NW Electrical"
            
            StreetAddressTextField.text = "3 nowhere road"
            CityTextField.text = "not Anywhere"
            StateTextField.text = "florida"
            ZipCodeTextField.text = "12097"
            case .Orkin: DDTextField.text = "09"
            MMTextField.text = "09"
            YYYYTextField.text = "1977"
            
            FirstNameTextField.text = "Mimmy"
            LastNameTextField.text = "Mouis"
            
            SSNTextField.text = "123199008"
            
            CompanyTextField.text = "Orkin"
            
            StreetAddressTextField.text = "6 nowhere road"
            CityTextField.text = "not Over"
            StateTextField.text = "Arizona"
            ZipCodeTextField.text = "12097"
            }
        }
        
        
    }
    
    
    func clearTextFields()
    {
        DDTextField.text = nil
        MMTextField.text = nil
        YYYYTextField.text = nil
        
        FirstNameTextField.text = nil
        LastNameTextField.text = nil
        
        SSNTextField.text = nil
        
        CompanyTextField.text = nil
        
        StreetAddressTextField.text = nil
        CityTextField.text = nil
        StateTextField.text = nil
        ZipCodeTextField.text = nil
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
    
    
    @IBAction func back(sender: UIStoryboardSegue)
    {
        clearTextFields()
        EntrantTypeLabel.text = ""
        SubEntrantTypeLabel.text = ""
        hideStackView2Buttons()
        enableAllTextFields(isEnabled: true)
        
        compSelected = false
        projectNSelected = false
        buttonPressed = false
    }
    
    func genericAlert<T>(error: T) {
        let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try Agian", style: .default, handler: nil))
        self.present(alert, animated: true)
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







