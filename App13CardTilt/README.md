<p>
  This project is my attempt at going though the 
  <a href="http://www.raywenderlich.com/76024/swift-table-view-animations-tutorial-drop-cards">RayWenderlich UITableView animations tutorial</a>
</p>

<ol>

  <li>
    <a href="https://github.com/GabrielGhe/SwiftProjects/commit/eca2df68844f9d29d64342d48ad1611fbcee66a6">
      commit
    </a>: 
    Adding a fade in animation
  </li>
  
  <li>
    <a href="https://github.com/GabrielGhe/SwiftProjects/commit/b28f7628fe28b899b36cfff8cca4efe341365edf">
      commit
    </a>:
    Created a fade in + rotation + translation animation
  </li>
  
  <li>
    <a href="https://github.com/GabrielGhe/SwiftProjects/commit/16a8e18c1680df82b9c738ba0935b2c1ff01225c">
      commit
    </a>:
    Adding new animation to the UITableViewCell
  </li>
  
  <li>
    <a href="https://github.com/GabrielGhe/SwiftProjects/commit/bf4b39134bc41e954927cfee6c08403f5d3769a5">
      commit
    </a>:
    Refactored the rotation animation code to a lazy variable
  </li>
</ol>

<br />

<h3 name="tableOfContent">Guide</h3>
<p>
What are some of the things you can animate? Here's a list taken from <a href="https://developer.apple.com/library/ios/documentation/windowsviews/conceptual/viewpg_iphoneos/AnimatingViews/AnimatingViews.html#//apple_ref/doc/uid/TP40009503-CH6-SW2">Apple</a>
</p>

<ul>
  <li>
    <b><a href="#frame">frame</a></b>
  </li>
  
  <li>
    <b><a href="#bounds">bounds</a></b>
  </li>
  
  <li>
    <b><a href="#center">center</a></b>
  </li>
  
  <li>
    <b><a href="#transform">transform</a></b>
  </li>
  
  <li>
    <b><a href="#alpha">alpha</a></b>
  </li>
  
  <li>
    <b><a href="#bg">backgroundColor</a></b>
  </li>
</ul>

<!-- FRAME -->
<h4 id="#frame"><a href="#guide">frame</a><h4>
<p>
Change the view’s size and position relative to its superview’s coordinate system.
It is the view's container.
</p>
```swift
typealias cf = CGFloat

// variable
var rect:(x:cf, y:cf, width:cf, height:cf) = (0,0,50,50)

var view = UIView()
UIView.animateWithDuration(1, animations: {
    view.frame = CGRectMake(rect.x, rect.y, rect.width, rect.height)
})
```


<!-- BOUNDS -->
<h4 id="#bounds"><a href="#guide">bounds</a><h4>
<p>
Change the view’s size. This is where the view is allowed to draw.
</p>
```swift
typealias cf = CGFloat

// variable
var rect:(x:cf, y:cf, width:cf, height:cf) = (0,0,50,50)

var view = UIView()
UIView.animateWithDuration(1, animations: {
    view.bounds = CGRectMake(rect.x, rect.y, rect.width, rect.height)
})
```

<!-- CENTER -->
<h4 id="#center"><a href="#guide">center</a><h4>
<p>
Change the view’s position. This is mostly used for animating. Changing this property updates the view's frame accordingly.
</p>
```swift
var view = UIView()
UIView.animateWithDuration(1, animations: {
    view.center = CGPoint(x: 5, y: 5)
})
```


<!-- TRANSFORM -->
<h4 id="#transform"><a href="#guide">transform</a><h4>
<p>
Modify this property to scale, rotate, or translate the view relative to its center point in 2D space.
</p>
```swift
typealias cf = CGFloat

var initTransform = CATransform3DIdentity
var startTransform: ()->CATransform3D = {
    // variables
    var move:(x:cf,y:cf,z:cf) = (5, 5, 0)
    
    //fin
    var startTransform = CATransform3DTranslate(initTransform, move.x, move.y, move.z)
    return startTransform
}

var view = UIView()
view.layer.transform = startTransform()
UIView.animateWithDuration(1, animations: {
    view.layer.transform = initTransform
})
```

<!-- ALPHA -->
<h4 id="#alpha"><a href="#guide">alpha</a><h4>
<p>
Change the transparency of the view. Note that this changes the whole view's alpha. If you just want a transparent background with the content opaque, you'd modify the alpha on the backgroundColor (UIColor).
</p>
```swift
var view = UIView()
UIView.animateWithDuration(1, animations: {
    view.alpha = 0.5
})
```

<!-- BACKGROUND COLOR -->
<h4 id="#bg"><a href="#guide">backgroundColor</a><h4>
<p>
Change the view’s background color.
</p>
```swift
var view = UIView()
UIView.animateWithDuration(1, animations: {
    view.backgroundColor = UIColor(red: 5, green: 5, blue: 5, alpha: 0.5)
    view.backgroundColor = UIColor.blueColor()
})
```
