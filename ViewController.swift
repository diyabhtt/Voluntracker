//
//  ViewController.swift
//  Voluntracker
//
//  Created by Bhattarai, Diya on 1/10/24
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var userField: UITextField!
    @IBOutlet var passField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var createButton: UIButton!
    @IBOutlet var forgotButton: UIButton!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        label.removeFromSuperview()
        label.text = ""
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func unwindToLogin(unwindSegue: UIStoryboardSegue)
    {
        
    }
    
    

    @IBAction func login(_ sender: Any)
    {
        
        
        guard let user = userField.text else {return}
        guard let pass = passField.text else {return}
        
        if UserDefaults.standard.string(forKey: user) == nil
        {
            view.addSubview(label)
            label.text = "Account does not exist"
            
       }
        else
        {
            if pass == UserDefaults.standard.string(forKey:user)
            {
                performSegue(withIdentifier: "log", sender: loginButton)
                
                
            }
            else
            {
                label.text = "Password is incorrect"
            }
            
            
            print("hi")
            //label.text = "Account Created"
           
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let button = sender as? UIButton
        {
            
            if button == loginButton
            {
                segue.destination.title = "Welcome \(userField.text!)"
                let myVc = segue.destination as! home
                myVc.user = userField.text!
            }
            
            
        }
    
                
    }
    
    
    
}

