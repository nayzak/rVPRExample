#!/bin/bash

command=$1
module_name=$2

if [[ -z $command || -z $module_name ]]; then
  echo "command or module name not specified"
  exit 1
fi

if [[ $command == "usecase" ]]; then
  generamba gen $module_name rusecase --module-targets 'UseCases' --module-path UseCases --test-targets 'UseCasesTests' --test-path UseCasesTests
  generamba gen $module_name rusecase-assembly --module-targets 'rVPRExample' --module-path Assemblies/UseCases  --test-targets 'rVPRExampleTests' --test-path rVPRExampleTests/Assemblies/UseCases
  exit 0
fi

if [[ $command == "rm-usecase" ]]; then
  rm -rf Assemblies/UseCases/$module_name
  rm -rf UseCases/$module_name
  rm -rf UseCasesTests/$module_name
  rm -rf rVPRExampleTests/Assemblies/UseCases/$module_name
  exit 0
fi

echo "Nothing to do"

exit 1
