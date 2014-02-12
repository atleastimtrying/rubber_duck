#!/usr/bin/env bash

coffee -wc -j js/application.js coffeescript/app/*.coffee &
coffee -wc -j js/tests.js coffeescript/tests/*.coffee