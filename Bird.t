%%%%%%%%%%%%%%  SUBCLASS OF GAMEOBJECT  %%%%%%%%%%%%%%%
unit
class Bird
    inherit GameObject in "GameObject.t"
    export jump, getDead, setDead
    var dead : boolean := false   
    var bird_border : int := 19
    var bird_yellow : int := 43
    var bird_lightyellow : int := 68
    var bird_white : int := 0
    var bird_orange : int := 42
    var size : int := 3

    dy := 0
    gravity := -0.25
    width := 51;
    height := 36;
    cwidth := 51;
    cheight := 36;

    body proc update
	dy += gravity
	y += dy
	if y < 100 then
	    y := 100
	end if
    end update

    body proc draw
	%body
	Draw.FillBox (round(x + size * 5), round(y + size), round(x + size * 10), round(y + size * 2), bird_yellow)
	Draw.FillBox (round(x + size * 3), round(y + size * 2), round(x + size * 9), round(y + size * 3), bird_yellow)
	Draw.FillBox (round(x + size * 5), round(y + size * 3), round(x + size * 8), round(y + size * 4), bird_yellow)
	Draw.FillBox (round(x + size * 6), round(y + size * 7), round(x + size * 7), round(y + size * 10), bird_lightyellow)
	Draw.FillBox (round(x + size * 7), round(y + size * 4), round(x + size * 8), round(y + size * 10), bird_lightyellow)
	Draw.FillBox (round(x + size * 8), round(y + size * 4), round(x + size * 9), round(y + size * 7), bird_lightyellow)
	Draw.FillBox (round(x + size * 6), round(y + size * 4), round(x + size * 8), round(y + size * 5), bird_lightyellow)
	Draw.FillBox (round(x + size * 9), round(y + size * 5), round(x + size * 10), round(y + size * 6), bird_lightyellow)
	Draw.FillBox (round(x + size * 5), round(y + size * 8), round(x + size * 6), round(y + size * 9), bird_lightyellow)
	Draw.FillBox (round(x + size * 6), round(y + size * 10), round(x + size * 9), round(y + size * 11), bird_white)
	Draw.FillBox (round(x + size * 4), round(y + size * 9), round(x + size * 5), round(y + size * 10), bird_white)
	Draw.FillBox (round(x + size * 5), round(y + size * 9), round(x + size * 6), round(y + size * 10), bird_white)
	%wing
	Draw.FillBox (round(x + size * 1), round(y + size * 5), round(x + size * 2), round(y + size * 6), bird_lightyellow)
	Draw.FillBox (round(x + size * 2), round(y + size * 4), round(x + size * 5), round(y + size * 5), bird_lightyellow)
	Draw.FillBox (round(x + size * 5), round(y + size * 5), round(x + size * 6), round(y + size * 6), bird_lightyellow)
	Draw.FillBox (round(x + size * 2), round(y + size * 5), round(x + size * 5), round(y + size * 6), bird_white)
	Draw.FillBox (round(x + size), round(y + size * 6), round(x + size * 7), round(y + size * 7), bird_white)
	Draw.FillBox (round(x + size), round(y + size * 7), round(x + size * 6), round(y + size * 8), bird_white)
	%lips
	Draw.FillBox (round(x + size * 16), round(y + size * 4), round(x + size * 10), round(y + size * 5), bird_orange)
	Draw.FillBox (round(x + size * 15), round(y + size * 2), round(x + size * 10), round(y + size * 3), bird_orange)
	Draw.FillBox (round(x + size * 9), round(y + size * 3), round(x + size * 10), round(y + size * 4), bird_orange)
	%eye white
	Draw.FillBox (round(x + size * 10), round(y + size * 7), round(x + size * 11), round(y + size * 11), bird_white)
	Draw.FillBox (round(x + size * 11), round(y + size * 6), round(x + size * 12), round(y + size * 11), bird_white)
	Draw.FillBox (round(x + size * 13), round(y + size * 6), round(x + size * 14), round(y + size * 9), bird_white)
	Draw.FillBox (round(x + size * 12), round(y + size * 6), round(x + size * 13), round(y + size * 7), bird_white)
	Draw.FillBox (round(x + size * 12), round(y + size * 9), round(x + size * 13), round(y + size * 10), bird_white)
	Draw.FillBox (round(x + size * 9), round(y + size * 9), round(x + size * 10), round(y + size * 10), bird_white)
	Draw.FillBox (round(x + size * 9), round(y + size * 8), round(x + size * 10), round(y + size * 9), bird_white)
	Draw.FillBox (round(x + size * 9), round(y + size * 7), round(x + size * 10), round(y + size * 8), bird_white)
	Draw.FillBox (round(x + size * 10), round(y + size * 6), round(x + size * 11), round(y + size * 7), bird_white)
	%border
	Draw.FillBox (round(x), round(y + size * 5), round(x + size), round(y + size * 8), bird_border)
	Draw.FillBox (round(x + size), round(y + size * 4), round(x + size * 2), round(y + size * 5), bird_border)
	Draw.FillBox (round(x + size * 2), round(y + size * 3), round(x + size * 3), round(y + size * 4), bird_border)
	Draw.FillBox (round(x + size * 2), round(y + size * 2), round(x + size * 3), round(y + size * 3), bird_border)
	Draw.FillBox (round(x + size * 3), round(y + size * 1), round(x + size * 4), round(y + size * 2), bird_border)
	Draw.FillBox (round(x + size * 4), round(y + size * 1), round(x + size * 5), round(y + size * 2), bird_border)
	Draw.FillBox (round(x + size * 5), round(y), round(x + size * 10), round(y + size), bird_border)
	Draw.FillBox (round(x + size * 10), round(y + size), round(x + size * 15), round(y + size * 2), bird_border)
	Draw.FillBox (round(x + size * 15), round(y + size * 2), round(x + size * 16), round(y + size * 3), bird_border)
	Draw.FillBox (round(x + size * 16), round(y + size * 3), round(x + size * 10), round(y + size * 4), bird_border)
	Draw.FillBox (round(x + size * 9), round(y + size * 2), round(x + size * 10), round(y + size * 3), bird_border)
	Draw.FillBox (round(x + size * 8), round(y + size * 3), round(x + size * 9), round(y + size * 4), bird_border)
	Draw.FillBox (round(x + size * 9), round(y + size * 4), round(x + size * 10), round(y + size * 5), bird_border)
	Draw.FillBox (round(x + size * 16), round(y + size * 5), round(x + size * 10), round(y + size * 6), bird_border)
	Draw.FillBox (round(x + size * 16), round(y + size * 4), round(x + size * 17), round(y + size * 5), bird_border)
	Draw.FillBox (round(x + size * 14), round(y + size * 6), round(x + size * 15), round(y + size * 9), bird_border)
	Draw.FillBox (round(x + size * 13), round(y + size * 9), round(x + size * 14), round(y + size * 10), bird_border)
	Draw.FillBox (round(x + size * 12), round(y + size * 8), round(x + size * 13), round(y + size * 9), bird_border)
	Draw.FillBox (round(x + size * 12), round(y + size * 7), round(x + size * 13), round(y + size * 8), bird_border)
	Draw.FillBox (round(x + size * 12), round(y + size * 10), round(x + size * 13), round(y + size * 11), bird_border)
	Draw.FillBox (round(x + size * 12), round(y + size * 11), round(x + size * 6), round(y + size * 12), bird_border)
	Draw.FillBox (round(x + size * 9), round(y + size * 10), round(x + size * 10), round(y + size * 11), bird_border)
	Draw.FillBox (round(x + size * 8), round(y + size * 10), round(x + size * 9), round(y + size * 7), bird_border)
	Draw.FillBox (round(x + size * 9), round(y + size * 6), round(x + size * 10), round(y + size * 7), bird_border)
	Draw.FillBox (round(x + size * 5), round(y + size * 10), round(x + size * 6), round(y + size * 11), bird_border)
	Draw.FillBox (round(x + size * 4), round(y + size * 10), round(x + size * 5), round(y + size * 11), bird_border)
	Draw.FillBox (round(x + size * 3), round(y + size * 9), round(x + size * 4), round(y + size * 10), bird_border)
	Draw.FillBox (round(x + size), round(y + size * 8), round(x + size * 5), round(y + size * 9), bird_border)
	Draw.FillBox (round(x + size * 5), round(y + size * 7), round(x + size * 6), round(y + size * 8), bird_border)
	Draw.FillBox (round(x + size * 6), round(y + size * 6), round(x + size * 7), round(y + size * 7), bird_border)
	Draw.FillBox (round(x + size * 6), round(y + size * 5), round(x + size * 7), round(y + size * 6), bird_border)
	Draw.FillBox (round(x + size * 5), round(y + size * 4), round(x + size * 6), round(y + size * 5), bird_border)
	Draw.FillBox (round(x + size * 4), round(y + size * 3), round(x + size * 5), round(y + size * 4), bird_border)
	Draw.FillBox (round(x + size * 3), round(y + size * 3), round(x + size * 4), round(y + size * 4), bird_border)     %border
	Draw.FillBox (round(x), round(y + size * 5), round(x + size), round(y + size * 8), bird_border)
	Draw.FillBox (round(x + size), round(y + size * 4), round(x + size * 2), round(y + size * 5), bird_border)
	Draw.FillBox (round(x + size * 2), round(y + size * 3), round(x + size * 3), round(y + size * 4), bird_border)
	Draw.FillBox (round(x + size * 2), round(y + size * 2), round(x + size * 3), round(y + size * 3), bird_border)
	Draw.FillBox (round(x + size * 3), round(y + size * 1), round(x + size * 4), round(y + size * 2), bird_border)
	Draw.FillBox (round(x + size * 4), round(y + size * 1), round(x + size * 5), round(y + size * 2), bird_border)
	Draw.FillBox (round(x + size * 5), round(y), round(x + size * 10), round(y + size), bird_border)
	Draw.FillBox (round(x + size * 10), round(y + size), round(x + size * 15), round(y + size * 2), bird_border)
	Draw.FillBox (round(x + size * 15), round(y + size * 2), round(x + size * 16), round(y + size * 3), bird_border)
	Draw.FillBox (round(x + size * 16), round(y + size * 3), round(x + size * 10), round(y + size * 4), bird_border)
	Draw.FillBox (round(x + size * 9), round(y + size * 2), round(x + size * 10), round(y + size * 3), bird_border)
	Draw.FillBox (round(x + size * 8), round(y + size * 3), round(x + size * 9), round(y + size * 4), bird_border)
	Draw.FillBox (round(x + size * 9), round(y + size * 4), round(x + size * 10), round(y + size * 5), bird_border)
	Draw.FillBox (round(x + size * 16), round(y + size * 5), round(x + size * 10), round(y + size * 6), bird_border)
	Draw.FillBox (round(x + size * 16), round(y + size * 4), round(x + size * 17), round(y + size * 5), bird_border)
	Draw.FillBox (round(x + size * 14), round(y + size * 6), round(x + size * 15), round(y + size * 9), bird_border)
	Draw.FillBox (round(x + size * 13), round(y + size * 9), round(x + size * 14), round(y + size * 10), bird_border)
	Draw.FillBox (round(x + size * 12), round(y + size * 8), round(x + size * 13), round(y + size * 9), bird_border)
	Draw.FillBox (round(x + size * 12), round(y + size * 7), round(x + size * 13), round(y + size * 8), bird_border)
	Draw.FillBox (round(x + size * 12), round(y + size * 10), round(x + size * 13), round(y + size * 11), bird_border)
	Draw.FillBox (round(x + size * 12), round(y + size * 11), round(x + size * 6), round(y + size * 12), bird_border)
	Draw.FillBox (round(x + size * 9), round(y + size * 10), round(x + size * 10), round(y + size * 11), bird_border)
	Draw.FillBox (round(x + size * 8), round(y + size * 10), round(x + size * 9), round(y + size * 7), bird_border)
	Draw.FillBox (round(x + size * 9), round(y + size * 6), round(x + size * 10), round(y + size * 7), bird_border)
	Draw.FillBox (round(x + size * 5), round(y + size * 10), round(x + size * 6), round(y + size * 11), bird_border)
	Draw.FillBox (round(x + size * 4), round(y + size * 10), round(x + size * 5), round(y + size * 11), bird_border)
	Draw.FillBox (round(x + size * 3), round(y + size * 9), round(x + size * 4), round(y + size * 10), bird_border)
	Draw.FillBox (round(x + size), round(y + size * 8), round(x + size * 5), round(y + size * 9), bird_border)
	Draw.FillBox (round(x + size * 5), round(y + size * 7), round(x + size * 6), round(y + size * 8), bird_border)
	Draw.FillBox (round(x + size * 6), round(y + size * 6), round(x + size * 7), round(y + size * 7), bird_border)
	Draw.FillBox (round(x + size * 6), round(y + size * 5), round(x + size * 7), round(y + size * 6), bird_border)
	Draw.FillBox (round(x + size * 5), round(y + size * 4), round(x + size * 6), round(y + size * 5), bird_border)
	Draw.FillBox (round(x + size * 4), round(y + size * 3), round(x + size * 5), round(y + size * 4), bird_border)
	Draw.FillBox (round(x + size * 3), round(y + size * 3), round(x + size * 4), round(y + size * 4), bird_border)
    end draw

    proc jump
	if dy < 0 then
	    dy := 5
	end if
    end jump

    fcn getDead : boolean
	result dead
    end getDead

    proc setDead (b : boolean)
	dead := b
    end setDead
end Bird
