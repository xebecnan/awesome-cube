require("awful")
local tag = require("awful.tag")
local layout = require("awful.widget.layout")

local capi = { widget = widget,
               screen = screen,
               image = image,
               client = client }

local function boximage(n)
    return image(awful.util.getdir('config')..'/box'..n..'.png')
end

return function(screen)
    local vicious = require "vicious"

    local default_image = boximage(0)
    local tagbox1 = widget { type='imagebox' }
    local tagbox2 = widget { type='imagebox' }
    local tagbox3 = widget { type='imagebox' }
    tagbox1.image = default_image
    tagbox2.image = default_image
    tagbox3.image = default_image

    local function getidx(s)
        local tags = capi.screen[s]:tags()
        for i, t in ipairs(tags) do
            if t.selected then
                return i
            end
        end
    end

    local function update(t)
        local idx = getidx(t.screen)
        if not idx then return end

        local active, idle1, idle2
        if idx <= 9 then
            active, idle1, idle2 = tagbox1, tagbox2, tagbox3
        elseif idx <= 18 then
            idle1, active, idle2 = tagbox1, tagbox2, tagbox3
            idx = idx - 9
        else
            idle1, idle2, active = tagbox1, tagbox2, tagbox3
            idx = idx - 18
        end
        idle1.image = default_image
        idle2.image = default_image
        if 1<=idx and idx<=9 then
            active.image = boximage(idx)
        else
            active.image = default_image
        end
    end

    tag.attached_add_signal(screen, "property::selected", update)

    return {
        tagbox1,
        tagbox2,
        tagbox3,
        layout = layout.horizontal.leftright,
    }
end

