# Constraint Proxy

Auto Layout convenience with minimal API surface area, but high expressive power

## Features

- [x] Minimal API accessible through `constraint` proxy
- [x] Direct access to created `NSLayoutConstraint`
- [x] `UILayoutGuide` support
- [x] New `UILayoutPriority` constants including `.maxNonRequired` (999) for resolving layout ambiguities
- [x] `translatesAutoresizingMaskIntoConstraints` is automatically set to `false` on a target

## Usage

### Edges

<img align="right" width="52" height="52" src="Images/image0.png">

```swift
subview.constraint.edges(to: view)
```

<img align="right" width="52" height="52" src="Images/image1.png">

```swift
subview.constraint.edges(to: view, insets: .uniform(10))
```

<img align="right" width="52" height="52" src="Images/image2.png">

```swift
subview.constraint.edges(excluding: .bottom, to: view, insets: .horizontal(10))
```

<img align="right" width="52" height="52" src="Images/image3.png">

```swift
subview.constraint.edges(.bottom, .leading, to: view, insets: .leading(10))
```

### Horizontal axis

<img align="right" width="52" height="52" src="Images/image4.png">

```swift
subview.constraint.trailing(to: view)
```

<img align="right" width="52" height="52" src="Images/image5.png">

```swift
subview.constraint.centerX(to: view)
```

<img align="right" width="52" height="52" src="Images/image6.png">

```swift
subview.constraint.leading(to: view, .centerX)
```

<img align="right" width="52" height="52" src="Images/image7.png">

```swift
subview.constraint.trailing(to: view, .leading, constant: 10)
```

### Vertical axis

<img align="right" width="52" height="52" src="Images/image8.png">

```swift
subview.constraint.bottom(to: view)
```

<img align="right" width="52" height="52" src="Images/image9.png">

```swift
subview.constraint.centerY(to: view)
```

<img align="right" width="52" height="52" src="Images/image10.png">

```swift
subview.constraint.top(to: view, .centerY)
```

<img align="right" width="52" height="52" src="Images/image11.png">

```swift
subview.constraint.bottom(to: view, .top, constant: 10)
```

<img align="right" width="52" height="52" src="Images/image12.png">

```swift
subview.constraint.lastBaseline(to: view)
```

### Center

<img align="right" width="52" height="52" src="Images/image13.png">


```swift
subview.constraint.center(to: view)
```

### Size

<img align="right" width="52" height="52" src="Images/image14.png">

```swift
subview.constraint.size(CGSize(width: 75, height: 75))
```

<img align="right" width="52" height="52" src="Images/image15.png">

```swift
subview.constraint.size(to: view)
```

<img align="right" width="52" height="52" src="Images/image16.png">

```swift
subview.constraint.size(to: view, multiplier: 0.5)
```

### Dimension

<img align="right" width="52" height="52" src="Images/image17.png">

```swift
subview.constraint.width(to: view)
```

<img align="right" width="52" height="52" src="Images/image18.png">

```swift
subview.constraint.height(to: view, .width)
```

<img align="right" width="52" height="52" src="Images/image19.png">

```swift
subview.constraint.height(to: view, multiplier: 0.5)
```

<img align="right" width="52" height="52" src="Images/image20.png">

```swift
subview.constraint.width(constant: 50)
```

<img align="right" width="52" height="52" src="Images/image21.png">

```swift
subview.constraint.height(constant: 75)
```

### Layout guide

`UIView` and `UILayoutGuide` can be used interchangeably.

```swift
subview.constraint.edges(to: view.layoutMarginsGuide)
```

```swift
subview.constraint.lastBaseline(to: view.safeAreaLayoutGuide, .bottom)
```

```swift
subview.constraint.width(to: view.readableContentGuide)
```

### Relation

Allmost all constraint methods have `relation` parameter.

```swift
subview.constraint.leading(to: view, relation: .greaterThanOrEqual)
```

### Priority

All constraint methods have `priority` parameter.

```swift
subview.constraint.leading(to: view, priority: .defaultLow)
```

### Activation

Constraints are created active by default. All constraint methods have `active` parameter to opt out of this.

```swift
subview.constraint.leading(to: view, active: false)
```

## Installation

### Requirements
- iOS 11.0+
- Swift 5.0+

### Carthage
```
github "vadimtrifonov/ConstraintProxy"
```
