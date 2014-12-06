----------------------------------------------------------------------
--
-- put lines below into /etc/xdg/awesome/rc.lua
--
----------------------------------------------------------------------

local arnan_tagbox = require("arnan_tagbox")

----------------------------------------------------------------------

do
    mywibox[s].widgets = {
        {
            mylauncher,
            arnan_tagbox(),
            mytaglist[s],
            --mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
        --mytextclock,
        --s == 1 and mysystray or nil,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
end

----------------------------------------------------------------------

tags = {}
for s = 1, screen.count() do
    local tag_names = {} ; for i = 1, 27 do tag_names[i] = i end
    tags[s] = awful.tag(tag_names, s, layouts[2])
end

----------------------------------------------------------------------

local function view_up()
    local idx = awful.tag.getidx( awful.tag.selected() )
    idx = (idx-1)%9+1
    if idx > 3 then
        awful.tag.viewidx(-3)
    end
end

local function view_down()
    local idx = awful.tag.getidx( awful.tag.selected() )
    idx = (idx-1)%9+1
    if idx < 7 then
        awful.tag.viewidx(3)
    end
end

local function view_left()
    local idx = awful.tag.getidx( awful.tag.selected() )
    idx = (idx-1)%9+1
    if idx~=1 and idx~=4 and idx~=7 then
        awful.tag.viewidx(-1)
    end
end

local function view_right()
    local idx = awful.tag.getidx( awful.tag.selected() )
    idx = (idx-1)%9+1
    if idx~=3 and idx~=6 and idx~=9 then
        awful.tag.viewidx(1)
    end
end

local function view_q()
    local idx = awful.tag.getidx( awful.tag.selected() )
    if idx > 9 then
        awful.tag.viewidx(-9)
    end
end

local function view_e()
    local idx = awful.tag.getidx( awful.tag.selected() )
    if idx < 19 then
        awful.tag.viewidx(9)
    end
end

do
    awful.key({ "Control", "Mod1" }, "a",      view_left  ),
    awful.key({ "Control", "Mod1" }, "d",      view_right ),
    awful.key({ "Control", "Mod1" }, "w",      view_up    ),
    awful.key({ "Control", "Mod1" }, "s",      view_down  ),
    awful.key({ "Control", "Mod1" }, "q",      view_q     ),
    awful.key({ "Control", "Mod1" }, "e",      view_e     ),
    awful.key({ "Control", "Shift" }, "a",     view_left  ),
    awful.key({ "Control", "Shift" }, "d",     view_right ),
    awful.key({ "Control", "Shift" }, "w",     view_up    ),
    awful.key({ "Control", "Shift" }, "s",     view_down  ),
    awful.key({ "Control", "Shift" }, "q",     view_q     ),
    awful.key({ "Control", "Shift" }, "e",     view_e     ),
end

----------------------------------------------------------------------

awful.tag.viewidx(13)

----------------------------------------------------------------------

