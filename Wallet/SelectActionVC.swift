//
//  SelectActionVC.swift
//  Wallet
//
//  Created by Somesh Arora on 9/23/17.
//  
//

import UIKit

class SelectActionVC: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async() {
            self.navigationController?.isNavigationBarHidden = true
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
        }
    }
    
    @IBAction func viewData(_ sender: Any) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "FetchDataVC") as! FetchDataVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func addData(_ sender: Any) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "StoringDataVC") as! StoringDataVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
}
