#!/bin/bash

# Function to process YAGO graph
# Parameters:
#   $1 - graph name (e.g., YAGO_IW)
#   $2 - data directory (optional, default: data)

process_graph() {
    local graph_name="$1"
    local data_dir="${2:-data}"
    
    if [ -z "$graph_name" ]; then
        echo "Error: graph_name parameter is required"
        return 1
    fi
    
    echo "Starting ${graph_name} processing..."
    
    bin/sspexp_run -x -d 0 -w 1 -s 0 -m 0 -g "${data_dir}/${graph_name}.txt" -e "${graph_name}_d"
    bin/sspexp_run -x -d 0 -w 1 -s 0 -m 1 -g "${data_dir}/${graph_name}.txt" -e "${graph_name}_b"
    bin/sspexp_run -x -d 0 -w 1 -s 0 -m 2 -g "${data_dir}/${graph_name}.txt" -e "${graph_name}_s"
    
    echo "${graph_name} processing completed."
}

# Call the function with YAGO_IW as parameter
process_graph "YAGO_UW"