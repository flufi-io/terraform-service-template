#!/bin/bash
# Script to decrypt tfvars files

# Find all .tfvars.enc files
find . -name '*.tfvars.enc' | while read -r tfvars_enc_file; do
  # Remove .tfvars.enc from the filename to get the base name
  base_name=${tfvars_enc_file%.tfvars.enc}

  # Decrypt the file and save the output
  sops -d "$tfvars_enc_file" > "${base_name}.tfvars"
done
