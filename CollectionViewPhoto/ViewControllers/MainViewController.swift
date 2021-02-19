//
//  MainViewController.swift
//  CollectionViewPhoto
//
//  Created by Yurik Nosachenko on 13.02.2021.
//

import UIKit
class MainViewController: UICollectionViewController {
    //количество ячеек в ряду
    let countCellsInRow: CGFloat = 2
    //отступ
    let indentOfSection = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    // свойство для работы с моделью
    var playersList = PlayersList()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionHeadersPinToVisibleBounds = true
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "DetailVC" else {return}
        let detailVC = segue.destination as! DetailViewController
        detailVC.playerFromMain = sender as? Player
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return playersList.sectionCount
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playersList.countInSection(section)
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
        //получение элемента списка PlayersList()
        let objectFromList = playersList.forCell(index: indexPath)
        
        cell.fillCell(player: objectFromList)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionTitle = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionTitle", for: indexPath) as! SectionReusableView
        if let title = playersList.titleForSectionAtIndexPath(indexPath) {
            sectionTitle.title = title
        }
        return sectionTitle
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let player = playersList.forCell(index: indexPath)
        performSegue(withIdentifier: "DetailVC", sender: player)
    }
    
}
extension MainViewController: UICollectionViewDelegateFlowLayout{
    //Размеры ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //общая ширина отступов
        let widthIndent = indentOfSection.left * (countCellsInRow + 1)
        
        //вычесленная ширина для ячеек сумарно
        let cellsWidth = collectionView.frame.width - widthIndent
        
        //ширина одной ячейки
        let widthCell = cellsWidth / countCellsInRow
        
        return CGSize(width: widthCell, height: widthCell)
    }
    
    //отступы ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return indentOfSection
    }
    //отступы ячеек вертикально
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return indentOfSection.left
    }
    //отступы ячеек горизонтально
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return indentOfSection.left
    }
}


