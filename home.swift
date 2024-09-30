//
//  home.swift
//  Voluntracker
//
//  Created by Bhattarai, Diya on 1/29/24.
//

import UIKit

class home: UIViewController {
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var goal: UILabel!
    var g = ""
    @IBOutlet var hoursLabel: UILabel!
   var hours = 0
    @IBOutlet var inc: UIButton!
    var goalSet = false;
    var user = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        end();
        hoursLabel.text = "\(hours) hours"
        UserDefaults.standard.set(hours, forKey: user + "hours")
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
    
    @IBAction func addHours(_ sender: Any)
    {
        
        goal.text = "\(g)"
        hours+=1
        hoursLabel.text = "\(hours) hours"
        UserDefaults.standard.set(hours, forKey: user + "hours")
        if(Int(g) == hours)
        {
            let alert = UIAlertController(title: "Goal Reached!", message: "Congrats!", preferredStyle: .alert)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func end()
    {
        if UserDefaults.standard.integer(forKey: user + "g") == 0
        {
            let alert = UIAlertController(title: "Goal", message: "Enter your goal hours", preferredStyle: .alert)

            //2. Add the text field. You can configure it however you need.
            alert.addTextField { (textField) in
                textField.text = "0"
            }

            // 3. Grab the value from the text field, and print it when the user clicks OK.
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] action in
                var textField = alert.textFields![0] // Force unwrapping because we know it exists.
                g = textField.text!;
                
                UserDefaults.standard.set(g, forKey: user + "g")
                //g = UserDefaults.standard.integer(forKey:user)
                goal.text = "\(g)"
                //goalSet = true;
                //print("Text field: \(textField.text!)")
            }))

            // 4. Present the alert.
            self.present(alert, animated: true, completion: nil)
            
            
       }
        else
        {
            g = String(UserDefaults.standard.integer(forKey: user + "g"))
            goal.text = "\(g)"
            hours = UserDefaults.standard.integer(forKey: user + "hours")
            hoursLabel.text = "\(hours) hours"
        }
        
        
            //1. Create the alert controller.
            
        }
        
        
        
        
        
    }

