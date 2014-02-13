#!/usr/bin/env bash

export APP="coffeescript/app/*.coffee"
export TESTS="coffeescript/tests/*.coffee"

coffee -wc -j js/application.js $APP &
coffee -wc -j js/tests.js $APP $TESTS