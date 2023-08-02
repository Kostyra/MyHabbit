//
//  ProgressCollectionViewCell,.swift
//  MyHabits
//
//  Created by Юлия Филиппова on 25.04.2023.
//

import UIKit

final class ProgressCollectionViewCell: UICollectionViewCell {
    
    static let idHeader = "ProgressCollectionViewCell"
    
    private lazy var progressLine: UIProgressView = {
        let line = UIProgressView(progressViewStyle: .bar)
        line.trackTintColor = .gray
        line.layer.cornerRadius = 5
        line.clipsToBounds = true
        line.progressTintColor = UIColor(named: "сolorPink")
        line.setProgress(HabitsStore.shared.todayProgress, animated: false)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var textLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Все получится"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var textPercentLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(Int(HabitsStore.shared.todayProgress*100))%"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    
    private func setupBar() {
        contentView.addSubview(textLabel)
        contentView.addSubview(progressLine)
        contentView.addSubview(textPercentLabel)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            textLabel.heightAnchor.constraint(equalToConstant: 14),
            textLabel.widthAnchor.constraint(equalToConstant: 200),
            
            textPercentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textPercentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            textPercentLabel.heightAnchor.constraint(equalToConstant: 14),
            
            progressLine.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            progressLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressLine.heightAnchor.constraint(equalToConstant: 7),
            progressLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor ,constant: -16)
        ])
    }
        override init(frame: CGRect) {
            super.init(frame: .zero)
            setupBar()
            contentView.layer.cornerRadius = 10
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func setup(){
        textPercentLabel.text = "\(Int(HabitsStore.shared.todayProgress*100))%"
        progressLine.progress = HabitsStore.shared.todayProgress
    }
}
