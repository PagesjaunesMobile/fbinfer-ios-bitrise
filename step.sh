#!/bin/bash

# Config
echo ""
echo "========== Configs =========="
if [[ -n "${infer_source_dir}" ]]; then
	echo "infer_source_dir: ${infer_source_dir}"
else
	echo "infer_source_dir: this is required"
	exit 1
fi
if [[ -n "${infer_target}" ]]; then
	echo "infer_target: ${infer_target}"
fi
if [[ -n "${infer_scheme}" ]]; then
	echo "infer_scheme: ${infer_scheme}"
fi
if ! [ -n "${infer_scheme}" ] && ! [ -n "${infer_target}" ]; then
	echo "infer_scheme or infer_target is required"
	exit 1
fi
if [[ -n "${infer_configuration}" ]]; then
	echo "infer_configuration: ${infer_configuration}"
else
	echo "infer_configuration: this is required"
	exit 1
fi
if [[ -n "${infer_sdk}" ]]; then
	echo "infer_sdk: ${infer_sdk}"
else
	echo "infer_sdk: this is required"
	exit 1
fi
if [[ -n "${infer_workspace}" ]]; then
	echo "infer_workspace: ${infer_workspace}"
fi
if [[ -n "${infer_custom_config_path}" ]]; then
	echo "infer_custom_config_path: ${infer_custom_config_path}"
fi
if [[ -n "${infer_debug_mode}" ]]; then
	echo "infer_debug_mode: ${infer_debug_mode}"
else
	echo "infer_debug_mode: this is required"
	exit 1
fi
echo "============================="
echo ""

# Variable verification
execute_mode=""
if [[ -n "${infer_workspace}" ]] && [[ -n "${infer_scheme}" ]]; then
	execute_mode=" -workspace ${infer_workspace} -scheme ${infer_scheme}"
elif [[ -n "${infer_target}" ]]; then
	execute_mode=" -target ${infer_target}"
else
	echo "Defining (infer_workspace AND infer_scheme) OR infer_target is required."
	exit 1
fi

if [[ "${infer_debug_mode}" = true ]]; then
	set -x
fi

# go to project folder
cd "${infer_source_dir}"

# Execute Infer
if [[ -n "${infer_custom_config_path}" ]]; then
	infer -- xcodebuild $execute_mode -configuration "${infer_configuration}" -sdk "${infer_sdk}" "${infer_custom_config_path}"
else
	infer -- xcodebuild $execute_mode -configuration "${infer_configuration}" -sdk "${infer_sdk}"
fi
exit 0
