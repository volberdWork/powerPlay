import UIKit

class StandingsViewController: UIViewController{
    

    @IBOutlet var tableView: UITableView!
    
    var leagueId = 0
    var season = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

}








extension StandingsViewController: UITableViewDelegate{
    
}

extension StandingsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
