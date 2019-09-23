%%%%%%%%%%%%%%  SUPERCLASS  %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%  INHERITED BY Pillar.t and Bird.t  %%%%%%%%%%%%%%%
unit
class GameObject
    export update, draw, setPosition, getX, getY, setDy, setWidth, setHeight, getWidth, getHeight, setCWidth, setCHeight, getCWidth, getCHeight
    var x : real
    var y : real
    var dx : real
    var dy : real
    var gravity : real
    var width : int
    var height : int
    var cwidth : int
    var cheight : int
    
    deferred proc update
    
    deferred proc draw
    
    proc setPosition(newX, newY : real)
	x := newX
	y := newY
    end setPosition
    
    fcn getX : real
	result x
    end getX
    
    fcn getY : real
	result y
    end getY
    
    proc setWidth (newWidth : int)
	width := newWidth
    end setWidth
    
    proc setHeight (newHeight : int)
	height := newHeight
    end setHeight
    
    fcn getWidth : int
	result width
    end getWidth
    
    fcn getHeight : int
	result height   
    end getHeight
    
    proc setCWidth (w : int)
	cwidth := w
    end setCWidth
    
    proc setCHeight (h : int)
	cheight := h
    end setCHeight
    
    fcn getCWidth : int
	result cwidth
    end getCWidth
    
    fcn getCHeight : int
	result cheight
    end getCHeight
    
    fcn getGravity : real
	result gravity
    end getGravity
    
    proc setDy(speed : real)
	dy := speed
    end setDy
end GameObject
