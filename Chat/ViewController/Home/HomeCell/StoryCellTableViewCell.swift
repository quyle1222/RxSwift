//
//  StoryCellTableViewCell.swift
//  Chat
//
//  Created by Tú Phạm on 16/02/2023.
//

import UIKit

class StoryCellTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    let cellReuseIdentifier = "StoryItemCollectionViewCell"
    let listItemFirstCell:[Int] = Array(0...5)
    let startPoint = CGPoint(x: -20, y: 0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 8
    }
    
    func setup(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: cellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
        DispatchQueue.main.async {
            self.collectionView.setContentOffset(self.startPoint, animated: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? StoryItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        let image = UIImage(named: "plus")
        if image != nil && indexPath.row == 0 {
            cell.image.image = image
            cell.setupForAddStoryItem()
            cell.textName.text = "Add Story"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItemFirstCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 100)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (!decelerate && scrollView == collectionView && collectionView.contentOffset == .zero) {
            DispatchQueue.main.async {
                self.collectionView.setContentOffset(self.startPoint, animated: true)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (scrollView == collectionView && collectionView.contentOffset == .zero) {
            DispatchQueue.main.async {
                self.collectionView.setContentOffset(self.startPoint, animated: true)
            }
        }
    }
    
}
