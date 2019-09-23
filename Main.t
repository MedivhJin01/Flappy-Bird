%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PROGRAM NAME   :  FLAPPY BIRD
%NAME           :  MEDIVH JIN
%DATE           :  Mar. 29 2019
%INTRODUCTION   :  Flappy Bird is a turing game based on Flappy Bird but
%                  developed by Medivh Jin. The game is a side-scoller
%                  where the player controls a bird, attempting to fly
%                  between columns of green pipes without hitting them.
%                  The game will record the best performance everytime
%                  and give player encouragements.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%  IMPORT  %%%%%%%%%%%%%%%%
import Bird in "Bird.t", Pillar in "Pillar.t"

%%%%%%%%%%%%%%%%  GLOBAL VARIABLES  %%%%%%%%%%%%%%%%%%
setscreen ("graphics: 450, 550")
View.Set ("offscreenonly")
var chars : array char of boolean
var pillars : flexible array 1 .. 0 of ^Pillar
var bird : ^Bird
var lastTime : real
var passTime : real := 0
var score : int := 0
var bestscore : int
var dummy : string
var title : int := Pic.FileNew ("title.jpg")
var background : int := Pic.FileNew ("background.jpg")
var credits_title : int := Pic.FileNew ("credits_title.jpg")
var gameover : int := Pic.FileNew ("GameOver.jpg")
var font : int := Font.New ("Palatino:15")
var font2 : int := Font.New ("Palatino:15:bold")
var scorefont : int := Font.New ("Impact:25:bold")
var mousex, mousey, mouseclick : int
var grassX : array 1 .. 4 of int := init (0, 10, 24, 14)
var grassY : array 1 .. 4 of int := init (82, 93, 93, 82)
var performance : string := ""
var width := Font.Width (performance, font2)
var hoverUp : boolean := true
var readyPlayer : boolean := false
var maxHeight : int := 295
var minHeight : int := 270
var mouseX : int := 225
var mouseY : int := 260
var size : int := 3
var stream : int

new bird
^bird.setPosition (140, 275)
lastTime := Time.Elapsed

proc startButton    %draw start button
    Draw.FillBox (80, 142, 189, 181, 16)
    Draw.FillBox (83, 145, 186, 178, 0)
    Draw.FillBox (86, 148, 183, 175, 42)
    Font.Draw ("START", 103, 155, font, white)
end startButton

proc helpButton %draw help button
    Draw.FillBox (256, 142, 365, 181, 16)
    Draw.FillBox (259, 145, 362, 178, 0)
    Draw.FillBox (262, 148, 359, 175, 42)
    Font.Draw ("HELP", 284, 155, font, white)
end helpButton

proc Gameover
    Pic.Draw (gameover, 57, 380, picCopy)
end Gameover

proc drawTitle  %draw the title after the credit
    Pic.Draw (title, 20, round ( ^bird.getY () + 90), picCopy)
end drawTitle

proc Background %draw the background of the game
    Pic.Draw (background, 0, 0, picCopy)
end Background

fcn hit : boolean  % to check whether the bird hits the pillars
    var x : boolean := false
    for i : 1 .. upper (pillars)
	if ( ^bird.getX () + ^bird.getCWidth ()) > ( ^ (pillars (i)).getX () - ^ (pillars (i)).getCWidth () div 2)
		and ( ^bird.getX ()) < ( ^ (pillars (i)).getX () + ^ (pillars (i)).getCWidth () div 2) then
	    if ( ^bird.getY () + ^bird.getCHeight ()) > ( ^ (pillars (i)).getY () + ^ (pillars (i)).getCHeight () div 2) then
		x := true
	    elsif ( ^bird.getY ()) < ( ^ (pillars (i)).getY () - ^ (pillars (i)).getCHeight () div 2) then
		x := true
	    end if
	end if
    end for
    if x then
	result true
    elsif ( ^bird.getY ()) <= 100 then
	result true
    else
	result false
    end if
end hit

fcn pass : boolean  %to check whether the bird passes the pillar
    for i : 1 .. upper (pillars)
	if ( ^bird.getX ()) > ( ^ (pillars (i)).getX () - ^ (pillars (i)).getWidth () div 2)
		and ( ^bird.getX () + ^bird.getWidth ()) < ( ^ (pillars (i)).getX () + ^ (pillars (i)).getWidth () div 2) then
	    if ( ^bird.getY () + ^bird.getHeight () div 2) < ( ^ (pillars (i)).getY () + ^ (pillars (i)).getCHeight () div 2)
		    or ( ^bird.getY () - ^bird.getHeight () div 2) > ( ^ (pillars (i)).getY () - ^ (pillars (i)).getCHeight () div 2) then
		result true
	    end if
	end if
    end for
    result false
end pass

