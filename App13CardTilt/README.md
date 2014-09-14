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
    <b><a href="#backgroundColor">backgroundColor</a></b>
  </li>
  
  <li>
    <b><a href="#contentStretch">contentStretch</a></b>
  </li>
</ul>

<!-- FRAME -->
<h4 id="#frame"><a href="#guide">frame</a><h4>
<p>
Change the view’s size and position relative to its superview’s coordinate system.
It is the view's container.
</p>
```swift

```


<!-- BOUNDS -->
<h4 id="#bounds"><a href="#guide">bounds</a><h4>
<p>
Change the view’s size. This is where the view is allowed to draw.
</p>
```swift

```

<!-- CENTER -->
<h4 id="#center"><a href="#guide">center</a><h4>
<p>
Change the view’s position. This is mostly used for animating.
</p>
```swift
```


<!-- TRANSFORM -->
<h4 id="#transform"><a href="#guide">transform</a><h4>
<p>
Modify this property to scale, rotate, or translate the view relative to its center point in 2D space.
</p>
```swift
```

<!-- ALPHA -->
<h4 id="#alpha"><a href="#guide">alpha</a><h4>
<p>
Change the transparency of the view.
</p>
```swift
```

<!-- BACKGROUND COLOR -->
<h4 id="#backgroundColor"><a href="#guide">backgroundColor</a><h4>
<p>
Change the view’s background color.
</p>
```swift
```

<!-- CONTENT STRETCH -->
<h4 id="#contentStretch"><a href="#guide">contentStretch</a><h4>
<p>
Change the way the view’s contents are stretched to fill the available space.
</p>
```swift
```
