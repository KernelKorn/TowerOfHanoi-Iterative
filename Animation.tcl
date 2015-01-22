#Assignment 4 CSCIB466 Fall 2014
#Group Members Caleb Shedd, Ryan Corn 






#
# This example introduces the concepts of interaction into the
# Tcl environment. First, a different interaction style (than
# the default) is defined. Second, because Tcl is an interpretive
# language, the VTK Tcl interaction GUI is set up.
# 
#
#
# First we include the VTK Tcl packages which will make available 
# all of the VTK commands to Tcl. Note that package vtkinteraction
# is required; thios package defines the Tcl/Tk GUI widget .vtkInteract
# that is referred to later.
#
package require vtk
package require vtkinteraction


# Creating the base

vtkCubeSource base
	base SetXLength 10.0
	base SetYLength 0.5
	base SetZLength 2.0

 vtkPolyDataMapper baseMapper
 baseMapper SetInputConnection [base GetOutputPort]


 # vtkTransform baseTrans
	# baseTrans Translate -2 0 0 

vtkActor baseActor
baseActor SetMapper baseMapper
[baseActor GetProperty] SetColor 1 1 1 
# [baseActor GetProperty] SetDiffuse 0.5
# [baseActor GetProperty] SetSpecular 0.4
# [baseActor GetProperty] SetSpecularPower 20
# [baseActor GetProperty] SetAmbient 0.5
#[baseActor GetProperty] BackfaceCullingOn
#[baseActor GetProperty] FrontfaceCullingOn
#[baseActor GetProperty] SetRepresentationToPoints
#[baseActor GetProperty] SetLineStipplePattern 1
#[baseActor GetProperty] SetOpacity 0.5
# [baseActor GetProperty] SetLineWidth 5
# baseActor SetUserTransform baseTrans	

# Creating the pegs

vtkCylinderSource pegs
	pegs SetHeight 3.0
	pegs SetRadius .5
	pegs SetResolution 20
	
vtkPolyDataMapper pegsMapper
	pegsMapper SetInputConnection [pegs GetOutputPort]
	
vtkActor peg1Actor
	peg1Actor SetMapper pegsMapper
	peg1Actor SetPosition -3.5 1.5 0.0
    
vtkActor peg2Actor
	peg2Actor SetMapper pegsMapper
	peg2Actor SetPosition 0.0 1.5 0.0
	
vtkActor peg3Actor
	peg3Actor SetMapper pegsMapper
	peg3Actor SetPosition 3.5 1.5 0.0
	
# creating the rings

vtkCylinderSource ring1
	ring1 SetHeight 0.5
	ring1 SetRadius 2.0
	ring1 SetResolution 20

vtkPolyDataMapper ring1Mapper
	ring1Mapper SetInputConnection [ring1 GetOutputPort]
	
vtkActor ring1Actor
	ring1Actor SetMapper ring1Mapper
	ring1Actor SetPosition -3.5 0.5 0.0
	[ring1Actor GetProperty] SetColor 1 0 0
	
vtkCylinderSource ring2
	ring2 SetHeight 0.5
	ring2 SetRadius 1.5
	ring2 SetResolution 20

vtkPolyDataMapper ring2Mapper
	ring2Mapper SetInputConnection [ring2 GetOutputPort]
	
vtkActor ring2Actor
	ring2Actor SetMapper ring2Mapper
	ring2Actor SetPosition -3.5 1.0 0.0
	[ring2Actor GetProperty] SetColor 0 1 0
	
vtkCylinderSource ring3
	ring3 SetHeight 0.5
	ring3 SetRadius 1.0
	ring3 SetResolution 20

vtkPolyDataMapper ring3Mapper
	ring3Mapper SetInputConnection [ring3 GetOutputPort]
	
vtkActor ring3Actor
	ring3Actor SetMapper ring3Mapper
	ring3Actor SetPosition -3.5 1.5 0.0
	[ring3Actor GetProperty] SetColor 0 0 1
	
#
# Create the Renderer and assign actors to it. A renderer is like a
# viewport. It is part or all of a window on the screen and it is responsible
# for drawing the actors it has.  We also set the background color here.
#
vtkRenderer ren1 
ren1 AddActor baseActor
ren1 AddActor peg1Actor
ren1 AddActor peg2Actor
ren1 AddActor peg3Actor
ren1 AddActor ring1Actor
ren1 AddActor ring2Actor
ren1 AddActor ring3Actor
ren1 SetBackground 0 0 0  


	
vtkRenderWindow renWin
renWin AddRenderer ren1
renWin SetSize 300 300

