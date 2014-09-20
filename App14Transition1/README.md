<p>
  This project is my attempt at transitions between UIViews 
</p>

<h4>Setup<h4>
<p>
We need a container (container) a front(red) and a backView(blue)
</p>
```swift
// ### in viewDidLoad ###

let container = UIView()
let redSquare = UIView()
let blueSquare = UIView()

// set container frame and add to the screen
self.container.frame = CGRect(x: 60, y: 60, width: 200, height: 200)
self.view.addSubview(container)

// set red square frame up
// we want the blue square to have the same position as redSquare
// so lets just reuse blueSquare.frame
self.redSquare.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
self.blueSquare.frame = redSquare.frame

// set background colors
self.redSquare.backgroundColor = UIColor.redColor()
self.blueSquare.backgroundColor = UIColor.blueColor()

// for now just add the redSquare
// we'll add blueSquare as part of the transition animation
self.container.addSubview(self.redSquare)
```

<p>
Ok, now we need to animate on click
</p>
```swift
// ### in click event ###

// Create a tuple to easily know which UIView is which
var views = (frontView: self.redSquare, backView: self.blueSquare)
let transitionOptions = UIViewAnimationOptions.TransitionCurlUp

UIView.transitionWithView(self.container, duration: 1.0, options: transitionOptions, animations: {
    views.frontView.removeFromSuperview()
    self.container.addSubview(views.backView)
  }, completion: { finished in
    // do things when it's done
})
```

<p>
It works but now we only have blue... lets fix that
</p>
```swift
var views = (frontView: self.redSquare, backView: self.blueSquare)
if self.redSquare.superview ==  nil {
    views = (frontView: self.blueSquare, backView: self.redSquare)
}

UIView.transitionWithView(self.container, duration: 1.0, options: transitionOptions, animations: {
    views.frontView.removeFromSuperview()
    self.container.addSubview(views.backView)
  }, completion: { finished in
    // do things when it's done
})
```

<p>
Now for a easier method that only does a transition
</p>
```swift
var views = (frontView: self.redSquare, backView: self.blueSquare)
if self.redSquare.superview ==  nil {
  views = (frontView: self.blueSquare, backView: self.redSquare)
}
let transitionOptions = UIViewAnimationOptions.TransitionCurlUp
UIView.transitionFromView(views.frontView, toView: views.backView, duration: 1.0, options: transitionOptions, completion: nil)
```

