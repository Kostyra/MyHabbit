
import UIKit

class InfoViewController: UIViewController {

    private lazy var textField: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
       let view = UIView()
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
