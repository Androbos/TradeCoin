//
//  ViewController.swift
//  TradeCoin
//
//  Created by otto on 6/25/18.
//  Copyright © 2018 SA2MG. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginEnabledLable: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = emailTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText)
        _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordText)
        
        _ = loginViewModel.isValid.bind( to: loginButton.rx.isEnabled)
        
        _ = loginViewModel.isValid.subscribe(onNext:  { [unowned self] isValid in
            self.loginEnabledLable.text = isValid ? "Enabled" : "Not Enabled"
            self.loginEnabledLable.textColor = isValid ? .green : .red
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

