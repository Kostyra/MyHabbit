

import UIKit

class HabitsViewController: UIViewController {

    let ImagePlus = UIImage(systemName: "plus")
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIBarButtonItem(image: ImagePlus , style: .plain,target: self, action:#selector(buttonAddFunc))
        button.tintColor = UIColor(named: "сolorPink")
        navigationItem.rightBarButtonItem = button
       
        
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
       
    }
    
    @objc private func buttonAddFunc(){
        
    }
  
}
