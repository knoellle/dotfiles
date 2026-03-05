#!/usr/bin/env bash

pactl get-source-mute "$(pactl get-default-source)" | grep -q yes && echo '{"text": "muted", "class": "muted"}' || echo '{"text": "unmuted", "class": "unmuted" }'

