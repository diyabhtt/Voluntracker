//
//  createAccountClassViewController.swift
//  Voluntracker
//
//  Created by Bhattarai, Diya on 1/25/24.
//

import UIKit

class createAccountClassViewController: UIViewController {

    @IBOutlet var createButton: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var userField: UITextField!
    @IBOutlet var passField: UITextField!
    let defaults = UserDefaults.standard
    var password = "";
    var username = "";
    override func viewDidLoad()
    {
        label.removeFromSuperview()
        super.viewDidLoad()

        
        clearUserDefaults()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createClicked(_ sender: Any)
    {
        view.addSubview(label)
        guard let user = userField.text else {return}
        guard let pass = passField.text else {return}
        
        if UserDefaults.standard.string(forKey: user) != nil
        {
            label.text = "Account Exists"
       }
        else
        {
            print("hi")
            label.text = "Account Created"
            UserDefaults.standard.set(pass, forKey: user)
            print(UserDefaults.standard.string(forKey: user))
        }
        
        
        
        
    }
    @IBAction func userType(_ sender: UITextView)
    {
        //username = sender.text
        
    }
    
    @IBAction func passType(_ sender: UITextView)
    {
        //password = sender.text
    }
    
    private func clearUserDefaults()
    {
        defaults.dictionaryRepresentation()
            .keys
            .forEach(defaults.removeObject(forKey:))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
