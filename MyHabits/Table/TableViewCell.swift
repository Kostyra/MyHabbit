//
//  TableViewCell.swift
//  MyHabits
//
//  Created by Юлия Филиппова on 02.05.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    static var idTable = "TableViewCell"
    
    private lazy var activityLabel: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var checkHabit: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = UIColor(named: "сolorPink")
        text.text = "✔︎"
        return text
    }()
    
    private func tableActitvity() {
        addSubview(activityLabel)
        addSubview(checkHabit)
        
        NSLayoutConstraint.activate([
            activityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor , constant: 10),
            activityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            activityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            activityLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            checkHabit.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            checkHabit.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    func dataTable(_ dataDate:HabitsStore ){
        let date = DateFormatter()
        date.dateFormat = "h:mm a"
        //activityLabel.text = date.string(from: (dataDate.shared.dates))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        tableActitvity()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func timeHabit(index: Int, check:Bool) {
        activityLabel.text = HabitsStore.shared.trackDateString(forIndex: index)
        checkHabit.isHidden = !check
    }

}