proc BirdHover (a : int)    %bird's hover after the credit
    if readyPlayer = false and hoverUp = true then
	^bird.setPosition ( ^bird.getX (), ^bird.getY () + 1)
	if ^bird.getY () = maxHeight then
	    hoverUp := false
	end if
    elsif readyPlayer = false and hoverUp = false then
	^bird.setPosition ( ^bird.getX (), ^bird.getY () - 1)
	if ^bird.getY () = minHeight then
	    hoverUp := true
	end if
    end if
    ^bird.draw
end BirdHover

proc update %update every changes behind the scene
    if ^bird.getDead = false and (Time.Elapsed - lastTime) > 2000 then
	lastTime := Time.Elapsed
	new pillars, upper (pillars) + 1
	new pillars (upper (pillars))
	^ (pillars (upper (pillars))).setPosition (maxx + 100, Rand.Int (200, 400))
    end if
    ^bird.update ()
    for i : 1 .. upper (pillars)
	^ (pillars (i)).update
    end for
    if ^ (pillars (1)).getX () < -30 then
	for i : 1 .. upper (pillars) - 1
	    pillars (i) := pillars (i + 1)
	end for
	new pillars, upper (pillars) - 1
    end if
    if hit then
	^bird.setDead (true)
	for i : 1 .. upper (pillars)
	    ^ (pillars (i)).setMoving (false)
	end for
    end if
    if pass and ^bird.getDead = false and (Time.Elapsed - passTime) > 1000 then
	score += 1
	passTime := Time.Elapsed
    end if
end update

procedure scoremenu %the score menu after the bird dead
    loop

	var g : int := 225
	Draw.FillBox (40, g, 410, g + 150, 19)
	Draw.FillBox (45, g + 6, 405, g + 145, 67)
	open : stream, "bestScore.txt", put
	if score > bestscore then
	    bestscore := score
	    put : stream, intstr(score)
	else
	    put : stream, intstr(bestscore)
	end if
	close : stream
	Font.Draw ("BEST SCORE", 80, g + 115, font2, 42)
	Font.Draw (intstr (bestscore), 80, g + 80, scorefont, 68)
	Font.Draw (intstr (bestscore), 80, g + 82, scorefont, 43)
	Font.Draw ("YOUR SCORE", 255, g + 24, font2, 42)
	Font.Draw (intstr (score), 364 - (length (intstr (score)) - 1) * 15, g + 47, scorefont, 68)
	Font.Draw (intstr (score), 364 - (length (intstr (score)) - 1) * 15, g + 49, scorefont, 43)
	if score >= 0 and score <= 5 then
	    performance := "NOT BAD:)"
	elsif score > 5 and score <= 15 then
	    performance := "GOOD"
	elsif score > 15 and score <= 30 then
	    performance := "!AWESOME!"
	elsif score > 30 and score <= 50 then
	    performance := "!!EXCELLENT!!"
	elsif score > 50 then
	    performance := "!!!GOD LIKE!!!"
	end if
	width := Font.Width (performance, font2)
	Font.Draw (performance, round (maxx div 2 - width div 2), g + 68, font2, 68)
	Font.Draw (performance, round (maxx div 2 - width div 2), g + 70, font2, 42)
	Draw.FillBox (176, 142, 285, 181, 16)
	Draw.FillBox (179, 145, 282, 178, 0)
	Draw.FillBox (182, 148, 279, 175, 42)
	Font.Draw ("BACK", 204, 155, font, white)
	mousewhere (mousex, mousey, mouseclick)
	if mouseclick = 1 then
	    if mousex > 176 and mousex < 285 and mousey > 142 and mousey < 181 then
		delay (100)
		^bird.setDead (false)
		score := 0
		lastTime := 0
		new pillars, 0
		^bird.setPosition (140, 275)
	    end if
	end if
	exit when ^bird.getDead = false
	View.Update
    end loop
end scoremenu

