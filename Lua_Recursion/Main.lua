local function depthFirstSearch(graph, visited, currentVertex)
    visited[currentVertex] = true
    print("Посетили вершину: " .. currentVertex)

    for _, adjacentVertex in ipairs(graph[currentVertex]) do
        if not visited[adjacentVertex] then
            depthFirstSearch(graph, visited, adjacentVertex)
        end
    end
end


local graph = {
    [1] = {2, 3},
    [2] = {4, 5},
    [3] = {},
    [4] = {},
    [5] = {6},
    [6] = {}
}


local startingVertex = 1
local visited = {}

print("Результат обхода графа в глубину:")
depthFirstSearch(graph, visited, startingVertex)