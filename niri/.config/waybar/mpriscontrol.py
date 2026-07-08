#!/bin/env python
from mpris2 import get_players_uri, Player
from mpris2.types.metadata_map import Metadata_Map
from typing import Generator
import sys
import json

def get_player() -> Generator[Player]:
    uris = get_players_uri()
    for uri in uris:
        player = Player(dbus_interface_info={'dbus_uri': uri})
        if 'music.youtube' in player.Metadata[Metadata_Map.URL]:
            yield player

def print_title(meta):
    output = dict(
            text = ' - '.join([meta[Metadata_Map.ARTIST][0], meta[Metadata_Map.ALBUM], meta[Metadata_Map.TITLE]]),
            icon = "default"
            )
    # TODO implement scrolling
    print(json.dumps(output))

def main(cmd) -> None:
    player = next(get_player())
    meta = player.Metadata
    if cmd == 'play':
        player.PlayPause()
    else:
        print_title(meta)


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 2 else '')
