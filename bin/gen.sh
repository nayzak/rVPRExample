#!/bin/bash

command=$1
module_name=$2

if [[ -z $command || -z $module_name ]]; then
  echo "command or module name not specified"
  exit 1
fi

if [[ $command == "usecase" ]]; then
  generamba gen $module_name rusecase --module-targets 'UseCases' --module_path UseCases --test_targets 'UseCasesTests' --test_path UseCasesTests
  exit 0
fi

echo "Nothing to do"

exit 1
