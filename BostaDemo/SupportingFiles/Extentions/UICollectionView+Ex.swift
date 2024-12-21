//
//  UICollectionView+Ex.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import UIKit

extension UICollectionView {
    private func reuseIndentifier<T>(for type: T.Type) -> String {
        return String(describing: type)
    }

    public func register<T: UICollectionViewCell>(cell: T.Type) {
        register(UINib(nibName: reuseIndentifier(for: cell), bundle: nil), forCellWithReuseIdentifier: reuseIndentifier(for: cell))
    }

    
    public func register<T: UICollectionReusableView>(headerView: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIndentifier(for: headerView))
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIndentifier(for: type), for: indexPath) as? T else {
            fatalError("Failed to dequeue cell.")
        }

        return cell
    }

    public func dequeueReusableHeaderView<T: UICollectionReusableView>(for type: T.Type, indexPath: IndexPath) -> T {
        
        guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader ,withReuseIdentifier: reuseIndentifier(for: type),for: indexPath)as? T else {
            fatalError("Failed to dequeue header view.")
        }

        return view
    }
    
    public func dequeueReusableFooterView<T: UICollectionReusableView>(for type: T.Type, indexPath: IndexPath) -> T {
        
        guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter ,withReuseIdentifier: reuseIndentifier(for: type),for: indexPath)as? T else {
            fatalError("Failed to dequeue header view.")
        }

        return view
    }
    
}
