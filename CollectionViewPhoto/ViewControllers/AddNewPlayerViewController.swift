//
//  AddNewPlayerViewController.swift
//  CollectionViewPhoto
//
//  Created by Yurik Nosachenko on 20.02.2021.
//

import UIKit

class AddNewPlayerViewController: UITableViewController {

    @IBOutlet weak var imageOT: UIImageView!
    
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
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            addPhoto()
        }else{
            view.endEditing(true)
        }
    }
}

// MARK: Работа с TextField-ами

extension AddNewPlayerViewController: UITextFieldDelegate {
    //скрытие клавиатуры по нажатию накнопку DONE
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: Работа с добавлением новых изображений
extension AddNewPlayerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //Alert-уведомление
    private func addPhoto() {
        let firstAlert = UIAlertController(title: "Добавить фото?", message: "", preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .destructive, handler: nil)
        let addAction = UIAlertAction(title: "Да", style: .default) { _ in
            self.chooseAddImage(source: .photoLibrary)
        }
        firstAlert.addAction(closeAction)
        firstAlert.addAction(addAction)
        present(firstAlert, animated: true, completion: nil)
    }
    //функция выбора изображения(библиотека или камера)
    func chooseAddImage(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = source
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //метод в котором присваиваем аутлету ImageOT изображение бибилиотеки
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chooseImage = info[.originalImage] as! UIImage
        imageOT.image = chooseImage
        dismiss(animated: true, completion: nil)
    }
}
