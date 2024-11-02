#!/bin/bash

set -e

fly machine start -a goblin-fight-club
fly ssh console --pty --select -C "/app/bin/goblin_fight_club remote"