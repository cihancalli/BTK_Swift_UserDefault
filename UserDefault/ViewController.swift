//
//  ViewController.swift
//  UserDefault
//
//  Created by Cihan on 22.01.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldNote: UITextField!
    @IBOutlet weak var textFieldWhen: UITextField!
    @IBOutlet weak var labelNote: UILabel!
    @IBOutlet weak var labelWhen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let savedNote = UserDefaults.standard.object(forKey: "note")
        let savedWhen = UserDefaults.standard.object(forKey: "when")
        
        if let getNote = savedNote as? String {
            labelNote.text = "Work to do: \(getNote)"
        }
        
        if let getWhen = savedWhen as? String {
            labelWhen.text = "To When: \(getWhen)"
        }
        
    }
    @IBAction func buttonSeve(_ sender: Any) {
        UserDefaults.standard.set(textFieldNote.text!, forKey: "note")
        UserDefaults.standard.set(textFieldWhen.text!, forKey: "when")
        
        labelNote.text = "Work to do: \(textFieldNote.text!)"
        labelWhen.text = "To When: \(textFieldWhen.text!)"
    }
    @IBAction func buttonDelete(_ sender: Any) {
        let savedNote = UserDefaults.standard.object(forKey: "note")
        let savedWhen = UserDefaults.standard.object(forKey: "when")
        
        if (savedNote as? String) != nil  {
            UserDefaults.standard.removeObject(forKey: "note")
            labelNote.text  = "Work to do: "
        }
        
        if (savedWhen as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "when")
            labelWhen.text  = "To When: "
        }
    }
}

