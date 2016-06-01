//
//  AddCardViewController.swift
//  creditcardjvalidation
//
//  Created by Arsalan on 30/05/2016.
//  Copyright © 2016 Arsalan. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController , UITextFieldDelegate,UIAlertViewDelegate{
    var firstDigit = Int()
//    var cardNumber: Int!
//    var zipCode : Int!
//    var expDate : NSDate!
    
    
    @IBOutlet weak var cardtxtField: UITextField!
    @IBOutlet weak var ziptxtField: UITextField!
    @IBOutlet weak var cardLabel: UILabel!
    
    @IBOutlet weak var nameTextfiled: UITextField!
    @IBOutlet weak var datetextfield: UITextField!
    @IBOutlet weak var datePckrview: UIDatePicker!
    
    @IBAction func datetxtField(sender: UITextField) {
        datetextfield.text = ""
            let datePickerView:UIDatePicker = UIDatePicker()
            
            datePickerView.datePickerMode = UIDatePickerMode.Date
            
            sender.inputView = datePickerView
        

            datePickerView.addTarget(self, action: #selector(self.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)

    }
    
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        dateFormatter.dateFormat = "MM      /  yyyy"
        datetextfield.text = dateFormatter.stringFromDate(sender.date)
        
        
        

        
//        println("year:\(year) , weekday:\(weekDay)")
    }
    
    
    @IBAction func saveButton(sender: UIButton) {
        if (cardtxtField.text?.characters.count)! < 13 || (ziptxtField.text?.characters.count)! < 3 || (nameTextfiled.text?.isEmpty)!  || (datetextfield.text?.isEmpty)! {
            let alertView = UIAlertView(title: "Alert", message: "Invalid Entry?", delegate: self, cancelButtonTitle: "Try Again")
            
            // Configure Alert View
            alertView.tag = 1
            
            // Show Alert View
            alertView.show()
            
//            if alertView.tag == 1 {
//                if sender == 0 {
//                    print("The user is okay.")
//                } else {
//                    print("The user is not okay.")
//                }
//            }
        } else {
//            let card : Int = Int(cardtxtField.text!)!
//            let zip : Int = Int(ziptxtField.text!)!
        let alertView = UIAlertView(title: "Alert", message: "Name:\(nameTextfiled.text!) \nCard Number:\(cardtxtField.text!) \n Zip:\(ziptxtField.text!) \n Exp Date: \(datetextfield.text!) ", delegate: self, cancelButtonTitle: "OK")
        
        
        alertView.show()
        
        }
        
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hide picker 
        datePckrview.hidden = true
        //cardtxtField.delegate = self
        //        view.backgroundColor = UIColor.blueColor()
        // Do any additional setup aftera loading the view.
        
        // border colour
        
        //        cardtxtField.layer.borderColor = UIColor.blackColor().CGColor;
        //        cardtxtField.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue:0, alpha: 1.0 ).CGColor
        //        cardtxtField.layer.borderWidth = CGFloat(1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print(cardtxtField.text?.characters.count,"txt field ")
        print(string.characters.count,"string count")
//        print(firstDigit)
        // range hold whole text while strig holds text to be replaced
        
        
        
        
        
        
        //  for empty filed set blank    //
        if (string.characters.count == 0 && (cardtxtField.text?.characters.count == 1)){
            //            let tes = cardtxtField.text?.rangeOfString(" ")
            //            print(tes)
            
            cardLabel.text = " "
            
            
        }

        
     
        
        
        
        if (range.length == 1 && string.isEmpty){
            print("Used Backspace")
            return true
        }
        
        let disabledCharacters:NSCharacterSet = NSCharacterSet(charactersInString: "1234567890")
        let disstring = String(disabledCharacters)
        let x = disstring.characters.count
        for (var i:Int = 0; i < x; ++i) {
            let c = (string as NSString).characterAtIndex(i)
            if !(disabledCharacters.characterIsMember(c))  {
                print("Can't use that character ***")
                return false
            }

            
            if textField == cardtxtField {
                //    detect first digit  //
                if (string.characters.count == 1 && (cardtxtField.text?.isEmpty)!){
                    //            let tes = cardtxtField.text?.rangeOfString(" ")
                    //            print(tes)
                    let a1 = string.characters.prefix(1)
                    let a2 = String(a1)
                    firstDigit = Int(a2)!
                    print(firstDigit, "First digit ")
                    
                    
                    
                }
                
                
                
                
                
                switch firstDigit {
                case 4:         cardLabel.text = "Visa Card"
                case 3:         cardLabel.text = "American Express"
                case 5:         cardLabel.text = "MasterCard"
                case 8:         cardLabel.text = "Discover"
                    
                default:    cardLabel.text = " "
                }
                
                
                return !(textField.text?.characters.count == 16 && string != "")
            }
 
            
          
            
            
                return !(textField.text?.characters.count == 4 && string != "")
                
                
                
                
            
            
            
            
        }
        
        
        
        
        //        let newCharacters = NSCharacterSet(charactersInString: string)
        //        let digitonly = NSCharacterSet.decimalDigitCharacterSet().isSupersetOfSet(newCharacters)
        //        return digitonly
        
        return true
        
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
