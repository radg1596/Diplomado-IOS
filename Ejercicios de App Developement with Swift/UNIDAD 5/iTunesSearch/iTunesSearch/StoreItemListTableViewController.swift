
import UIKit

class StoreItemListTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
 
    // add item controller property
    let storeItemController = StoreItemController()
    
    var items = [StoreItem]()
    
    let queryOptions = ["movie", "music", "software", "ebook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchMatchingItems() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        let mediaType = queryOptions[filterSegmentedControl.selectedSegmentIndex]
        
        if !searchTerm.isEmpty {
            
            // set up query dictionary
            let query = ["term":searchTerm,"media":mediaType]
            print ("")
            
            storeItemController.fetchItems(matching: query, completion: { (storeItems) in
                if let fecthItems = storeItems {
                    self.items = fecthItems.results
                    self.tableView.reloadData()
                }
                else {
                    print("No se pudieron obtener los datos")
                }
            })
        }
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        
        DispatchQueue.main.async {
            // set label to the item's name
            cell.textLabel?.text = item.track
            // set detail label to the item's subtitle
            cell.detailTextLabel?.text = item.artist
            // reset the image view to the gray image
            cell.imageView?.image = #imageLiteral(resourceName: "gray")
            // initialize a network task to fetch the item's artwork
        }
        
        
        let imageTask = URLSession.shared.dataTask(with: item.trackViewUrl, completionHandler: { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    cell.imageView?.image = image
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
            else {
                print ("Imagen no obtenida")
            }
        })
        imageTask.resume()
        
        
        // if successful, use the main queue capture the cell, to initialize a UIImage, and set the cell's image view's image to the 
        // resume the task
    }
    
    @IBAction func filterOptionUpdated(_ sender: UISegmentedControl) {
        
        fetchMatchingItems()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension StoreItemListTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
