//
//  ViewController.swift
//  LoginFacebook
//
//  Created by Saad Fikri on 21/12/2016.
//  Copyright © 2016 Saad Fikri. All rights reserved.
//

import UIKit
import FBSDKLoginKit
class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let buttonFacebook = FBSDKLoginButton()
        
         buttonFacebook.frame = CGRect(x:20,y:100,width:view.frame.width - 30,height:40)
        self.view.addSubview(buttonFacebook)
       
        buttonFacebook.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!){
        print("didlogout")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("Login Successful")
        
    }


}

