//
//  DefaultHeader.swift
//  BostaDemo
//
//  Created by Ahmed Alabiad on 21/12/2024.
//

import Foundation
import UIKit

class DefaultHeader: UIView {
    
    let titleLabel: UILabel
    
    init(title: String) {
        titleLabel = UILabel()
        super.init(frame: .zero)
        setupView(title: title)
    }
    
    required init?(coder: NSCoder) {
        titleLabel = UILabel()
        super.init(coder: coder)
        setupView(title: "")
    }
    
    private func setupView(title: String) {
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = CGRect(x: 0, y: 0, width: super.bounds.width, height: super.bounds.height)
    }
}
