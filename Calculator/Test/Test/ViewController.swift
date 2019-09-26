//
//  ViewController.swift
//  Test
//
//  Created by Basith on 29/07/19.
//  Copyright © 2019 TechPro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var numbersonscreen:Double=0;
    var previuosNumber:Double=0;
    var performingMath=false
    var operation=0;
    
    func addInt(_ numberonscreen:Double,_ previuosNumber: Double) -> Double
    {
        return numbersonscreen + previuosNumber
    }
    
    
    func sub(_ numberonscreen:Double,_ previuosNumber: Double) -> Double
    {
        return previuosNumber - numbersonscreen
    }
    
    func multi(_ numberonscreen:Double,_ previuosNumber:Double) -> Double
    {
        return numbersonscreen * previuosNumber
    }
    
    func div(_ numberonscreen:Double,_ previuosNumber:Double) -> Double
    {
        return  previuosNumber / numbersonscreen
    }
    
    @IBAction func numbers(_ sender: UIButton)
        {
            if performingMath==true
            {
                label.text=String(sender.tag-1)
                numbersonscreen = Double(self.label.text!)!
                self.performingMath=false
            }
            else{
                label.text=label.text! + String(sender.tag-1)
                numbersonscreen = Double(self.label.text!)!
            }
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = ""
    }


    @IBAction func operation(_ sender: UIButton) {
        if label.text != "" && sender.tag != 16 && sender.tag != 15
        {
            previuosNumber = Double(self.label.text!)!
            operation = sender.tag
            
            switch(operation)
            {
            case 11 :
                label.text = "/"
            case 12 :
                label.text = "x"
            case 13 :
                label.text = "-"
            case 14 :
                label.text = "+"
            default :
                print("error")
            }
            
            operation=sender.tag
            self.performingMath=true
        }
        else if sender.tag==15
        {
            var mathfunction:(Double,Double) -> Double
            
            switch(operation)
            {
                
            case 11 :
                mathfunction = div
                label.text=String(mathfunction(numbersonscreen,previuosNumber))
                
            case 12 :
                mathfunction = multi
                label.text=String(mathfunction(numbersonscreen,previuosNumber))
                
            case 14 :
                mathfunction = addInt
                label.text=String(mathfunction(numbersonscreen,previuosNumber))
                
            case 13 :
                mathfunction = sub
                label.text=String(mathfunction(numbersonscreen,previuosNumber))
            default :
                print("invalid")
            }
        }
            
        else if sender.tag==16
        {
            label.text=""
            previuosNumber=0;
            numbersonscreen=0;
            operation=0;
        }
        
    }
    
}

