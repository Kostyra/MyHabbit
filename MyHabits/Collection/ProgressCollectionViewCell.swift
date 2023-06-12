//
//  ProgressCollectionViewCell,.swift
//  MyHabits
//
//  Created by Юлия Филиппова on 25.04.2023.
//

import UIKit

final class ProgressCollectionViewCell: UICollectionViewCell {
    
    static let idHeader = "ProgressCollectionViewCell"
    
    private lazy var progresLine: UIProgressView = {
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
    
    private lazy var textPercent: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(Int(HabitsStore.shared.todayProgress*100))%"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    
    private func setupBar() {
        contentView.addSubview(textLabel)
        contentView.addSubview(progresLine)
        contentView.addSubview(textPercent)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            textLabel.heightAnchor.constraint(equalToConstant: 14),
            textLabel.widthAnchor.constraint(equalToConstant: 200),
            
            textPercent.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textPercent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            textPercent.heightAnchor.constraint(equalToConstant: 14),
            
            progresLine.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            progresLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progresLine.heightAnchor.constraint(equalToConstant: 7),
            progresLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor ,constant: -16)
        ])
        
    }
        override init(frame: CGRect) {
            super.init(frame: .zero)
            setupBar()
            contentView.layer.cornerRadius = 10
        }
    
//    func dataHabits(with newsHabits:String) {
// 
//        
//        textLabel.text = "Счетчик: "
//        
//    }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func setup(){
        textPercent.text = "\(Int(HabitsStore.shared.todayProgress*100))%"
        progresLine.progress = HabitsStore.shared.todayProgress
    }
}
