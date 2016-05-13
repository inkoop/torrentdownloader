#!/bin/bash

url=$1

sudo transmission-cli -p 6969 -w /data/ $url

