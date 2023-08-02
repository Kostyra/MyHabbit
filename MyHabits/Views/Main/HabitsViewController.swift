

import UIKit

final class HabitsViewController: UIViewController {

    private let imagePlus = UIImage(systemName: "plus")
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 150.0
    }
    
    private enum LayoutConstantHeader {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 70.0
    }
    
    var habitCell =  HabitCollectionViewCell()
    
     private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.idCVC)
        
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.idHeader)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "view")
        collectionView.clipsToBounds = true
        return collectionView
    }()
            
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func collectionViewLayOut(){
        view.addSubview(collectionView)
         NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(image: imagePlus , style: .plain,target: self, action:#selector(buttonAdd))
        button.tintColor = UIColor(named: "сolorPink")
        navigationItem.rightBarButtonItem = button
    }
    
    override func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        collectionViewLayOut()
        setupCollectionView()
        collectionView.reloadData()
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    @objc private func buttonAdd(){
        let habitVС = HabitViewController(habit:nil)
        let habitNC = UINavigationController(rootViewController: habitVС)
        
        habitNC.modalPresentationStyle = .fullScreen
        habitNC.modalTransitionStyle = .crossDissolve
        habitVС.title = "Создать"
                
        present(habitNC, animated: true)
    }
}


extension HabitsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
     
    func numberOfSections(in tableView: UICollectionView) -> Int {
       return 2
   }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return HabitsStore.shared.habits.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.idHeader, for: indexPath) as? ProgressCollectionViewCell else { return UICollectionViewCell() }
            cell.setup()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.idCVC, for: indexPath) as? HabitCollectionViewCell else { return UICollectionViewCell() }
            cell.dataHabits(with: HabitsStore.shared.habits[indexPath.row])
            cell.buttonTappedHandler  = { [weak collectionView] in 
                collectionView?.reloadData()
            }
            return cell
        }
    }
}

extension HabitsViewController:UICollectionViewDelegateFlowLayout {
    
    private func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 1
        
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow
        
        return floor(finalWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width = itemWidth(
                for: view.frame.width,
                spacing: LayoutConstantHeader.spacing)
            return CGSize(width: width, height: LayoutConstantHeader.itemHeight)
        } else {
            let width = itemWidth(
                for: view.frame.width,
                spacing: LayoutConstant.spacing)
            return CGSize(width: width, height: LayoutConstant.itemHeight)
        }
    }

    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
           return UIEdgeInsets(
                top: LayoutConstantHeader.spacing,
                left: LayoutConstantHeader.spacing,
                bottom: LayoutConstantHeader.spacing,
                right: LayoutConstantHeader.spacing
            )
        } else {
            return UIEdgeInsets(
                top: LayoutConstant.spacing,
                left: LayoutConstant.spacing,
                bottom: LayoutConstant.spacing,
                right: LayoutConstant.spacing
            )
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        if section == 0 {
          return  LayoutConstantHeader.spacing
        } else {
          return LayoutConstant.spacing
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        if section == 0 {
          return  LayoutConstantHeader.spacing
        } else {
          return LayoutConstant.spacing
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        cell.contentView.backgroundColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let tableVC = TableViewController(HabitsStore.shared.habits[indexPath.item])
            tableVC.navigationItem.title = HabitsStore.shared.habits[indexPath.row].name
            navigationController?.pushViewController(tableVC, animated: true)
        }
    }
}

