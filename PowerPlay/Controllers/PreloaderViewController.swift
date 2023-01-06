import UIKit

class PreloaderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
     loadVC()
    }
    
    func loadVC(){
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navigationID")
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: false)
    }
    
}
