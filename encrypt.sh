#!/bin/bash
# Pre-commit hook to encrypt tfvars files

# Find all .tfvars files that are not in a .terraform directory
find . -name '.terraform' -prune -o -name '*.tfvars' -print | while read -r tfvars_file; do
  # Remove .tfvars from the filename to get the base name
  base_name=${tfvars_file%.tfvars}

  # Generate the encrypted file
  sops -e "$tfvars_file" > "${base_name}.tfvars.enc"

  # Stage the encrypted file for commit
  git add "${base_name}.tfvars.enc"
done
