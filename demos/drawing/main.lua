
curse = require 'curse'

function love.load()
  rhombGrid = curse.createRhomboidalGrid(7, 7, 20, 50, 50)
  rectGrid = curse.createRectangularGrid(7, 7, 20, 50, 350)
  hexGrid = curse.createHexagonalGrid(7, 20, 450, 50)
end

function love.update()
  mx, my = love.mouse.getPosition()
  highlighted = rhombGrid:containingHex(mx, my) or rectGrid:containingHex(mx, my) or hexGrid:containingHex(mx, my)
  if (highlighted) then
    -- print("highlighted " .. highlighted.q .. ", " .. highlighted.r)
  end
end

function love.draw()
  love.graphics.setColor(0,200,255,200)
  love.graphics.line(0,50,1000,50)
  love.graphics.line(0,350,1000,350)
  love.graphics.line(50,0,50,1000)
  love.graphics.line(450,0,450,1000)

  love.graphics.setColor(255,255,255,255)
  for hex in rhombGrid:hexIterator() do
    drawHexagon(hex)
  end

  for hex in rectGrid:hexIterator() do
    drawHexagon(hex)
  end

  for hex in hexGrid:hexIterator() do
    drawHexagon(hex)
  end

  if (highlighted) then
    love.graphics.setColor(0,200,255,200)
    drawHexagon(highlighted)
  end
end

function drawHexagon(hex)
  love.graphics.polygon(
    'line',
    hex.vertices[1].x, hex.vertices[1].y,
    hex.vertices[2].x, hex.vertices[2].y,
    hex.vertices[3].x, hex.vertices[3].y,
    hex.vertices[4].x, hex.vertices[4].y,
    hex.vertices[5].x, hex.vertices[5].y,
    hex.vertices[6].x, hex.vertices[6].y
  )

  love.graphics.print(hex.q .. "," .. hex.r, hex.x - 10, hex.y - 7)
end
