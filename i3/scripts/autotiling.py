from i3ipc import Connection, Event

manual_layout = False

def handler(i3, event):
    con = i3.get_tree().find_focused()
    floating = "_on" in con.floating
    full_screen = con.fullscreen_mode == 1
    stacked = con.parent.layout == "stacked"
    tabbed = con.parent.layout == "tabbed"

    global manual_layout

    if event.change == "run" and "split" in event.binding.command:
        manual_layout = True

    should_update_layout = not (floating or full_screen or stacked or tabbed or manual_layout)

    if event.change == "focus":
        manual_layout = False

    if should_update_layout:
        new_layout = "splitv" if con.rect.height * 1.4 > con.rect.width else "splith"
        if new_layout != con.parent.layout:
            i3.command(new_layout)


if __name__ == "__main__":
    i3 = Connection()
    i3.on(Event.WINDOW_FOCUS, handler)
    i3.on(Event.BINDING, handler)
    i3.main()
