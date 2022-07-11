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
- getting the id value from response []
