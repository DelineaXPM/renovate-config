#!/usr/bin/env bash

# If npm global install package renovate is not found then install `npm install --global renovate`
if ! command -v renovate-config-validator &>/dev/null; then
    echo "renovate-config-validator could not be found, installing..."
    npm install --global renovate
fi

# Define an array of JSON files to validate
json_files=("common.json" "default.json" "group-by-manager.json" "security.json")
# Loop through each JSON file and run the config validator
for file in "${json_files[@]}"; do
    renovate-config-validator "$file"
    if [[ $? -ne 0 ]]; then
        # If the validator returns a non-zero exit code, exit with a 1
        echo "❌ $file failed validation"
        exit 1
    fi
    echo "✅ $file passed validation"
done

# If all validators pass, exit with a 0
exit 0
