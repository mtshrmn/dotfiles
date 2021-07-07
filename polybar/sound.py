#!/bin/python
"""handle output of sound"""
import os
import pulsectl

# streams that should be regarded as a game
game = [
"Overwatch.exe;Audio Stream",
# "ZOOM VoiceEngine;playStream", <-- uncomment when zoom fixes their shitty app
        ]

with pulsectl.Pulse("sink handler") as pulse:
    # get indices of sinks:
    sinks = pulse.sink_list()
    game_sink= next(filter(lambda s: "Game" in s.description, sinks))
    chat_sink= next(filter(lambda s: "Chat" in s.description, sinks))
    monitor_sink= next(filter(lambda s: "HDMI" in s.description, sinks))

    for sink in pulse.sink_input_list():
        props = sink.proplist
        app_name = props["application.name"]
        description = props["media.name"]
        id_str = app_name + ";" + description

        if os.environ["PA_OUTPUT"] == "monitor":
            pulse.sink_input_move(sink.index, monitor_sink.index)
            continue

        output_sink = game_sink if id_str in game else chat_sink
        try:
            pulse.sink_input_move(sink.index, output_sink.index)
        except pulsectl.pulsectl.PulseOperationFailed:
            # zoom throws PulseOperationFailed error
            # create an implicit handle for that
            pass
