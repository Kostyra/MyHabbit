

import UIKit



final class HabitCollectionViewCell: UICollectionViewCell {
    
    var buttonTappedHandler: (() -> Void)?
    var habit: Habit?
    
    static let idCVC = "HabitCollectionViewCell"
    
    private let imageCheckMark = UIImage(systemName: "checkmark.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 38))
    private let imageNotCheckMark = UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 38))
    
     var buttonActive = false
    
    
    private lazy var textLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var textEveryDayLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 12)
        return text
    }()
    
    private lazy var textCountLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 13)
        return text
    }()
    
     lazy var imageCheckButton: UIButton = {
 
        let image = UIButton()
        image.setImage(imageNotCheckMark, for: .normal)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.addTarget(self, action: #selector(buttonPressChangeColor), for: .touchUpInside)
        return image
    }()
    
    private func setupCVC() {
        contentView.addSubview(textLabel)
        contentView.addSubview(textEveryDayLabel)
        contentView.addSubview(textCountLabel)
        contentView.addSubview(imageCheckButton)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textLabel.heightAnchor.constraint(equalToConstant: 20),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            textEveryDayLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 4),
            textEveryDayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textEveryDayLabel.widthAnchor.constraint(equalToConstant: 200),
            textEveryDayLabel.heightAnchor.constraint(equalToConstant: 12),
            
            textCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            textCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textCountLabel.widthAnchor.constraint(equalToConstant: 100),
            textCountLabel.heightAnchor.constraint(equalToConstant: 12),
            
            imageCheckButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageCheckButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            imageCheckButton.heightAnchor.constraint(equalToConstant: 38),
            imageCheckButton.widthAnchor.constraint(equalToConstant: 38),
        ])
    }

     func dataHabits(with habit:Habit) {
        self.habit = habit
        let date = DateFormatter()
        date.dateFormat = "h:mm a"
        textLabel.text = habit.name
        textLabel.textColor = habit.color
        
        textEveryDayLabel.text = "Каждый день в " + date.string(from: (habit.date))
        textEveryDayLabel.textColor = .systemGray2
        
        textCountLabel.text = "Счетчик: " + String(habit.trackDates.count)
        textCountLabel.textColor = .systemGray
         
        imageCheckButton.tintColor = habit.color
        if habit.isAlreadyTakenToday == true {
             imageCheckButton.setImage(imageCheckMark, for: .normal)
         } else {
             imageCheckButton.setImage(imageNotCheckMark, for: .normal)
         }  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCVC()
        contentView.layer.cornerRadius = 10
    }

    @objc  func buttonPressChangeColor () {
        guard let habit = habit else {return}
        if habit.isAlreadyTakenToday == false {
            HabitsStore.shared.track(habit)
        }
        buttonTappedHandler?()
    }
    
}

