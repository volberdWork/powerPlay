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
    
    public func setupView(model: ExapleModel){
        self.dateLabel.text = model.date
        self.firstComandLabel.text = "\(model.fistComandName)"
        self.srcondComandLabel.text = model.secondComandName
        self.secondPointLabel.text = "\(model.secondPoint)"
        self.firstPointLabel.text = "\(model.firstPoint)"
        self.leftImage.image = UIImage(named: "\(model.leftImagName)")
        self.rightImage.image = UIImage(named: "\(model.rightImagName)")
        dateView.layer.cornerRadius = 10
        
        
    }

   
}
