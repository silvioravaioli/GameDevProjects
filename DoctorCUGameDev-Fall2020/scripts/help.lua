local help = {}

function help:draw()
    local scaleX = screenWidth / 1900 * 0.7
    local scaleY = screenHeight / 1069 * 0.7
    local tableX = 0.1 * screenWidth
    local tableY = 0.1 * screenHeight
    setColorWhite()
    love.graphics.draw(instructions[help_page], tableX, tableY, 0, scaleX, scaleY)
    setColorBlack()

    local text = tostring("back")
    backX = screenWidth * 0.1
    backY = screenHeight * 0.8
    backWidth = font:getWidth(text)
    backHeight = font:getHeight(text)
    if help_page > 1 then
        love.graphics.print(text, backX, backY, 0, 1)
    end

    text = tostring("next")
    nextX = screenWidth * 0.1 + backWidth * 1.5
    nextWidth = font:getWidth(text)
    if help_page < max_help_page then
        love.graphics.print(text, nextX, backY, 0, 1)
    end
end


function help:mousepressed(x,y)
    if backX ~= nil and backY ~= nil and backWidth ~= nil and backHeight ~= nil and nextX ~= nil and nextWidth ~= nil then
        if help_page > 1 and x >= backX and x <= backX + backWidth and y >= backY and y <= backY + backHeight then
            help_page = help_page - 1
        elseif help_page < max_help_page and x >= nextX and x <= nextX + nextWidth and y >= backY and y <= backY + backHeight then
            help_page = help_page + 1
        end
    end
end

return help