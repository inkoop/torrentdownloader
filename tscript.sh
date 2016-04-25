#!/bin/bash

url=$1

transmission-cli -p 6969 -w data/ $url

