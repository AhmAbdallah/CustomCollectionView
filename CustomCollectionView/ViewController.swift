//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by Ahmed Abdallah on 10.12.2019.
//  Copyright © 2019 4A5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var cVWidth: NSLayoutConstraint!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
  }
}

extension ViewController {
  func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    cVWidth.constant = 5000
    scrollView.contentSize = collectionView.frame.size
    collectionView.register(UINib(nibName: CustomCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    
  }
}

extension ViewController: UICollectionViewDelegate {
  
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
    let row = indexPath.row
    cell.titleLBL.text = "\(row)"
    if row % 2 == 0 {
      cell.backgroundColor = .red
    } else {
      cell.backgroundColor = .green
    }
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      var item = UIScreen.main.bounds.width / 197
      item = round(item)
      return CGSize(width: (UIScreen.main.bounds.width - 16) / item, height: 900)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
}
