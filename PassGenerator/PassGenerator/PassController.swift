//
//  PassController.swift
//  PassGenerator
//
//  Created by Juan Torres on 1/3/19.
//  Copyright © 2019 Juan Torres. All rights reserved.
//

import UIKit

class PassController: UIViewController {
    
    @IBOutlet weak var NewPassButton: UIButton!
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var EntrantLabel: UILabel!
    @IBOutlet weak var RideAccessLabel: UILabel!
    @IBOutlet weak var FoodDiscountLabel: UILabel!
    @IBOutlet weak var MerchDicountLabel: UILabel!
    
    
    @IBOutlet weak var AmusementAreasButton: UIButton!
    @IBOutlet weak var KitchenAreasButton: UIButton!
    @IBOutlet weak var RideControlAccessButton: UIButton!
    @IBOutlet weak var MainentanceAreasButton: UIButton!
    @IBOutlet weak var OfficeAreasButton: UIButton!
    @IBOutlet weak var FoodDiscountButton: UIButton!
    @IBOutlet weak var MerchDiscountButton: UIButton!
    
    @IBOutlet weak var TestResultsView: UIView!
    @IBOutlet weak var TestResultsLabel: UILabel!
    
    
    var pass: Pass?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //if let stuff = pass?.person.firstName { NameLabel.text = stuff}
        useCorrectLabels()
        
        // Do any additional setup after loading the view.
        
    }
    


    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func DisplayFoodDiscount(_ sender: UIButton) {
        TestResultsView.backgroundColor = .yellow
        guard let discount = pass?.foodDiscount() else {return}
        
        TestResultsLabel.text = discount
    }
    
    @IBAction func DisplayMerchDiscount(_ sender: UIButton) {
        TestResultsView.backgroundColor = .yellow
        guard let discount = pass?.merchDiscount() else {return}
        
        TestResultsLabel.text = discount
    }
    
    
    @IBAction func checkForAmusementAccess(_ sender: UIButton) {
        
        guard let access = pass?.person.swipe(for: .amusementArea) else {return }
        
        if(access)
        {
            TestResultsLabel.text = "Pass"
            TestResultsView.backgroundColor = .green
        } else {
            TestResultsLabel.text = "No Access"
            TestResultsView.backgroundColor = .red
            
        }
    }
    
    
    @IBAction func checkForKitchenAccess(_ sender: UIButton) {
        
        guard let access = pass?.person.swipe(for: .kitchenArea) else {return }
        
        if(access)
        {
            TestResultsLabel.text = "Pass"
            TestResultsView.backgroundColor = .green
        } else {
            TestResultsLabel.text = "No Access"
            TestResultsView.backgroundColor = .red
            
        }
        
    }
    
    
    @IBAction func checkForOfficeArea(_ sender: UIButton) {
        
        guard let access = pass?.person.swipe(for: .officeArea) else {return }
        
        if(access)
        {
            TestResultsLabel.text = "Pass"
            TestResultsView.backgroundColor = .green
        } else {
            TestResultsLabel.text = "No Access"
            TestResultsView.backgroundColor = .red
            
        }
    }
    
    @IBAction func checkForControlAccess(_ sender: UIButton) {
       
        guard let access = pass?.person.swipe(for: .rideControlArea) else {return }
        
        if(access)
        {
            TestResultsLabel.text = "Pass"
            TestResultsView.backgroundColor = .green
        } else {
            TestResultsLabel.text = "No Access"
            TestResultsView.backgroundColor = .red
            
        }
        
    }
    
    @IBAction func checkForMaintenanceAreaAccess(_ sender: UIButton) {
        
        guard let access = pass?.person.swipe(for: .maintenanceArea) else {return }
        
        if(access)
        {
            TestResultsLabel.text = "Pass"
            TestResultsView.backgroundColor = .green
        } else {
            TestResultsLabel.text = "No Access"
            TestResultsView.backgroundColor = .red
            
        }
    }
    
    
    func useCorrectLabels()
    {
        
        NameLabel.text = pass?.getFullName()
        EntrantLabel.text = pass?.typeOfEntrant()
        RideAccessLabel.text = pass?.hasRideAccess()
        FoodDiscountLabel.text = pass?.foodDiscount()
        MerchDicountLabel.text = pass?.merchDiscount()
    }

    
    
}
