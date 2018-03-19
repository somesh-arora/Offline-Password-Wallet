//
//  UserNameVC.swift
//  Wallet
//
//  Created by Somesh Arora on 10/29/17.
//  
//

import UIKit
import CoreData

class UserNameVC: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func Continue(_ sender: Any)
    {
        let userNameText: String = userName.text!
        if(userName.text != "")
        {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Name", into: context)
            newUser.setValue(userNameText, forKey: "name")
            do
            {
                try context.save()
                print("Saved")
            }
            catch
            {
                
            }
            performSegue(withIdentifier: "ViewController", sender: self)
            
        }
        else
        {
            let alert = UIAlertController(title: "Provide Valid Name!", message: "Please enter your name and press continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Got It!", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)


        }
    
    }

   }
