#!/bin/bash
bluetoothctl trust $SPEAKER_MAC_ADDRESS
bluetoothctl disconnect $SPEAKER_MAC_ADDRESS
bluetoothctl connect $SPEAKER_MAC_ADDRESS