#First Ring Movement

	renWin Render
	ring3Actor SetPosition -3.5 3.5 0.0
	after 1000
	
	
	renWin Render
	ring3Actor SetPosition  0.5 3.5 0.0 
	after 1000
	
	renWin Render
	ring3Actor SetPosition  3.5 3.5 0.0 
	after 1000

	renWin Render
	ring3Actor SetPosition  3.5 0.5 0.0 
	after 1000

	
#Second Ring Movement
	renWin Render
	ring2Actor SetPosition  -3.5 3.5 0.0  
	after 1000
	
	renWin Render
	ring2Actor SetPosition  0.0 3.5 0.0  
	after 1000
	

	renWin Render
	#to peg 3
	ring2Actor SetPosition  0.0 0.5 0.0 
	after 1000
	
#First Ring Movement

	renWin Render
	ring3Actor SetPosition  3.5 3.5 0.0
	after 1000


	renWin Render
	ring3Actor SetPosition  0.0 3.5 0.0 
	after 1000
	
	
	renWin Render
	ring3Actor SetPosition  0.0 1.0 0.0 
	after 1000
	
# Third Ring Movement
	
	renWin Render
	ring1Actor SetPosition  -3.5 3.5 0.0 
	after 1000
	
	
	renWin Render
	ring1Actor SetPosition  0.0 3.5 0.0 
	after 1000
	
	renWin Render
	ring1Actor SetPosition  3.5 3.5 0.0 
	after 1000
	
	renWin Render
	ring1Actor SetPosition  3.5 0.5 0.0 
	after 1000
	
	
#First Ring Movement
	
	renWin Render
	ring3Actor SetPosition  0.0 3.5 0.0 
	after 1000
	
	renWin Render
	ring3Actor SetPosition  -3.5 3.5 0.0 
	after 1000
	
	renWin Render
	ring3Actor SetPosition  -3.5 0.5 0.0 
	after 1000
	
	
	
#Second Ring Movement

	renWin Render
	ring2Actor SetPosition  0.0 3.5 0.0 
	after 1000
	
	renWin Render
	ring2Actor SetPosition  3.5 3.5 0.0 
	after 1000

	renWin Render
	#to peg 3
	ring2Actor SetPosition  3.5 1.0 0.0 
	after 1000
	
	
#First Ring Movement
	renWin Render
	ring3Actor SetPosition  -3.5 3.5 0.0
	after 1000
	
	renWin Render
	ring3Actor SetPosition  0.0 3.5 0.0
	after 1000
	
	renWin Render
	ring3Actor SetPosition  3.5 3.5 0.0
	after 1000
	
	renWin Render
	ring3Actor SetPosition  3.5 1.5 0.0
	after 1000
	


# 
# The vtkRenderWindowInteractor class watches for events (e.g., keypress,
# mouse) in the vtkRenderWindow. These events are translated into
# event invocations that VTK understands (see VTK/Common/vtkCommand.h
# for all events that VTK processes). Then observers of these VTK
# events can process them as appropriate.
vtkRenderWindowInteractor iren
iren SetRenderWindow renWin

#
# By default the vtkRenderWindowInteractor instantiates an instance
# of vtkInteractorStyle. vtkInteractorStyle translates a set of events
# it observes into operations on the camera, actors, and/or properties
# in the vtkRenderWindow associated with the vtkRenderWinodwInteractor. 
# Here we specify a particular interactor style.
# vtkInteractorStyleTrackballCamera style
# iren SetInteractorStyle style

#
# Unlike the previous scripts where we performed some operations and then
# exited, here we leave an event loop running. The user can use the mouse
# and keyboard to perform the operations on the scene according to the
# current interaction style.
#

#
# Another feature of Tcl/Tk is that in VTK a simple GUI for typing in
# interpreted Tcl commands is provided. The so-called vtkInteractor appears
# when the user types the "u" (for user) keypress. The "u" keypress is
# translated into a UserEvent by the vtkRenderWindowInteractor. We observe
# this event and invoke a commands to deiconify the vtkInteractor. (The
# vtkInteractor is defined in the vtkinteraction package reference at the
# beginning of this script.)
# 
#
iren AddObserver UserEvent {wm deiconify .vtkInteract}

#
# Initialize the event loop. The actual interaction starts after 
# wm withdraw . with the Tk event loop. Once the render window appears, 
# mouse in the window to move the camera. Note that keypress-e exits this
# example. (Look in vtkInteractorStyle.h for a summary of events, or
# the appropriate Doxygen documentation.)
#
iren Initialize

#
# Since we are in the Tcl/Tk environment, we prevent the empty "."
# window from appearing with the Tk "withdraw" command.
#
wm withdraw .





