/*:
 ## Physics Engine
 
 Immediately below is code similar to what we explored on a prior page.
 
 Read past this section of code to learn how SpriteKit makes it possible for sprites (nodes) to interact in a realistic fashion.
 */

// Required frameworks
import PlaygroundSupport    // Allows playground to show live view
import SpriteKit            // Provides 2D graphics classes

// Define the animation size and scene
let frame = CGRect(x: 0, y: 0, width: 525, height: 320)
var scene = SKScene(size: frame.size)

// Define, configure, and present the scene
let view = SKView(frame: frame)
view.showsNodeCount = true
view.presentScene(scene)

// Show the view in the live view area
PlaygroundSupport.PlaygroundPage.current.liveView = view

/*:
 ### Setting the scene
 
 In the code below, a node that contains a cliff and a bit of a ramp are positioned at the bottom left corner of the scene.
 
 A boulder is positioned near the top left corner of the screen.
 
 Some crates are stacked at the bottom of the hill.
 
 And yes, all of these graphics are hand-drawn by Mr. Gordon – the artist who brought you the camelCase camel:
 
 ![camelCase](camelCase.jpeg)
 
 Run the code to see this scene.
 
 - Callout(Consider):
     What if we could have the boulder roll down the hill?
 
 */

// Create and position a boulder sprite near the top left corner of the screen
let boulder = SKSpriteNode(imageNamed: "boulder")
boulder.position = CGPoint(x: 56, y: scene.size.height - boulder.size.height / 2)
scene.addChild(boulder)

// Create and position the hill
let hill = SKSpriteNode(imageNamed: "hill")
hill.position = CGPoint(x: hill.size.width / 2, y: hill.size.height / 2)
scene.addChild(hill)

// Position six crates in a pyramid
for i in 1...3 {
    for j in 0...3 - i {
        let crate = SKSpriteNode(imageNamed: "crate")
        crate.name = "one of the crates"              // assign an identifier to this node
        crate.position = CGPoint(x: 500 - i * 50 - j * 25, y: 25 + j * 50)
        scene.addChild(crate)
    }
}

/*:
 ### Configuring Physics Bodies
 
 To allow nodes to interact with one another, we must define *bodies*, or edges, for the nodes.
 
 - Callout(Experiment):
 Remove the comments for each block of code below, one by one. Run the scene after each comment you remove. What happens?

 Remember that you can select a block of code by positioning your cursor at the left edge of the first line, then hold down the **Shift** key, then press the **↓** key.
  
 Once you have selected the block of code, press the **Command** and / keys at the same time to toggle the comments off all at once.
 
 */
//// Add a physics body for the hill
//hill.physicsBody = SKPhysicsBody(texture: hill.texture!,
//                                 alphaThreshold: 0.5,
//                                 size: hill.size)
//hill.physicsBody?.isDynamic = false // Hill will not move (not impacted by physics)

//// Add a physics body for the boulder
//boulder.physicsBody = SKPhysicsBody(circleOfRadius: boulder.size.width * 0.5)

//// Add a physics body for all nodes with identifier "one of the crates"
//for node in scene.children {
//
//    // Only look at nodes of type SKSpriteNode
//    if let thisNode = node as? SKSpriteNode {
//
//        // Only the crates
//        if thisNode.name == "one of the crates" {
//
//            // Add a physics body
//            thisNode.physicsBody = SKPhysicsBody(rectangleOf: thisNode.size)
//        }
//
//    }
//
//}

//// Configure the view so that physics body edges are visible
//view.showsPhysics = true

/*:
 ### Other types of physics bodies
 
 The results at this point in our animation are less than optimal!
 
 A bit more about physics bodies. There are *multiple types* of physics bodies that can be used.
 
 The physics bodies added to the boulder, the hill, and the crates – they are **dynamic** physics bodies. Each body moves, is solid, has mass, can collide with any other type of physics body, and responds to forces – like gravity. Dynamic physics are impacted by the physics engine – unless we tell the body not to be (like with the hill – look closely at the code above around line 83.
 
 Do you see what's happening?
 
 We need to define another type of physics body.
 
 The **edge-loop** physics body is a *static*, volume-less physics body. As the name implies, this type of body defines only the edges of the shape. The body has no mass, cannot collide with other edge loop bodies, and is not moved by the physics engine (but can be moved by *actions* – more on that later).
 
 When you need a boundary for your game or animation – the ground, a wall – you will use an edge-loop body to define a collision area.
   
 ![example](types-of-physics-bodies.png "Types of physics bodies")
 
  *Image from:* [2D Apple Games by Tutorials, raywenderlich.com](https://store.raywenderlich.com/products/2d-apple-games-by-tutorials)

 - Callout(Experiment):
    Try uncommenting the section below.
 
    Now what happens?

 */

//// Make an edge loop at the boundaries of the scene
//scene.physicsBody = SKPhysicsBody(edgeLoopFrom: scene.frame)

/*:
 - Callout(Reflect):
     What type of animations could you imagine creating using the SpriteKit Physics engine? What types of games?
 
 ### Refining the Simulation
 
 The results of the boulder rolling down the hill are not quite true to life, yet.
 
 A boulder has a lot of mass.
 
 Wooden crates have mass, but not as much.
 
 The boulder should move the crates more!
 
 So how can we make this happen?
 
 The SKPhysicsBody class [has properties](https://developer.apple.com/documentation/spritekit/skphysicsbody) (see "Defining a Physics Body’s Physical Properties") that let you [set the characteristics of a physics body](https://developer.apple.com/documentation/spritekit/skphysicsbody/configuring_a_physics_body).
 
 - Experiment:
     Uncomment the block of code below that adjusts the mass of the boulder, so that when the boulder rolls down the hill, it achieves an apppropriate amount of destruction with the crates.
 
 */
// What is the current mass of a crate?
scene.childNode(withName: "one of the crates")?.physicsBody?.mass

// What is the current mass of the boulder?
boulder.physicsBody?.mass

//// Change the boulder's mass
//boulder.physicsBody?.mass = 0.05


/*:
 
 ### Exercises
 
 Write code to complete each of the following tasks.
 
 1. lorem ipsum
 2. lorem ipsum
 3. lorem ipsum
 
 */

// Exercise 1: Write your code below.


// Exercise 2: Write your code below.


// Exercise 3: Write your code below.



/*:

 [Previous: Creating a SpriteKit Scene](@previous) | Page 3 | [Next: Physics Engine](@next)
 
 
 */