#!/usr/bin/env bash

#!/usr/bin/env bash

# Define an array of JSON files to validate
json_files=("common.json" "default.json" "group-by-manager.json" "security.json")
# Loop through each JSON file and run the config validator
for file in "${json_files[@]}"; do
    renovate-config-validator "$file"
    if [ $? -ne 0 ]; then
        # If the validator returns a non-zero exit code, exit with a 1
        exit 1
    fi
done

# If all validators pass, exit with a 0
exit 0
