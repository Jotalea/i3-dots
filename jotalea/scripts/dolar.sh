#!/usr/bin/bash
function dolar() {
    curl -s "https://dolarhoy.com" | grep -A 2 'class="compra"' | grep 'val' | grep -o '\$[0-9,.]*' | head -1 | sed 's/[$,]//g; s/\.//g; s/,/./'
}
dolar
