import UIKit
class MainInfoCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet var firstView: UIView!
    @IBOutlet var dateView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var leftImage: UIImageView!
    @IBOutlet var rightImage: UIImageView!
    @IBOutlet var firstComandLabel: UILabel!
    @IBOutlet var srcondComandLabel: UILabel!
    @IBOutlet var firstPointLabel: UILabel!
    @IBOutlet var secondPointLabel: UILabel!
    
    
    static let identifire = "MainInfoCollectionViewCell"
    
    
    static func nib()-> UINib{
        return UINib(nibName: "MainInfoCollectionViewCell", bundle: nil)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    // MARK: - Public Methods
    
    public func setupView(model: ResponseResult){
        self.dateLabel.text = model.fixture?.date ?? ""
        self.firstComandLabel.text = model.teams?.home?.name ?? ""
        self.srcondComandLabel.text = model.teams?.away?.name ?? ""
        self.secondPointLabel.text = "0"
        self.firstPointLabel.text = "0"
        dateView.layer.cornerRadius = 10
    }
    
    
    
    
}
