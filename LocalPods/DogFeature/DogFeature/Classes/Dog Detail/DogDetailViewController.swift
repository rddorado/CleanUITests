import UIKit

class DogDetailViewController: UIViewController, DogDetailViewPort {
    let imageView = UIImageView()
    let dogs: [Dog]
    var selectedIndex:Int = 0
    weak var router: DogDetailRouter?
    lazy var adapter: DogDetailAdapter = {
       return DogDetailAdapter(dogs: self.dogs, selectedIndex: self.selectedIndex, viewPort: self)
    }()
    
    init(dogs: [Dog], selectedIndex: Int, router: DogDetailRouter) {
        let podBundle = Bundle(for: DogFeatureRouter.self)
        let bundleURL = podBundle.url(forResource: "DogFeature", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        let image = UIImage(named:"\(dogs[selectedIndex].imageName).jpg", in: bundle, compatibleWith: nil)
        
        imageView.image = image
        self.dogs = dogs
        self.selectedIndex = selectedIndex
        self.router = router
        super.init(nibName: nil, bundle: nil)
        title = dogs[selectedIndex].imageName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.contentMode = .scaleAspectFill
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showDogImage(index: Int) {
        imageView.image = UIImage(named: dogs[index].imageName)
        imageView.setNeedsDisplay()
        title = dogs[index].imageName
    }
    
    @objc func imageTapped() {
        adapter.handleTapImage()
    }
}
