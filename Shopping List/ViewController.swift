//
//  ViewController.swift
//  Shopping List
//
//  Created by Shubh Patel on 2018-10-18.
//  Copyright © 2018 Shubh Patel. All rights reserved.
//

import UIKit

struct item {

    var title : String
    var count : Int
    
}


class TableView: UITableView {
    
  
}



class ViewController: UIViewController{
    
    let preferences = UserDefaults.standard
    
    @IBOutlet weak var listName: UITextField!
    @IBOutlet weak var countItem1: UILabel!
    @IBOutlet weak var countItem2: UILabel!
    @IBOutlet weak var countItem3: UILabel!
    @IBOutlet weak var countItem4: UILabel!
    @IBOutlet weak var countItem5: UILabel!
    @IBOutlet weak var countItem6: UILabel!
    @IBOutlet weak var countItem7: UILabel!
    
    
    @IBOutlet weak var nameItem1: UITextField!
    @IBOutlet weak var nameItem2: UITextField!
    @IBOutlet weak var nameItem3: UITextField!
    @IBOutlet weak var nameItem4: UITextField!
    @IBOutlet weak var nameItem5: UITextField!
    @IBOutlet weak var nameItem6: UITextField!
    @IBOutlet weak var nameItem7: UITextField!
    
    
    
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    @IBOutlet weak var stepper3: UIStepper!
    @IBOutlet weak var stepper4: UIStepper!
    @IBOutlet weak var stepper5: UIStepper!
    @IBOutlet weak var stepper6: UIStepper!
    @IBOutlet weak var stepper7: UIStepper!
    
    
   
    
  
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Shopping List";
        
        if((preferences.object(forKey: "name")) != nil){
            listName.text = (preferences.object(forKey: "name") as! String)
        }
        
        
        if((preferences.object(forKey: "name1")) != nil){
            nameItem1.text =  (preferences.object(forKey: "name1") as! String)
            stepper1.value = (preferences.object(forKey: "count1") as! Double)
            countItem1.text = doubleRound(result: stepper1.value)
            }
    
        if((preferences.object(forKey: "name2")) != nil){
            nameItem2.text =  (preferences.object(forKey: "name2") as! String)
            stepper2.value = (preferences.object(forKey: "count2") as! Double)
            countItem2.text = doubleRound(result: stepper2.value)
        }
        if((preferences.object(forKey: "name3")) != nil){
            nameItem3.text =  (preferences.object(forKey: "name3") as! String)
            stepper3.value = (preferences.object(forKey: "count3") as! Double)
            countItem3.text = doubleRound(result: stepper1.value)
        }
        if((preferences.object(forKey: "name4")) != nil){
            nameItem4.text =  (preferences.object(forKey: "name4") as! String)
            stepper4.value = (preferences.object(forKey: "count4") as! Double)
            countItem4.text = doubleRound(result: stepper4.value)
        }
        if((preferences.object(forKey: "name5")) != nil){
            nameItem5.text =  (preferences.object(forKey: "name5") as! String)
            stepper5.value = (preferences.object(forKey: "count5") as! Double)
            countItem5.text = doubleRound(result: stepper5.value)
        }
        if((preferences.object(forKey: "name6")) != nil){
            nameItem6.text =  (preferences.object(forKey: "name6") as! String)
            stepper6.value = (preferences.object(forKey: "count6") as! Double)
            countItem6.text = doubleRound(result: stepper6.value)
        }
        if((preferences.object(forKey: "name7")) != nil){
            nameItem7.text =  (preferences.object(forKey: "name7") as! String)
            stepper7.value = (preferences.object(forKey: "count7") as! Double)
            countItem7.text = doubleRound(result: stepper7.value)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func onStepperClick(_ sender: UIStepper) {
       
        switch sender.tag {
        case 1:
            stepperClick(nameText: nameItem1, countText: countItem1, valueStepper: sender)
            break
        case 2:
             stepperClick(nameText: nameItem2, countText: countItem2, valueStepper: sender)
            break
        case 3:
             stepperClick(nameText: nameItem3, countText: countItem3, valueStepper: sender)
            break
        case 4:
             stepperClick(nameText: nameItem4, countText: countItem4, valueStepper: sender)
            break
        case 5:
             stepperClick(nameText: nameItem5, countText: countItem5, valueStepper: sender)
            break
        case 6:
             stepperClick(nameText: nameItem6, countText: countItem6, valueStepper: sender)
            break
        case 7:
             stepperClick(nameText: nameItem7, countText: countItem7, valueStepper: sender)
            break
        default:
            break
        }
    }
    
    func stepperClick(nameText: UITextField, countText: UILabel, valueStepper: UIStepper){
       
        if (valueStepper.tag == 1){
            if(nameItem1.text == ""){
                showAlert(message: "Enter Item name first")
                valueStepper.value -= 1
                return
            }
        }
        countText.text = doubleRound(result: valueStepper.value)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Message", message:
            message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func doubleRound(result: Double) -> String {
        let finalAns = String(format: "%g", result)
        return finalAns
    }
    
    @IBAction func onTitleChange(_ sender: UITextField) {
        navigationController?.title = sender.text
    }
    
    
    @IBAction func onResetClick(_ sender: UIButton) {
        stepper1.value = 0
        countItem1.text = "0"
        nameItem1.text = ""
        stepper2.value = 0
        countItem2.text = "0"
        nameItem2.text = ""
        stepper3.value = 0
        countItem3.text = "0"
        nameItem3.text = ""
        stepper4.value = 0
        countItem4.text = "0"
        nameItem4.text = ""
        stepper5.value = 0
        countItem5.text = "0"
        nameItem5.text = ""
        stepper6.value = 0
        countItem6.text = "0"
        nameItem6.text = ""
        stepper7.value = 0
        countItem7.text = "0"
        nameItem7.text = ""
    }
    
    
    @IBAction func onSaveClick(_ sender: Any) {
      //  var items = []
        

        let preferences = UserDefaults.standard
        
        if(listName.text == ""){
            showAlert(message: "Please Enter List name")
            return
        }
        
    
        
        preferences.set(listName.text, forKey: "name")

        preferences.set(nameItem1.text, forKey: "name1")
        preferences.set(stepper1.value, forKey: "count1")

        preferences.set(nameItem2.text, forKey: "name2")
        preferences.set(stepper2.value, forKey: "count2")

        preferences.set(nameItem3.text, forKey: "name3")
        preferences.set(stepper3.value, forKey: "count3")

        preferences.set(nameItem4.text, forKey: "name4")
        preferences.set(stepper4.value, forKey: "count4")

        preferences.set(nameItem5.text, forKey: "name5")
        preferences.set(stepper5.value, forKey: "count5")

        preferences.set(nameItem6.text, forKey: "name6")
        preferences.set(stepper6.value, forKey: "count6")

        preferences.set(nameItem7.text, forKey: "name7")
        preferences.set(stepper7.value, forKey: "count7")

        preferences.synchronize()
        
        showAlert(message: "Data Saved")
        
    }
    
    
}
