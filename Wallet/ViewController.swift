//
//  ViewController.swift
//  Wallet
//
//  Created by Somesh Arora on 9/23/17.
//  
//



/* Add an image (probably key image) to the table view with all the entries
Add alertView to following conditions:
 if(heading, username, password is empty, dont let user save the info, give him alert)
 if(tableentries == 0) alter user to enter the info to begin! also can add it to button viewdata! make button disable if count == 0
 when pressed save info! let user know that info is saved
 
 show loading something when fingerprint is authenticating
 
 show info button in the login screen with info about the app, add app version!
 
 probably add background image and blur effects
 
 test app throughly and make it bug free! make sure screens are laoding only once. 
 
 Add icons to the text fields!
 
 Allow user to update and delete entries
 
 May be introduce in app purchase where user can customize the app and store card details and add more fields and shit. Add images and make it more customizable. 2 factor authentication with 4 digit pin or text massage code! May be add notifications after certain period to remind user to change the password to be more secure! Maybe user gets text evertime the app is open so that user is aware of the activity! If biometric authentication failed 3 times! text user and notify, in this case, user need to verify using 2 factor authentication!
 
 
 
 May be add moving animation (Emitter) at the splash screen
 
 Make the app versatile for all device
 
 
 
 
 */




import UIKit
import LocalAuthentication
import CoreData



class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UILabel!
    @objc var NameArray: [Name] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        DispatchQueue.main.async()
        {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do
            {
                self.NameArray = try context.fetch(Name.fetchRequest())
            }
            catch
            {
                print(error)
            }
            let name = self.NameArray[0].name
            let formattedName = name! + "'s"
            self.nameTextField.text = formattedName

        }
    }
    @IBAction func Authenticate(_ sender: Any)
    {
        let context:LAContext = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Provide Touch ID to Access your Wallet", reply: {(wasSuccessful, Error) in
                if wasSuccessful
                {
                    self.performSegue(withIdentifier: "SelectActionVC", sender: self)
                }
                else
                {
                    // add alert here
                    let alert = UIAlertController(title: "Fingerprint Authentication Failed", message: "Fingerprint does not match", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title:"Got It!", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

