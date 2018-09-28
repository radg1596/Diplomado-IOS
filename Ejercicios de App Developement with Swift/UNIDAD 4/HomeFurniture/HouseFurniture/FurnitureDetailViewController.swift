
import UIKit

class FurnitureDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var furniture: Furniture?
    
    
    @IBOutlet weak var choosePhotoButton: UIButton!
    @IBOutlet weak var furnitureTitleLabel: UILabel!
    @IBOutlet weak var furnitureDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let furniture = furniture else {return}
        if let imageData = furniture.imageData,
            let image = UIImage(data: imageData) {
            choosePhotoButton.setTitle("", for: .normal)
            choosePhotoButton.setImage(image, for: .normal)
        } else {
            choosePhotoButton.setTitle("Choose Image", for: .normal)
            choosePhotoButton.setImage(nil, for: .normal)
        }
        
        furnitureTitleLabel.text = furniture.name
        furnitureDescriptionLabel.text = furniture.description
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
        ///Creando el seleccionador de imagen y asignando su delegado
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        
        ///Creando la alerta
        let alertController = UIAlertController(title: "Choose an image", message: nil, preferredStyle: .actionSheet)
        
        ////Accion de cancelar
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        ////Accion de tomar foto
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Take a pic", style: .default, handler: nil)
            alertController.addAction(cameraAction)
        }
        
        ////Accion de seleccionar una foto de la galeria
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Choose a photo from library", style: .default, handler: { action in
                    imagePicker.sourceType = .photoLibrary
                    self.present(imagePicker, animated: true, completion: nil)
            } )
            alertController.addAction(photoLibraryAction)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let selectedImage =  info[UIImagePickerControllerOriginalImage] as? UIImage {
            furniture?.imageData = UIImagePNGRepresentation(selectedImage)
            
            dismiss(animated: true, completion: { () in self.updateView() })
            
        }
        
    }

    @IBAction func actionButtonTapped(_ sender: UIButton) {
        guard let image = furniture?.imageData else {return}
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController, animated: true, completion: nil)
        
        
    }
    
}
