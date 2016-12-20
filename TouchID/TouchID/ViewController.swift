//
//  ViewController.swift
//  TouchID
//
//  Created by Saad Fikri on 20/12/2016.
//  Copyright © 2016 Saad Fikri. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
           }
    
    @IBAction func TouchIDButton(_ sender: Any) {
        
        let context = LAContext()
        
        var error: NSError?
        
        if context.canEvaluatePolicy(
            LAPolicy.deviceOwnerAuthenticationWithBiometrics,
            error: &error) {
            
           
            context.evaluatePolicy(
                LAPolicy.deviceOwnerAuthenticationWithBiometrics,
                localizedReason: "Access requires authentication",
                reply: {(success, error) in
                    DispatchQueue.main.async {
                        
                        if error != nil {
                            
                            switch error!._code {
                                
                            case LAError.Code.systemCancel.rawValue:
                                self.alertUser("Session cancelled",
                                               err: error?.localizedDescription)
                                
                            case LAError.Code.userCancel.rawValue:
                                self.alertUser("Please try again",
                                               err: error?.localizedDescription)
                                
                            case LAError.Code.userFallback.rawValue:
                                self.alertUser("Authentication",
                                               err: "Password option selected")
                                
                                
                            default:
                                self.alertUser("Authentication failed",
                                               err: error?.localizedDescription)
                            }
                            
                        } else {
                            self.alertUser("Authentication Successful",
                                           err: "Congratulations")
                        }
                    }
            })
            
        } else {
            // Device cannot use TouchID
            switch error!.code{
                
            case LAError.Code.touchIDNotEnrolled.rawValue:
                alertUser("TouchID is not enrolled",
                          err: error?.localizedDescription)
                
            case LAError.Code.passcodeNotSet.rawValue:
                alertUser("A passcode has not been set",
                          err: error?.localizedDescription)
                
            default:
                alertUser("TouchID not available",
                          err: error?.localizedDescription)
                
            }
        }

        
    }
    func alertUser(_ msg: String, err: String?) {
        let alert = UIAlertController(title: msg,
                                      message: err,
                                      preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true,
                     completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

