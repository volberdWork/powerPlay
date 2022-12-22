import UIKit

class CustomMainInfoTableViewCell: UITableViewCell {
   
    @IBOutlet var collectionView: UICollectionView!
    
    var models  = [ExapleModel]()
    
    static let identifier = "CustomMainInfoTableViewCell"
    
    static func nib()-> UINib{
        UINib(nibName: "CustomMainInfoTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(MainInfoCollectionViewCell.nib(), forCellWithReuseIdentifier: MainInfoCollectionViewCell.identifire)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

    }
    
    
    
}





extension CustomMainInfoTableViewCell: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item Selection" , indexPath.section, indexPath.row)
                
                NotificationCenter.default.post(name: Notification.Name("cellTap"), object: indexPath.row)
    }
    
    
    func configure(with models: [ExapleModel]){
        self.models = models
        collectionView.reloadData()
    }
    
    
}

extension CustomMainInfoTableViewCell: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainInfoCollectionViewCell.identifire, for: indexPath) as! MainInfoCollectionViewCell
        cell.setupView(model: models[indexPath.row])
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    
    
    
    
}

extension CustomMainInfoTableViewCell: UICollectionViewDelegateFlowLayout{
    
    
    
}
