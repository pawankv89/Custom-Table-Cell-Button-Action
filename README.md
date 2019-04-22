# Custom-Table-Cell-Button-Action

=========

## Custom TableView Cell Button Action in Swift 5.

### In this demo show tableview cell button action with type to handle button tap events.

------------
Added Some screens here.

![](https://github.com/pawankv89/Custom-Table-Cell-Button-Action/blob/master/images/screen_1.png)
![](https://github.com/pawankv89/Custom-Table-Cell-Button-Action/blob/master/images/screen_2.png)
![](https://github.com/pawankv89/Custom-Table-Cell-Button-Action/blob/master/images/screen_3.png)
![](https://github.com/pawankv89/Custom-Table-Cell-Button-Action/blob/master/images/screen_4.png)


## Usage
------------

#### Custom Cell Button Send Event by Runtime

```swift

// MARK: - Like & Dislike Button Tap

@objc func likeButtonTap(_ sender: UIButton) -> Void {

print("likeButtonTap Tag:- \(sender.tag)")

let movie = moviesList[sender.tag]
//Show Alert With Message
DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackLike")

}

@objc func dislikeButtonTap(_ sender: UIButton) -> Void {

print("dislikeButtonTap Tag:- \(sender.tag)")

let movie = moviesList[sender.tag]
//Show Alert With Message
DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackDisLike")
}

extension MovieListVC_1 : UITableViewDataSource, UITableViewDelegate {

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
return UITableView.automaticDimension
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return moviesList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell_1.identifire, for: indexPath) as! MovieCell_1

let movie = moviesList[indexPath.row]
cell.titleLabel.text = movie.name
cell.subtitleLabel.text = movie.details

//Like Button
cell.likeButton.addTarget(self, action: #selector(likeButtonTap(_:)), for: .touchUpInside)
//Set Tag
cell.likeButton.tag = indexPath.row

//DisLike Button
cell.dislikeButton.addTarget(self, action: #selector(dislikeButtonTap(_:)), for: .touchUpInside)
//Set Tag
cell.dislikeButton.tag = indexPath.row

return cell
}

}

```

#### Custom Cell Button Send Event by Protocol

```swift

func likeButtonTapProtocol(_ cell: MovieCell_2) {

print("likeButtonTapProtocol Tag:- \(cell.tag)")

let indexPath = self.tableview.indexPath(for: cell)

let movie = moviesList[(indexPath?.row)!]
//Show Alert With Message
DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackLike")
}

func dislikeButtonTapProtocol(_ cell: MovieCell_2) {

print("dislikeButtonTapProtocol Tag:- \(cell.tag)")

let indexPath = self.tableview.indexPath(for: cell)

let movie = moviesList[(indexPath?.row)!]
//Show Alert With Message
DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackDisLike")
}

extension MovieListVC_2 : UITableViewDataSource, UITableViewDelegate, MovieCell_2Delegate {

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
return UITableView.automaticDimension
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return moviesList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell_2.identifire, for: indexPath) as! MovieCell_2

let movie = moviesList[indexPath.row]
cell.titleLabel.text = movie.name
cell.subtitleLabel.text = movie.details

//Set Delegate
cell.delegate = self

return cell
}

}

protocol MovieCell_2Delegate: class {

func likeButtonTapProtocol(_ cell: MovieCell_2) -> Void
func dislikeButtonTapProtocol(_ cell: MovieCell_2) -> Void
}

class MovieCell_2: UITableViewCell {

//Title
@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var subtitleLabel: UILabel!

//Button
@IBOutlet weak var likeButton: UIButton!
@IBOutlet weak var dislikeButton: UIButton!

//Identifire
static let identifire: String = "MovieCell_2"

//Protocole
weak var delegate: MovieCell_2Delegate?

override func awakeFromNib() {
super.awakeFromNib()
// Initialization code
}

override func setSelected(_ selected: Bool, animated: Bool) {
super.setSelected(selected, animated: animated)

// Configure the view for the selected state
self.buttonImageViewTintColor(button: likeButton, color: UIColor.blue)
self.buttonImageViewTintColor(button: dislikeButton, color: UIColor.blue)
}

func buttonImageViewTintColor(button: UIButton, color: UIColor) -> Void {

if button.imageView?.image != nil {
let image = button.imageView?.image!.withRenderingMode(.alwaysTemplate)
button.setImage(image, for: .normal)
button.tintColor = color
}
}

// MARK: - Like & Dislike Button Tap

@IBAction func likeButtonTap(_ sender: UIButton) -> Void {

//Send Delegate
delegate?.likeButtonTapProtocol(self)
}

@IBAction func dislikeButtonTap(_ sender: UIButton) -> Void {

//Send Delegate
delegate?.dislikeButtonTapProtocol(self)
}

}

```

#### Custom Cell Button Send Event by Button Tap Action

```swift


extension MovieListVC_3 : UITableViewDataSource, UITableViewDelegate {

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
return UITableView.automaticDimension
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return moviesList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell_3.identifire, for: indexPath) as! MovieCell_3

let movie = moviesList[indexPath.row]
cell.titleLabel.text = movie.name
cell.subtitleLabel.text = movie.details

cell.tableView = tableView
cell.moviesList = moviesList

return cell
}

}

class MovieCell_3: UITableViewCell {

//Title
@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var subtitleLabel: UILabel!

//Button
@IBOutlet weak var likeButton: UIButton!
@IBOutlet weak var dislikeButton: UIButton!

//Identifire
static let identifire: String = "MovieCell_3"

var tableView: UITableView!
var moviesList: [Movie] = []

override func awakeFromNib() {
super.awakeFromNib()
// Initialization code
}

override func setSelected(_ selected: Bool, animated: Bool) {
super.setSelected(selected, animated: animated)

// Configure the view for the selected state
self.buttonImageViewTintColor(button: likeButton, color: UIColor.blue)
self.buttonImageViewTintColor(button: dislikeButton, color: UIColor.blue)
}

func buttonImageViewTintColor(button: UIButton, color: UIColor) -> Void {

if button.imageView?.image != nil {
let image = button.imageView?.image!.withRenderingMode(.alwaysTemplate)
button.setImage(image, for: .normal)
button.tintColor = color
}
}

// MARK: - Like & Dislike Button Tap

@IBAction func likeButtonTap(_ sender: UIButton) -> Void {
print("likeButtonTap Tag:- \(sender.tag)")

let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
//let cell = self.tableView.cellForRow(at: indexPath!) as! MovieCell_3

let movie = moviesList[indexPath!.row]
//Show Alert With Message
DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackLike")
}

@IBAction func dislikeButtonTap(_ sender: UIButton) -> Void {
print("dislikeButtonTap Tag:- \(sender.tag)")

let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
let indexPath = self.tableView.indexPathForRow(at:buttonPosition)
//let cell = self.tableView.cellForRow(at: indexPath!) as! MovieCell_3

let movie = moviesList[(indexPath?.row)!]
//Show Alert With Message
DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackDisLike")
}

}


```

#### Custom Cell Button Send Event by Closure

```swift

extension MovieListVC_4 : UITableViewDataSource, UITableViewDelegate {

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
return UITableView.automaticDimension
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return moviesList.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell_4.identifire, for: indexPath) as! MovieCell_4

let movie = moviesList[indexPath.row]
cell.titleLabel.text = movie.name
cell.subtitleLabel.text = movie.details

//Like Button Tap
cell.likeButtonAction = { sender in
// Do whatever you want from your button here.

let indexPath = self.tableview.indexPath(for: sender as! UITableViewCell)

let movie = self.moviesList[(indexPath?.row)!]
//Show Alert With Message
DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackLike")
}

//DisLike Button Tap
cell.dislikeButtonAction = { sender in
// Do whatever you want from your button here.

let indexPath = self.tableview.indexPath(for: sender as! UITableViewCell)

let movie = self.moviesList[(indexPath?.row)!]
//Show Alert With Message
DisplayMessage.shared.showAlertWithMessage(message: movie.name, imageName: "feedbackDisLike")
}

return cell
}

}

class MovieCell_4: UITableViewCell {

//Title
@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var subtitleLabel: UILabel!

//Button
@IBOutlet weak var likeButton: UIButton!
@IBOutlet weak var dislikeButton: UIButton!

//Identifire
static let identifire: String = "MovieCell_4"

var likeButtonAction: ((Any) -> Void)?
var dislikeButtonAction: ((Any) -> Void)?

override func awakeFromNib() {
super.awakeFromNib()
// Initialization code
}

override func setSelected(_ selected: Bool, animated: Bool) {
super.setSelected(selected, animated: animated)

// Configure the view for the selected state
self.buttonImageViewTintColor(button: likeButton, color: UIColor.blue)
self.buttonImageViewTintColor(button: dislikeButton, color: UIColor.blue)
}

func buttonImageViewTintColor(button: UIButton, color: UIColor) -> Void {

if button.imageView?.image != nil {
let image = button.imageView?.image!.withRenderingMode(.alwaysTemplate)
button.setImage(image, for: .normal)
button.tintColor = color
}
}

// MARK: - Like & Dislike Button Tap

@IBAction func likeButtonTap(_ sender: UIButton) -> Void {
print("likeButtonTap Tag:- \(sender.tag)")

self.likeButtonAction?(self)
}

@IBAction func dislikeButtonTap(_ sender: UIButton) -> Void {
print("dislikeButtonTap Tag:- \(sender.tag)")

self.dislikeButtonAction?(self)

}
}

```


## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 
