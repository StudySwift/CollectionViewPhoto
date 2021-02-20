//
//  AddNewPlayerViewController.swift
//  CollectionViewPhoto
//
//  Created by Yurik Nosachenko on 20.02.2021.
//

import UIKit

class AddNewPlayerViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension AddNewPlayerViewController: UITextFieldDelegate {
    //скрытие клавиатуры по нажатию накнопку DONE
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}