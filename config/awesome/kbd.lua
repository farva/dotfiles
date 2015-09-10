local awful = require("awful")
local widget = require("wibox.widget")

-- {{{ Variable definitions
kbd_dbus_sw_cmd = "qdbus-qt4 ru.gentoo.KbddService /ru/gentoo/KbddService  ru.gentoo.kbdd.set_layout "
-- kbd_dbus_sw_cmd = "dbus-send --dest=ru.gentoo.KbddService /ru/gentoo/KbddService ru.gentoo.kbdd.set_layout uint32:"
kbd_dbus_prev_cmd = "qdbus-qt4 ru.gentoo.KbddService /ru/gentoo/KbddService ru.gentoo.kbdd.prev_layout"
-- kbd_dbus_prev_cmd = "dbus-send --dest=ru.gentoo.KbddService /ru/gentoo/KbddService ru.gentoo.kbdd.prev_layout"
kbd_dbus_next_cmd = "qdbus-qt4 ru.gentoo.KbddService /ru/gentoo/KbddService ru.gentoo.kbdd.next_layout"
-- kbd_dbus_next_cmd = "dbus-send --dest=ru.gentoo.KbddService /ru/gentoo/KbddService ru.gentoo.kbdd.next_layout"
kbd_img_path = "/usr/local/share/icons/kbflags/"
-- }}}

-- {{{ Keyboard layout widgets
--- Create the menu
kbdmenu = awful.menu({ items = {
        { "English", kbd_dbus_sw_cmd .. "0",  kbd_img_path .. "us.png" },
	{ "Hebrew", kbd_dbus_sw_cmd .. "1", kbd_img_path .. "il.png" },
	{ "Polish", kbd_dbus_sw_cmd .. "2", kbd_img_path .. "pl.png" }
	}
})
-- }}}

-- Create simple text widget
kbdwidget_text = widget.textbox()
kbdwidget = widget.background()
-- kbdwidget.border_width = 1
-- kbdwidget.border_color = beautiful.fg_normal
kbdwidget_text:set_align("center")
kbdwidget_text:set_markup("<b>Eng</b>")
kbdwidget:set_bgimage(kbd_img_path .. "us.png")
-- kbdwidget:set_resize(true)
kbdwidget:set_widget(kbdwidget_text)
-- awful.widget.layout.margins[kbdwidget] = { left = 0, right = 10 }
kbdwidget:buttons(awful.util.table.join(
	awful.button({ }, 1, function() os.execute(kbd_dbus_prev_cmd) end),
	awful.button({ }, 2, function() os.execute(kbd_dbus_next_cmd) end),
	awful.button({ }, 3, function() kbdmenu:toggle () end)
))
-- }}}

-- {{{ Signals
dbus.request_name("session", "ru.gentoo.KbddService")
dbus.add_match("session", "interface='ru.gentoo.kbdd',member='layoutChanged'")
dbus.connect_signal("ru.gentoo.kbdd", function(...)
	local data = {...}
	local layout = data[2]
	lts = {[0] = "Eng", [1] = "Heb", [2] = "Pol"}
	lts_img = {[0] = kbd_img_path .. "us.png", [1] = kbd_img_path .. "il.png", [2] = kbd_img_path .. "pl.png" }
	kbdwidget_text.set_markup = "<b>"..lts[layout].."</b>"
	kbdwidget.set_bgimage = lts_img[layout]
	end)
-- }}}