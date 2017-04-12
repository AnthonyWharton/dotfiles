#!/bin/bash

printf "$(echo "(($(light -G) + 4) / 5) * 5" | bc)%%"
