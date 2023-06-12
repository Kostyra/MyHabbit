

import UIKit



final class HabitCollectionViewCell: UICollectionViewCell {
    
    var buttonTappedHandler: (() -> Void)?
    var habit: Habit?
    
    static let idCVC = "HabitCollectionViewCell"
    
    let imageCheckMark = UIImage(systemName: "checkmark.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 38))
    let imageNotCheckMark = UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 38))
    
     var buttonActive = false
    
    
    private lazy var textLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var textEveryDay: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 12)
        return text
    }()
    
    private lazy var textCount: UILabel = {
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
        contentView.addSubview(textEveryDay)
        contentView.addSubview(textCount)
        contentView.addSubview(imageCheckButton)
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textLabel.heightAnchor.constraint(equalToConstant: 20),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            textEveryDay.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 4),
            textEveryDay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textEveryDay.widthAnchor.constraint(equalToConstant: 200),
            textEveryDay.heightAnchor.constraint(equalToConstant: 12),
            
            textCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            textCount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textCount.widthAnchor.constraint(equalToConstant: 100),
            textCount.heightAnchor.constraint(equalToConstant: 12),
            
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
        
        textEveryDay.text = "Каждый день в " + date.string(from: (habit.date))
        textEveryDay.textColor = .systemGray2
        
        textCount.text = "Счетчик: " + String(habit.trackDates.count)
        textCount.textColor = .systemGray
         
        imageCheckButton.tintColor = habit.color
        if habit.isAlreadyTakenToday == true {
             imageCheckButton.setImage(imageCheckMark, for: .normal)
            
//            imageCheckButton.isUserInteractionEnabled = false
         } else {
             imageCheckButton.setImage(imageNotCheckMark, for: .normal)
//             imageCheckButton.isUserInteractionEnabled = true
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

        var timePicler = Date()
        var nameText = String()
        var colorPicler = UIColor()
        var trackCheckDates = [Date]()

    @objc  func buttonPressChangeColor () {
        guard let habit = habit else {return}
        if habit.isAlreadyTakenToday == false {
            HabitsStore.shared.track(habit)
        }
        buttonTappedHandler?()
    }
    
}

