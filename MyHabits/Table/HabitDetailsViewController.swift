
import UIKit


class TableViewController:UIViewController {
    
    private var tableView: UITableView  = {
        let table = UITableView.init(
            frame: .zero,
            style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .green
        return table
    }()
    
    
    private func tableViewCell() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.idTable)
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "tabBar")
        navigationController?.navigationBar.prefersLargeTitles = false
        table()
        tableViewCell()
    }
    
}


extension TableViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.dates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.idTable, for: indexPath)
                as? TableViewCell else { return UITableViewCell() }
        
        let arrayNew = HabitsStore.shared.dates[indexPath.row]
        cell.timeHabit(index: indexPath.row, check: HabitsStore.shared.habit(habit, isTrackedIn: arrayNew))
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
   }
    
    
}
