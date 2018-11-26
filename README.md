# SlidingViewController2

Simple Example
--------------

var upSwipeGesture: UISwipeGestureRecognizer
upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeMenuUp))
upSwipeGesture.direction = [ .up ]
self.uivTopMenu.addGestureRecognizer(upSwipeGesture)
        
// TopMenu(Hamburger)
var tempFrame: CGRect = self.uivTopMenu.frame
tempFrame.origin.x = 0.0
tempFrame.origin.y = -(self.uivTopMenu.frame.size.height)
tempFrame.size.width = self.uivTopMenu.frame.size.width
tempFrame.size.height = self.uivTopMenu.frame.size.height
self.uivTopMenu.frame = tempFrame
        
self.view.addSubview(self.uivTopMenu)
        
uivTopMenu.isHidden = true
        
        
License
-------

Copyright 2012-2014 Jeremy Feinstein

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
