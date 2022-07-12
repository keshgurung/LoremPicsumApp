# LoremPicsumApp
This is a basic app with getting networking call (api call) from lorem picsum.

## Requirements
    -10 cells should be loaded, each with an imageView and a label centered from left to right. The imageView being on the far left and the label filling in the rest of the view
    -The cells are not selectable
    -Create custom cells, not just the default UICollectionView class in order to have larger images and potentially multilines for the imageId.
    -Create a networking layer that fetches images from the LoremPicsumAPI to display for the images
        (https://picsum.photos/)
    -The network layer is to be a singleton, as shown in class
    -The label needs to display the ID of the image in the format of "ID: <picsum id>"
        (Hint: Check the URLResponse object for the id as a HTTPURLResponse)

## Obstacles
- getting the id value from response [picsum-id]

- In network manager, added function getResponse same as getData
   -  Added function that result 2 type < >

```
    func getResponse(url: URL?, completion: @escaping (Result<URLResponse, NetworkError>) -> Void) {
        
        guard let url = url else {
            completion(.failure(NetworkError.badURL))
            return
        }

        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
                completion(.failure(NetworkError.badData))
                return
            }
            completion(.success(response))

```
- called the function in mainview controller inside func tableview (rowat)
 - called the function same as getData. 
 - `newResponse?.value(forHTTPHeaderField: "picsum-id")`
 
```
 NetworkManager.shared.getResponse(url: url) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let newResponse = response as? HTTPURLResponse
                  
                    guard let res = newResponse?.value(forHTTPHeaderField: "picsum-id") else {return}
                    cell.newIndexLabel.text = "The ID is:\(res)"
                }
```
