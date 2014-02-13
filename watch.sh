#!/usr/bin/env bash

export APP="js/coffeescript/*.coffee"
export TESTS="test/coffeescript/tests/*.coffee"

coffee -w -j js/script.js -c $APP &
coffee -w -j test/js/tests.js -c $APP $TESTS