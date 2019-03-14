# Constraints

Auto Layout convenience with minimal API surface area, but high expressive power

## Features

- [x] Minimal API accessible through `constrain` proxy
- [x] Direct access to created `NSLayoutConstraint`
- [x] `UILayoutGuide` support
- [x] New constant `UILayoutPriority.maxNonRequired` (999) for resolving layout ambiguities

## Usage

### Edges

<img align="right" width="52" height="52" src="Images/edges1.png">

```swift
subview.constrain.edges(to: view)
```

<img align="right" width="52" height="52" src="Images/edges2.png">

```swift
subview.constrain.edges(to: view.readableContentGuide)
```

<img align="right" width="52" height="52" src="Images/edges3.png">

```swift
subview.constrain.edges(to: view, insets: .uniform(10))
```

<img align="right" width="52" height="52" src="Images/edges4.png">

```swift
subview.constrain.edges(.all(except: .bottom), to: view, insets: .horizontal(10))
```

<img align="right" width="52" height="52" src="Images/edges5.png">

```swift
subview.constrain.edges([.top, .leading], to: view, insets: .leading(10))
```

### Edge

<img align="right" width="52" height="52" src="Images/edge1.png">

```swift
subview.constrain.edge(.leading, to: view)
```

<img align="right" width="52" height="52" src="Images/edge2.png">

```swift
subview.constrain.edge(.trailing, to: view, edge: .trailing)
```

<img align="right" width="52" height="52" src="Images/edge3.png">

```swift
subview.constrain.edge(.trailing, to: view, edge: .trailing, constant: -10, relation: .greaterThanOrEqual)
```

### Size

<img align="right" width="52" height="52" src="Images/size1.png">

```swift
subview.constrain.size(CGSize(width: 75, height: 75))
```

<img align="right" width="52" height="52" src="Images/size2.png">

```swift
subview.constrain.size(to: view)
```

<img align="right" width="52" height="52" src="Images/size3.png">

```swift
subview.constrain.size(to: view, multiplier: 0.5)
```

### Dimension

<img align="right" width="52" height="52" src="Images/dimension1.png">

```swift
subview.constrain.dimension(.width, to: view)
```

<img align="right" width="52" height="52" src="Images/dimension2.png">

```swift
subview.constrain.dimension(.height, to: view, dimension: .width)
```

<img align="right" width="52" height="52" src="Images/dimension3.png">

```swift
subview.constrain.dimension(.height, to: view, dimension: .width, multiplier: 0.5)
```

### Center

<img align="right" width="52" height="52" src="Images/center1.png">

```swift
subview.constrain.center(to: view)
```

<img align="right" width="52" height="52" src="Images/center2.png">

```swift
subview.constrain.center(.horizontal, to: view)
```

<img align="right" width="52" height="52" src="Images/center3.png">

```swift
subview.constrain.center(.vertical, to: view, constant: 10)
```

## Installation

### Requirements
- iOS 11.0+
- Swift 4.2+

### Carthage
```
github "vadimtrifonov/Constraints"
```
