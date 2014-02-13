#!/usr/bin/env bash

export APP="coffeescript/app/*.coffee"
export TESTS="test/coffeescript/tests/*.coffee"

coffee -wc -j js/script.js $APP &
coffee -wc -j test/js/tests.js $APP $TESTS