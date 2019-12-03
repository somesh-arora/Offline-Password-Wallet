//
//  FetchDataVC.swift
//  Wallet
//
//  Created by Somesh Arora on 9/23/17.
//  
//

import UIKit
import CoreData

class FetchDataVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var fetchDataTV: UITableView!
    @objc var infoArray: [Information] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.clear
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            infoArray = try context.fetch(Information.fetchRequest())
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "SelectActionVC") as! SelectActionVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let Heading  = infoArray[indexPath.row]
        cell.textLabel?.text = Heading.heading
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "ViewDataVC") as! ViewDataVC
        VC.emailstr = infoArray[indexPath.row].email
        VC.usernamestr = infoArray[indexPath.row].userName
        VC.headingstr = infoArray[indexPath.row].heading
        VC.notesstr = infoArray[indexPath.row].notes
        VC.passwordstr = infoArray[indexPath.row].password
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
            let user = infoArray[indexPath.row]
            context.delete(user)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                infoArray = try context.fetch(Information.fetchRequest())
            } catch {
                print(error)
            }
        }
        fetchDataTV.reloadData()
    }
}
