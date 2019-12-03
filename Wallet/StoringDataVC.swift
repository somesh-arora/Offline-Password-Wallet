//
//  StoringDataVC.swift
//  Wallet
//
//  Created by Somesh Arora on 9/23/17.
//  
//

import UIKit
import CoreData

class StoringDataVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var heading: UITextField!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    @IBAction func backButton(_ sender: Any) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SelectActionVC") as! SelectActionVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func saveData(_ sender: Any) {
        let userNameText: String = userName.text!
        let userPasswodText: String = password.text!
        let userEmailText: String = email.text!
        let userHeadingText: String = heading.text!
        let userNotesText: String = notes.text!
        if(userName.text != "" && password.text != "" && heading.text != "") {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Information", into: context)
            newUser.setValue(userNameText, forKey: "userName")
            newUser.setValue(userPasswodText, forKey: "password")
            newUser.setValue(userNotesText, forKey: "notes")
            newUser.setValue(userEmailText, forKey: "email")
            newUser.setValue(userHeadingText, forKey: "heading")
            
            do {
                try context.save()
                let alert = UIAlertController(title: "Success!", message: "Data saved successfully", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"Got It!", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } catch {
                let alert = UIAlertController(title: "Something went wrong!", message: "\(error)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"Got It!", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            let VC = self.storyboard?.instantiateViewController(withIdentifier: "SelectActionVC") as! SelectActionVC
            self.navigationController?.pushViewController(VC, animated: true)
            
        }
        if(userName.text == "" || password.text == "" || heading.text == "") {
            let alert = UIAlertController(title: "Requirements not fulfilled!", message: "Make sure all mandatory fields contain valid values", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Got It!", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
