#!/bin/sh

set -xe

setxkbmap -layout us,rs,ba -option grp:shifts_toggle,grp_led:scroll &&
setxkbmap -option caps:none
