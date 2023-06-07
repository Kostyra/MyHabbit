//
//  ProgressCollectionViewCell,.swift
//  MyHabits
//
//  Created by Юлия Филиппова on 25.04.2023.
//

import UIKit

class ProgressCollectionViewCell: UICollectionReusableView {
    
    static let idHeader = "ProgressCollectionViewCell"
//    private lazy var progresLine: UIProgressView = {
//        let line = UIProgressView()
//        line.translatesAutoresizingMaskIntoConstraints = false
//        return line
//    }()
    
    private lazy var textLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Все получится"
        label.textColor = .blue
        return label
    }()
    
    private func setupBar() {
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            textLabel.heightAnchor.constraint(equalToConstant: 12),
            textLabel.widthAnchor.constraint(equalToConstant: 115),
            
//            progresLine.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5),
//            progresLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
//            progresLine.heightAnchor.constraint(equalToConstant: 32),
//            progresLine.trailingAnchor.constraint(equalTo: progresLine.trailingAnchor ,constant: -16)
        ])
        
    }
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupBar()

        }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
