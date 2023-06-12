
import UIKit

class InfoViewController: UIViewController {
    
    private lazy var text21: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = textLabal21
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return text
    }()
    
    private lazy var textHabits: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = textLabal21Habits
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = .white
        return scroll
    }()
    
    private lazy var contentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private func setupViewHabitsInfo() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(text21)
        contentView.addSubview(textHabits)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            text21.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            text21.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            text21.heightAnchor.constraint(equalToConstant: 24),
            text21.widthAnchor.constraint(equalToConstant: 218),
            
            textHabits.topAnchor.constraint(equalTo: text21.bottomAnchor, constant: 16),
            textHabits.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textHabits.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -16),
            textHabits.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
        
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHabitsInfo()
 
    
    }
    

}
