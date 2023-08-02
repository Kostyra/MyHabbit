
import UIKit


class TableViewController:UIViewController {
    
    let habit: Habit
    
    private var tableView: UITableView  = {
        let table = UITableView.init(
            frame: .zero,
            style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = UIColor(named: "gray")
        return table
    }()
    
    private func tableViewCell() {
        tableView.register(HabitCheckTableViewCell.self, forCellReuseIdentifier: HabitCheckTableViewCell.idTableHabitCheck)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 20
    }
    
    private func table() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    //MARK: - life cycle

    init(_ habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "tabBar")
        navigationController?.navigationBar.prefersLargeTitles = false
        table()
        tableViewCell()
        let buttonEdit = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(buttonEdit))
        buttonEdit.tintColor = UIColor(named: "сolorPink")
        navigationItem.rightBarButtonItem = buttonEdit
        let buttonBack = UIBarButtonItem(title: "Отменть", style: .plain, target: self, action: #selector(buttonBack))
        buttonBack.tintColor = UIColor(named: "сolorPink")
        navigationItem.leftBarButtonItem = buttonBack
    }
    
    @objc private func buttonEdit(){
        let habitViewController = UINavigationController(rootViewController: HabitViewController(habit: habit))
        habitViewController.modalTransitionStyle = .coverVertical
        habitViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(HabitViewController(habit: habit), animated: true)
    }
    
    @objc private func buttonBack(){
        navigationController?.popViewController(animated: true)
    }
    
    
}


extension TableViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HabitCheckTableViewCell.idTableHabitCheck, for: indexPath)
                as? HabitCheckTableViewCell else { return UITableViewCell() }

        let arrayNew = HabitsStore.shared.dates[indexPath.row]
        let isTracked = HabitsStore.shared.habit(habit, isTrackedIn: arrayNew)
        cell.accessoryType = isTracked ? .checkmark : .none
        cell.tintColor =  UIColor(named: "сolorPink")
        cell.timeHabit(index: indexPath.row, check: HabitsStore.shared.habit(habit, isTrackedIn: arrayNew))
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
   }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         "Активность"
     }
}
