import UIKit
import Alamofire

class PreloaderViewController: UIViewController {
    
    let main = UIStoryboard(name: "Main", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        loadVC()
    }
    
    func loadVC(){
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as UIViewController
        self.present(viewController, animated: false)
    }
    
   
}
