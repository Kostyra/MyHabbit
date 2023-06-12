
import UIKit

final class HabitViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    //MARK: - properties
    private let habit: Habit?

    private let imageCircle = UIImage(systemName: "circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))

    private lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.text = "НАЗВАНИЕ"
        name.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var textField: UITextField = {
       let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Name Habit"
        text.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        text.autocorrectionType = UITextAutocorrectionType.no
        text.clearButtonMode = UITextField.ViewMode.whileEditing
        text.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        text.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return text
    }()
    
    private lazy var colorCircleLabel: UILabel = {
       let color = UILabel()
        color.text = "ЦВЕТ"
        color.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        color.translatesAutoresizingMaskIntoConstraints = false
        return color
    }()
    
    private lazy var buttonCircle: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(imageCircle , for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.tintColor = .systemGray3
        button.addTarget(self, action: #selector(buttonColor), for:.touchUpInside)
        return button
    }()
    
    private lazy var timeLabel: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.text = "ВРЕМЯ"
        time.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return time
    }()
    
    private lazy var timeEveryDay: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.text = "Каждый день в "
        time.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return time
    }()
    
    private lazy var timeSavePicler: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.string(from: datePicler.date)
        let timeNow = dateFormatter.string(from: datePicler.date)
        time.text = timeNow
        time.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        time.textColor = UIColor(named: "сolorPink")

        return time
    }()
    
    private lazy var datePicler: UIDatePicker = {
        let picler = UIDatePicker()
        picler.translatesAutoresizingMaskIntoConstraints = false
        picler.datePickerMode = .time
        picler.preferredDatePickerStyle = .wheels
        picler.addTarget(self, action: #selector(changePicler), for: .valueChanged)
        return picler
    }()
    
    
    private lazy var buttonDelete: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.addTarget(self, action: #selector(removeHabit), for: .touchUpInside)
        return button
    }()
    
    
    private func habitView() {
        view.addSubview(nameLabel)
        view.addSubview(textField)
        view.addSubview(colorCircleLabel)
        view.addSubview(buttonCircle)
        view.addSubview(timeLabel)
        view.addSubview(timeEveryDay)
        view.addSubview(timeSavePicler)
        view.addSubview(datePicler)
        view.addSubview(buttonDelete)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 18),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -16),
            
            textField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.heightAnchor.constraint(equalToConstant: 22),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -16),
            
            colorCircleLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            colorCircleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colorCircleLabel.heightAnchor.constraint(equalToConstant: 18),
            colorCircleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -16),
            
            buttonCircle.topAnchor.constraint(equalTo: colorCircleLabel.bottomAnchor, constant: 15),
            buttonCircle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonCircle.heightAnchor.constraint(equalToConstant: 30),
            buttonCircle.widthAnchor.constraint(equalToConstant: 30),
            
            timeLabel.topAnchor.constraint(equalTo: buttonCircle.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timeLabel.heightAnchor.constraint(equalToConstant: 18),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -16),
            
            timeEveryDay.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15),
            timeEveryDay.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timeEveryDay.heightAnchor.constraint(equalToConstant: 22),
            
            timeSavePicler.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15),
            timeSavePicler.leadingAnchor.constraint(equalTo: timeEveryDay.trailingAnchor),
            timeSavePicler.heightAnchor.constraint(equalToConstant: 22),
            
            datePicler.topAnchor.constraint(equalTo: timeEveryDay.bottomAnchor, constant: 15),
            datePicler.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonDelete.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            buttonDelete.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //MARK: - life cycle
    init(habit: Habit?) {
           self.habit = habit
           super.init(nibName: nil, bundle: nil)
       }
    
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        habitView()
        initHabit()
        
        view.backgroundColor = UIColor(named: "tabBar")
        let buttonBack = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action:#selector(buttonBack))
        buttonBack.tintColor = UIColor(named: "сolorPink")
        navigationItem.leftBarButtonItem = buttonBack
        
        let buttonSave = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(buttonSave))
        buttonSave.tintColor = UIColor(named: "сolorPink")
        navigationItem.rightBarButtonItem = buttonSave
        
    }
    
    //MARK: - func
    
    private func initHabit() {
        if let habit = self.habit {
            // изменить привычку
            self.navigationItem.title = "Изменить"
            textField.text = habit.name
            buttonCircle.tintColor = habit.color
            datePicler.date = habit.date
            buttonDelete.isHidden = false
        } else {
            // создать привычку
            self.navigationItem.title = "Создать"
            buttonDelete.isHidden = true

        }
    }
    
    @objc private func buttonBack(){
        dismiss(animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func buttonSave(){
        if let currentHabit = habit {
            currentHabit.name = newHabitStore.nameText
            currentHabit.date = newHabitStore.timePicler
            currentHabit.color = newHabitStore.colorPicler
            HabitsStore.shared.save()
        } else {
            let newHabit = Habit(
                name: newHabitStore.nameText,
                date: newHabitStore.timePicler,
                color: newHabitStore.colorPicler)
            if HabitsStore.shared.habits.contains(newHabit) == false {
                HabitsStore.shared.habits.append(newHabit)
                dismiss(animated: true)
            }
        }
        navigationController?.popToRootViewController(animated: true)
    }
        
    @objc  func buttonColor() {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        present(colorPickerVC , animated: true, completion: nil)
    }
    
    @objc private func changePicler(paramPicler: UIDatePicker)  {
        newHabitStore.timePicler = paramPicler.date
        if paramPicler.isEqual(self.datePicler) {
            print(newHabitStore.timePicler)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            dateFormatter.string(from: datePicler.date)
            timeSavePicler.text = "\(dateFormatter.string(from: datePicler.date))"
        }
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        newHabitStore.nameText = textField.text ?? ""
        print(textField.text ?? "")
    }
    
    @objc private func removeHabit() {
        let alert = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить \((habit?.name)!) ?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) {
            UIAlertAction in
        }
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) {
            UIAlertAction in
            if let index = HabitsStore.shared.habits.firstIndex(where: {$0.name == self.habit?.name}){
                HabitsStore.shared.habits.remove(at: index)
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        present(alert, animated: true)
    }

 /// НЕ понял зачем нужна(
//    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
//        let color = viewController.selectedColor
//    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        buttonCircle.tintColor = color
        newHabitStore.colorPicler = color
        print(newHabitStore.colorPicler)
        
    }
    
    
    
}
