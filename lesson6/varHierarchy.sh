#!/bin/bash


BLUE_LIGHT="\033[1;34m"
LINE_BREAK="\n\n      "


# Cas de base, on entre pas le CLI

script_terraform='variable "salut" {}
output "mariable" {
        value = "${var.salut}"
}'

echo "$script_terraform" > main.tf

terraform init

echo -e "${LINE_BREAK}${BLUE_LIGHT} Variable par paramètre direct"

echo "Valeur1" | terraform apply -auto-approve

# Variable d'environnement

echo -e "${LINE_BREAK}${BLUE_LIGHT} Variable d'environnement"

export TF_VAR_salut="Hehe" 
terraform apply -auto-approve


#fichier tfvars

echo -e "${LINE_BREAK}${BLUE_LIGHT} Variable par fichier tfvars"

echo 'salut="tfvars"' > terraform.tfvars
terraform apply -auto-approve

# fichier auto.tvars ou auto.tfvars.json

echo -e "${LINE_BREAK}${BLUE_LIGHT} Variable par fichier auto.tfvars"

echo 'salut="auto"' > production.auto.tfvars
terraform apply -auto-approve

# Par CLI -var ou bien -var-file

echo -e "${LINE_BREAK}${BLUE_LIGHT} Variable par argument -var-file ou -var"

echo 'salut="varFile"' > varfile.tfvars

terraform apply -auto-approve -var-file varfile.tfvars

rm production.auto.tfvars
rm varfile.tfvars
rm terraform.tfvars
unset TF_VAR_salut



