//
//  LaunchScreenVC.swift
//  Wallet
//
//  Created by Somesh Arora on 10/29/17.
// 
//

import UIKit
import CoreData

class LaunchScreenVC: UIViewController
{

    @objc var NameArray: [Name] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do
        {
            NameArray = try context.fetch(Name.fetchRequest())
        }
        catch
        {
            print(error)
        }

        perform(#selector(LaunchScreenVC.showNavController), with: nil, afterDelay: 3)

    }
    
    @objc func showNavController()
    {
        
       if(NameArray.count == 0)
        {
            self.performSegue(withIdentifier: "UserNameVC", sender: self)
        }
        else
        {
            performSegue(withIdentifier: "ViewController", sender: self)
        }
    }


   
}
