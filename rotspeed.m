function speed = rotspeed(pos)
  y = pos(1)
  x = pos(2)
  
  direction = -1;

%angle calculation 
  if (y > 0) && (x > 0)
    angle = 90 - atand(y/x)
  end
  if (y > 0) && (x < 0)
    angle = -(90 + atand(y/x))
  end
  if (y < 0) && (x > 0)
    angle = 90 - atand(y/x)
  end
  if (y < 0) && (x < 0)
    angle = -(90 + atand(y/x))
  end
  
  if (y == 0) && (x > 0)
    angle = 90
  end
  if (y == 0) && (x < 0)
    angle = -90
  end
  if (y > 0) && (x == 0)
    angle = 0
  end
  if (y < 0) && (x == 0)
    angle = 180
  end
  if (y < 0) && (x == 0)
    angle = 180
  end
  if (y == 0) && (x == 0)
    angle = 0
  end
  
%speed of base calculation
  deg = 180/50;
  speed = angle/(45*deg)*-1;
end