proc drawMouse  %draw thw mouse in the help menu
    %border
    Draw.FillBox (mouseX + size * 3, mouseY - size * 3, mouseX + size * 4, mouseY + size * 4, black)
    Draw.FillBox (mouseX - size * 3, mouseY - size * 3, mouseX - size * 2, mouseY + size * 4, black)
    Draw.FillBox (mouseX - size * 2, mouseY + size, mouseX + size * 3, mouseY + size * 2, black)
    Draw.FillBox (mouseX - size * 2, mouseY - size * 4, mouseX - size, mouseY - size * 3, black)
    Draw.FillBox (mouseX - size, mouseY - size * 5, mouseX + size * 2, mouseY - size * 4, black)
    Draw.FillBox (mouseX + size * 2, mouseY - size * 4, mouseX + size * 3, mouseY - size * 3, black)
    Draw.FillBox (mouseX - size * 2, mouseY + size * 4, mouseX + size * 3, mouseY + size * 5, black)
    Draw.FillBox (mouseX, mouseY + size * 2, mouseX + size, mouseY + size * 7, black)
    Draw.FillBox (mouseX - size * 2, mouseY + size * 7, mouseX, mouseY + size * 8, black)
    Draw.FillBox (mouseX - size * 4, mouseY + size * 6, mouseX - size * 2, mouseY + size * 7, black)
    Draw.FillBox (mouseX - size * 5, mouseY + size * 7, mouseX - size * 4, mouseY + size * 9, black)
    %grey
    Draw.FillBox (mouseX - size * 2, mouseY - size * 3, mouseX + size * 3, mouseY + size, 29)
    Draw.FillBox (mouseX - size, mouseY - size * 4, mouseX + size * 2, mouseY - size * 3, 29)
    %lightgrey left
    Draw.FillBox (mouseX + size, mouseY + size * 2, mouseX + size * 3, mouseY + size * 4, 29)
    Draw.FillBox (mouseX - size * 2, mouseY + size * 2, mouseX, mouseY + size * 4, 42)
end drawMouse

proc helpMenu   %draw the help menu
    Draw.FillBox (40, 225, 410, 375, 19)
    Draw.FillBox (45, 230, 405, 370, 67)
    Font.Draw ("ARE YOU KIDDING?", 130, 320, font2, 42)
    Font.Draw ("WHAT A SIMPLE GAME IT IS :)", 75, 295, font2, 42)
    Font.Draw ("CLICK        TO FLY", 140, 260, font2, 42)
    drawMouse
end helpMenu

proc Ground %draw the ground
    Draw.FillBox (0, 0, maxx, 100, 67)
    Draw.FillBox (0, 75, maxx, 78, 66)
    Draw.FillBox (0, 78, maxx, 81, 119)
    Draw.FillBox (0, 95, maxx, 98, 68)
    Draw.FillBox (0, 97, maxx, 101, 16)
    Draw.FillBox (0, 81, maxx, 94, 46)
    for a : 1 .. 50
	Draw.FillPolygon (grassX, grassY, 4, 49)
	for b : 1 .. 4
	    grassX (b) += 25
	end for
    end for
    Draw.FillPolygon (grassX, grassY, 4, 49)
    for b : 1 .. 4
	grassX (b) -= 1250
    end for
    for b : 1 .. 4
	grassX (b) += -3
    end for
    if grassX (1) <= -300 then
	grassX (1) := 0
	grassX (2) := 10
	grassX (3) := 24
	grassX (4) := 14
    end if
end Ground

proc draw   %update the game
    cls
    Background
    ^bird.draw ()
    for i : 1 .. upper (pillars)
	^ (pillars (i)).draw ()
    end for
    Font.Draw (intstr (score), 218 - (length (intstr (score)) - 1) * 8, 447, scorefont, 16)
    Font.Draw (intstr (score), 218 - (length (intstr (score)) - 1) * 8, 450, scorefont, 0)
    Ground
    View.Update ()
    delay (12)
end draw

process getKey  %make sure the bird can fly by clicking the mouse
    mousewhere (mousex, mousey, mouseclick)
    if mouseclick = 1 and ^bird.getDead = false then
	^bird.jump ()
    end if
end getKey

proc gamePlay   %game start
    loop
	update ()
	draw ()
	fork getKey
	exit when ^bird.getDead ()
    end loop
end gamePlay

proc mainMenu   %the main menu after the credit
    for i : 0 .. maxint
	cls
	Background
	drawTitle
	Ground
	startButton
	helpButton
	BirdHover (i)
	mousewhere (mousex, mousey, mouseclick)
	if mouseclick = 1 then
	    if mousex > 83 and mousex < 186 and mousey > 145 and mousey < 178 then
		gamePlay
	    elsif mousex > 259 and mousex < 362 and mousey > 145 and mousey < 178 then
		helpMenu
	    end if
	end if
	if ^bird.getDead = true then    %animation after the bird dead
	    drawfillbox (0, 0, maxx, maxy, 0)
	    View.Update
	    delay (50)
	    for decreasing p : round ( ^bird.getY ()) .. 100 by 5
		cls
		Background
		Ground
		^bird.setPosition (140, p)
		^bird.draw
		View.Update
	    end for
	    Gameover
	    open : stream, "bestScore.txt", get
	    get : stream, dummy
	    bestscore := strint(dummy)
	    close : stream
	    scoremenu
	end if
	delay (15)
	View.Update
    end for
end mainMenu

procedure begining  %the credit and then the start of the game
    Draw.FillBox (0, 0, 450, 550, black)
    Pic.Draw (credits_title, 20, 275, picCopy)
    delay (3000)
    mainMenu
    colorback (54)
end begining

begining


