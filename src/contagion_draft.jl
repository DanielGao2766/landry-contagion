using Graphs

function contagion(graph, kernel, node_states)
    # Go through every node in the graph
    for node in vertices(graph)
        for neighbor in neighbors(graph, node)
            if node_states[neighbor] == 1
                if kernel()
                    new_states[node] = 1
                end
            end
        end
    end
    return new_states
end

# Run the file 
function main()
    local_node_states = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    for i in 1:20
        local_node_states = contagion(
            graph,
            kernel,
            local_node_states
        )
    end

    println(local_node_states)
end

main()