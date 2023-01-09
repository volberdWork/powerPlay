import UIKit

class PreloaderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadVC()
    }
    
    func loadVC(){
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "navigationID") as? UINavigationController {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
            
        }
    }
    
    
    
    
    
}
