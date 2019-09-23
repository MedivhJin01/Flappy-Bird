%%%%%%%%%%%%%%  SUBCLASS OF GAMEOBJECT  %%%%%%%%%%%%%%%
unit
class Pillar
    inherit GameObject in "GameObject.t"
    export setMoving, getMoving
    var moving : boolean := true
    dx := -2;
    width := 75
    height := 1000
    cwidth := 75
    cheight := 110

    body proc update
	if moving then
	    x += dx
	end if
    end update

    body proc draw
	%Top pillar
	Draw.FillBox (round (x - width div 2), round (y + cheight div 2) + 27, round (x + width div 2), round (y + height div 2), black)
	Draw.FillBox (round (x - width div 2) + 3, round (y + cheight div 2) + 30, round (x + width div 2) - 3, round (y + height div 2), 10)
	Draw.FillBox (round (x - width div 2) + 6, round (y + cheight div 2) + 34, round (x - width div 2) + 9, round (y + height div 2), 68)
	Draw.FillBox (round (x - width div 2) + 20, round (y + cheight div 2) + 34, round (x - width div 2) + 22, round (y + height div 2), 2)
	Draw.FillBox (round (x - width div 2) + 26, round (y + cheight div 2) + 34, round (x + width div 2) - 3, round (y + height div 2), 2)
	Draw.FillBox (round (x + width div 2) - 11, round (y + cheight div 2) + 34, round (x + width div 2) - 3, round (y + height div 2), 191)
	Draw.FillBox (round (x + width div 2) - 19, round (y + cheight div 2) + 34, round (x + width div 2) - 16, round (y + height div 2), 191)
	%the top square
	Draw.FillBox (round (x - width div 2) - 6, round (y + cheight div 2), round (x + width div 2) + 6, round (y + cheight div 2) + 33, black)
	Draw.FillBox (round (x - width div 2) - 3, round (y + cheight div 2) + 3, round (x + width div 2) + 3, round (y + cheight div 2) + 30, 10)
	Draw.FillBox (round (x - width div 2), round (y + cheight div 2) + 3, round (x - width div 2) + 3, round (y + cheight div 2) + 30, 68)
	Draw.FillBox (round (x - width div 2) + 14, round (y + cheight div 2) + 3, round (x - width div 2) + 16, round (y + cheight div 2) + 30, 2)
	Draw.FillBox (round (x - width div 2) + 20, round (y + cheight div 2) + 3, round (x + width div 2) + 3, round (y + cheight div 2) + 30, 2)
	Draw.FillBox (round (x + width div 2) - 5, round (y + cheight div 2) + 3, round (x + width div 2) + 3, round (y + cheight div 2) + 30, 191)
	Draw.FillBox (round (x + width div 2) - 13, round (y + cheight div 2) + 3, round (x + width div 2) - 10, round (y + cheight div 2) + 30, 191)
	%Bottom pillar
	Draw.FillBox (round (x - width div 2), round (y - cheight div 2) - 27, round (x + width div 2), 0, black)
	Draw.FillBox (round (x - width div 2) + 3, round (y - cheight div 2) - 30, round (x + width div 2) - 3, 0, 46)
	Draw.FillBox (round (x - width div 2) + 6, round (y - cheight div 2) - 30, round (x - width div 2) + 9, 0, 68)
	Draw.FillBox (round (x - width div 2) + 20, round (y - cheight div 2) - 30, round (x - width div 2) + 22, 0, 2)
	Draw.FillBox (round (x - width div 2) + 26, round (y - cheight div 2) - 30, round (x + width div 2) - 3, 0, 2)
	Draw.FillBox (round (x + width div 2) - 11, round (y - cheight div 2) - 30, round (x + width div 2) - 3, 0, 191)
	Draw.FillBox (round (x + width div 2) - 19, round (y - cheight div 2) - 30, round (x + width div 2) - 16, 0, 191)
	%the bottom square
	Draw.FillBox (round (x - width div 2) - 6, round (y - cheight div 2), round (x + width div 2) + 6, round (y - cheight div 2) - 30, black)
	Draw.FillBox (round (x - width div 2) - 3, round (y - cheight div 2) - 3, round (x + width div 2) + 3, round (y - cheight div 2) - 27, 10)
	Draw.FillBox (round (x - width div 2), round (y - cheight div 2) - 3, round (x - width div 2) + 3, round (y - cheight div 2) - 27, 68)
	Draw.FillBox (round (x - width div 2) + 14, round (y - cheight div 2) - 3, round (x - width div 2) + 16, round (y - cheight div 2) - 27, 2)
	Draw.FillBox (round (x - width div 2) + 20, round (y - cheight div 2) - 3, round (x + width div 2) + 3, round (y - cheight div 2) - 27, 2)
	Draw.FillBox (round (x + width div 2) - 5, round (y - cheight div 2) - 3, round (x + width div 2) + 3, round (y - cheight div 2) - 27, 191)
	Draw.FillBox (round (x + width div 2) - 13, round (y - cheight div 2) - 3, round (x + width div 2) - 10, round (y - cheight div 2) - 27, 191)
    end draw

    proc setMoving (b : boolean)
	moving := b
    end setMoving

    fcn getMoving : boolean
	result moving
    end getMoving
end Pillar
