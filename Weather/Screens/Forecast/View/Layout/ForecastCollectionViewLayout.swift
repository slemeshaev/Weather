//
//  ForecastCollectionViewLayout.swift
//  Weather
//
//  Created by Stanislav Lemeshaev on 22.08.2023.
//  Copyright © 2023 slemeshaev. All rights reserved.
//

import UIKit

class ForecastCollectionViewLayout: UICollectionViewLayout {
    // MARK: - Properties
    private let columnsCount: Int = 2
    private let cellHeight: CGFloat = 128
    
    private var cacheAttributes = [IndexPath: UICollectionViewLayoutAttributes]()
    private var totalCellsHeight: CGFloat = 0
    
    // MARK: - Overrides
    override func prepare() {
        calculateLayout()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cacheAttributes.values.filter { attributes in
            return rect.intersects(attributes.frame)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath]
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: collectionView?.frame.width ?? 0, height: totalCellsHeight)
    }
    
    // MARK: - Private
    private func calculateLayout() {
        cacheAttributes = [:]
        
        guard let collectionView = collectionView else {
            return
        }
        
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        
        guard itemsCount > 0 else {
            return
        }
        
        let bigCellWidth = collectionView.frame.width
        let smallCellWidth = collectionView.frame.width / CGFloat(columnsCount)
        
        var lastX: CGFloat = 0
        var lastY: CGFloat = 0
        
        for index in 0..<itemsCount {
            let indexPath = IndexPath(item: index, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            let isBigCell = (index + 1) % (columnsCount + 1) == 0
            
            if isBigCell {
                attributes.frame = CGRect(x: 0, y: lastY, width: bigCellWidth, height: cellHeight)
                lastY += cellHeight
            } else {
                attributes.frame = CGRect(x: lastX, y: lastY, width: smallCellWidth, height: cellHeight)
                
                let isLastColumn = (index + 2) % (columnsCount + 1) == 0 || index == itemsCount - 1
                
                if isLastColumn {
                    lastX = 0
                    lastY += cellHeight
                } else {
                    lastX += smallCellWidth
                }
            }
            
            cacheAttributes[indexPath] = attributes
            totalCellsHeight = lastY
        }
    }
}
