
import UIKit

final class HabitCheckTableViewCell: UITableViewCell {

    static let idTableHabitCheck = "HabitCheckTableViewCell"
    
    private lazy var activityLabel: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private func tableActitvity() {
        addSubview(activityLabel)
        
        NSLayoutConstraint.activate([
            activityLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor , constant: 10),
            activityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            activityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            activityLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    
    func dataTable(_ dataDate:HabitsStore ){
        let date = DateFormatter()
        date.dateFormat = "h:mm a"
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
    }

}
