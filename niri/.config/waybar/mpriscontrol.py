#!/usr/bin/env python
from mpris2 import get_players_uri, Player
from mpris2.types.metadata_map import Metadata_Map
import gi.repository.GLib as GLib
from dbus.mainloop.glib import DBusGMainLoop
import sys
import json
import dbus

DBusGMainLoop(set_as_default=True)

def get_player() -> Player:
    uris = get_players_uri()
    for uri in uris:
        player = Player(dbus_interface_info={'dbus_uri': uri})
        if 'music.youtube' in player.Metadata[Metadata_Map.URL]:
            return player

def print_title(meta):
    output = dict(
            text = ' - '.join([meta[Metadata_Map.ARTIST][0], meta[Metadata_Map.ALBUM], meta[Metadata_Map.TITLE]]),
            icon = "default"
            )
    # TODO implement scrolling
    print(json.dumps(output), flush=True)


def wait_changes(player: Player):
    def handle_change(self, *args, **kwargs):
        if args[0].get('Metadata'):
            print_title(args[0]['Metadata'])

    player.PropertiesChanged = handle_change
    loop = GLib.MainLoop()
    loop.run()


def main(cmd) -> None:
    player = get_player()
    if not player:
        return
    meta = player.Metadata
    if cmd == 'playpause':
        player.PlayPause()
    elif cmd == 'watch':
        print_title(meta)
        wait_changes(player)
    else:
        print_title(meta)


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else '')
