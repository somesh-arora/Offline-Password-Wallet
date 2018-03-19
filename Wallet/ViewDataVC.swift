//
//  ViewDataVC.swift
//  Wallet
//
//  Created by Somesh Arora on 9/23/17.
//
//

import UIKit
import CoreData

class ViewDataVC: UIViewController
{

    @IBOutlet weak var Heading: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
     @IBOutlet weak var UpdateButton: UIButton!
    
   
    @IBAction func done(_ sender: Any)
    {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SelectActionVC") as! SelectActionVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func edit(_ sender: Any)
    {
        email.isEnabled = true
        email.backgroundColor = UIColor.white
        userName.isEnabled = true
        userName.backgroundColor = UIColor.white
        password.isEnabled = true
        password.backgroundColor = UIColor.white
        Heading.isEnabled = true
        Heading.backgroundColor = UIColor.white
        notes.isEditable = true
        notes.backgroundColor = UIColor.white
        cancelButton.isHidden = false
        UpdateButton.isHidden = false
        doneButton.isHidden = true
    }
    
    @IBAction func cancel(_ sender: Any)
    {
        notes.text = notesstr
        userName.text = usernamestr
        password.text = passwordstr
        Heading.text = headingstr
        email.text = emailstr
        email.isEnabled = false
        userName.isEnabled = false
        password.isEnabled = false
        Heading.isEnabled = false
        notes.isEditable = false
        cancelButton.isHidden = true
        UpdateButton.isHidden = true
        doneButton.isHidden = false
        email.backgroundColor = UIColor.clear
        userName.backgroundColor = UIColor.clear
        password.backgroundColor = UIColor.clear
        Heading.backgroundColor = UIColor.clear
        notes.backgroundColor = UIColor.clear
    }
    
    @IBAction func update(_ sender: Any)
    {
        email.isEnabled = false
        userName.isEnabled = false
        password.isEnabled = false
        Heading.isEnabled = false
        notes.isEditable = false
        cancelButton.isHidden = true
        UpdateButton.isHidden = true
        doneButton.isHidden = false
        email.backgroundColor = UIColor.clear
        userName.backgroundColor = UIColor.clear
        password.backgroundColor = UIColor.clear
        Heading.backgroundColor = UIColor.clear
        notes.backgroundColor = UIColor.clear
        
        var updateUserName = ""
        var updatePassword = ""
        var updateHeading = ""
        var updateEmail = ""
        var updateNotes = ""
        updateUserName = userName.text!
        updatePassword = password.text!
        updateEmail = email.text!
        updateNotes = notes.text!
        updateHeading = Heading.text!
        
        
        
    }
    
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    @objc var usernamestr: String!
    @objc var passwordstr: String!
    @objc var headingstr: String!
    @objc var notesstr: String!
    @objc var emailstr: String!
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        notes.layer.borderWidth = 0.0
        userName.layer.borderWidth = 0.0
        password.layer.borderWidth = 0.0
        Heading.layer.borderWidth = 0.0
        email.layer.borderWidth = 0.0
        
        notes.layer.borderColor = UIColor.clear.cgColor
        password.layer.borderColor = UIColor.clear.cgColor
        userName.layer.borderColor = UIColor.clear.cgColor
        Heading.layer.borderColor = UIColor.clear.cgColor
        email.layer.borderColor = UIColor.clear.cgColor
        
       cancelButton.isHidden = true
        UpdateButton.isHidden = true
        doneButton.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.clear
        notes.text = notesstr
        userName.text = usernamestr
        password.text = passwordstr
        Heading.text = headingstr
        email.text = emailstr
        email.isEnabled = false
        userName.isEnabled = false
        password.isEnabled = false
        Heading.isEnabled = false
        notes.isEditable = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
}
