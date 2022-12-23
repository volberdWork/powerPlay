import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate{
    @IBOutlet var tableView: UITableView!
    
    var model = [ExapleModel(date: "2222", leftImagName: "dinamo", rightImagName: "psg", fistComandName: "Monchester Unated", secondComandName: "Real Dreams Unated", firstPoint: 2, secondPoint: 5),
                 ExapleModel(date: "2022", leftImagName: "manchester", rightImagName: "real", fistComandName: "Monchester Unated", secondComandName: "Real Dreams Unated", firstPoint: 2, secondPoint: 5),
                 ExapleModel(date: "2222", leftImagName: "dinamo", rightImagName: "psg", fistComandName: "Monchester Unated", secondComandName: "Real Dreams Unated", firstPoint: 2, secondPoint: 5),
                 ExapleModel(date: "2022", leftImagName: "manchester", rightImagName: "real", fistComandName: "Monchester Unated", secondComandName: "Real Dreams Unated", firstPoint: 2, secondPoint: 5),
                 ExapleModel(date: "2222", leftImagName: "dinamo", rightImagName: "psg", fistComandName: "Monchester Unated", secondComandName: "Real Dreams Unated", firstPoint: 2, secondPoint: 5),
                 ExapleModel(date: "2022", leftImagName: "manchester", rightImagName: "real", fistComandName: "Monchester Unated", secondComandName: "Real Dreams Unated", firstPoint: 2, secondPoint: 5)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        configure()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showDetailController(notification:)), name: Notification.Name("cellTap"), object: nil)
        
        
    }
    
    @objc private func showDetailController(notification: Notification) {
        
        print("ID:", notification)
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let vc = main.instantiateViewController(withIdentifier: "DetailCellViewController")
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func configure(){
        view.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.backgroundColor = UIColor(red: 24/255, green: 25/255, blue: 31/255, alpha: 1)
        tableView.register(CustomMainInfoTableViewCell.nib(), forCellReuseIdentifier: CustomMainInfoTableViewCell.identifier )
    }
    
    
    
    
    
}



extension MainViewController: UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomMainInfoTableViewCell.identifier, for: indexPath) as! CustomMainInfoTableViewCell
        
        cell.configure(with: model)
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
}


