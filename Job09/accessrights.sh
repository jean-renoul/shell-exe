#!/bin/bash
set -x

filename='Shell_Userlist.csv'


declare -a id
declare -a prenom
declare -a nom
declare -a mdp
declare -a role

sed -i 's/ *, */,/g' "Shell_Userlist.csv"

while IFS=, read -r COL1 COL2 COL3 COL4 COL5 THRASH; do
  id+=("$COL1")
  prenom+=("$COL2")
  nom+=("$COL3")
  mdp+=("$COL4")
  role+=("$(echo "$COL5" | tr -d '\r')")
done < "$filename"

for index in "${!role[@]}"; do
  useradd -u "${id[$index]}" -d "/home/${prenom[$index]}" -m -s /bin/bash -p "$(echo "${mdp[$index]}" | openssl passwd -1 -stdin)" "${prenom[$index]}"
if [[ "${role[$index]}" == "Admin" ]]; then usermod -aG root "${prenom[$index]}"
fi
done

echo "Roles: ${role[@]}"
