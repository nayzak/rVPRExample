#!/bin/bash

command=$1
module_name=$2
custom_path=$3

project_name="rVPRExample"
project_tests_target_name="rVPRExampleTests"

if [[ -z $command || -z $module_name ]]; then
  echo "command or module name not specified"
  exit 1
fi

if [[ $command == "usecase" ]]; then
  generamba gen $module_name rusecase --module-targets 'UseCases' --module-path UseCases --test-targets 'UseCasesTests' --test-path UseCasesTests
  generamba gen $module_name rusecase-assembly --module-targets $project_name --module-path Assemblies/UseCases  --test-targets $project_tests_target_name --test-path $project_tests_target_name/Assemblies/UseCases
  exit 0
fi

if [[ $command == "rm-usecase" ]]; then
  rm -rf Assemblies/UseCases/$module_name
  rm -rf UseCases/$module_name
  rm -rf UseCasesTests/$module_name
  rm -rf $project_tests_target_name/Assemblies/UseCases/$module_name
  exit 0
fi

if [[ $command == "vpr-xcontroller" ]]; then
  generamba gen $module_name rvpr-xcontroller --module-targets 'UI' --module-path UITests/Stories$custom_path --test-targets 'UITests' --test-path UITests/Stories$custom_path
  generamba gen $module_name rvpr-controller-assembly --module-targets $project_name --module-path Assemblies/VPRs --test-targets $project_tests_target_name --test-path  $project_tests_target_name/Assemblies/VPRs
  exit 0
fi

if [[ $command == "rm-vpr" ]]; then
  rm -rf Assemblies/VPRs/$module_name
  rm -rf UI/Stories$custom_path/$module_name
  rm -rf UITests/Stories$custom_path/$module_name
  rm -rf $project_tests_target_name/Assemblies/VPRs/$module_name
  exit 0
fi

echo "Nothing to do"

exit 1
