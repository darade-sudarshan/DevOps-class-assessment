#!/bin/bash


# Create main.tf, variables.tf, outputs.tf, and README.md files
  cat <<EOF > main.tf
/*
  Main Terraform configuration file
*/

# Add your resources here
EOF

  cat <<EOF > variables.tf
/*
  Input variables 
*/

# Define your input variables here
EOF

  cat <<EOF > outputs.tf
/*
  Output variables
*/

# Define your output variables here
EOF

  cat <<EOF > README.md
# $MODULE_NAME

## Overview
This module is designed to [describe the purpose of your module].

# Check if at least one module name was provided as an argument
EOF

if [ $# -eq 0 ]; then
  echo "Usage: $0 <module_name1> <module_name2> ..."
  exit 1
fi

# Define environments or workspaces
WORKSPACES=("dev" "staging" "prod")

# Iterate over each module name provided as an argument
for MODULE_NAME in "$@"
do
  # Create the module directory
  mkdir -p $MODULE_NAME

  # Navigate into the module directory
  cd $MODULE_NAME

  # Create subdirectories for the module
  mkdir -p examples test scripts

  # Create main.tf, variables.tf, outputs.tf, and README.md files
  cat <<EOF > main.tf
/*
  Main Terraform configuration file for the $MODULE_NAME module
*/

# Add your resources here
EOF

  cat <<EOF > variables.tf
/*
  Input variables for the $MODULE_NAME module
*/

# Define your input variables here
EOF

  cat <<EOF > outputs.tf
/*
  Output variables for the $MODULE_NAME module
*/

# Define your output variables here
EOF

  cat <<EOF > README.md
# $MODULE_NAME

## Overview
This module is designed to [describe the purpose of your module].

## Usage

Example:

\`\`\`hcl
module "$MODULE_NAME" {
  source = "../modules/$MODULE_NAME"
  # add your variables here
}
\`\`\`

## Inputs
- **input_variable_name**: Description of the input variable.

## Outputs
- **output_variable_name**: Description of the output variable.
EOF

  cat <<EOF > examples/basic_usage.tf
/*
  Example usage of the $MODULE_NAME module
*/

module "$MODULE_NAME" {
  source = "../.."
  # add example input variables here
}
EOF

  cat <<EOF > test/test_${MODULE_NAME}.tf
/*
  Test configuration for the $MODULE_NAME module
*/

module "$MODULE_NAME" {
  source = "../.."
  # add test variables here
}
EOF

  # Optionally, create a gitignore file
  cat <<EOF > .gitignore
# Ignore terraform state files
*.tfstate
*.tfstate.backup

# Ignore .terraform directory
.terraform/

# Ignore crash logs
crash.log

# Ignore any .terraform.lock.hcl file
.terraform.lock.hcl
EOF

  # Create workspace directories and tfvars files
  for WORKSPACE in "${WORKSPACES[@]}"
  do
    mkdir -p workspaces/$WORKSPACE

    cat <<EOF > workspaces/$WORKSPACE/terraform.tfvars
# Terraform variables for the $WORKSPACE environment

# Example variable
# variable_name = "value"
EOF
  done

  # Go back to the parent directory to create the next module
  cd ..

  echo "Terraform module structure, workspaces, and tfvars files created successfully for '$MODULE_NAME'"
done
