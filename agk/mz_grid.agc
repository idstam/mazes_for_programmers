// File: Grid.agc
// Created: 23-07-12

function MzCreateGrid(rows as integer, cols as integer)
	grid as MzGrid
	grid.Rows = rows 
	grid.Cols = cols 
	for r = 0 to rows-1
		for c = 0 to cols -1
			id = grid.Cols * r + c
			grid.Cells.insert(MzCreateCell(id, r, c))			 
		next 
	next

	for i = 0 to grid.Cells.length
		neighbour as MzCell
		neighbour = MzGetCell(grid, grid.Cells[i].Row-1, grid.Cells[i].Col)
		if neighbour.Initialized = true
			grid.Cells[i].North = neighbour.ID
		else
			grid.Cells[i].North = -1
		endif

		neighbour = MzGetCell(grid, grid.Cells[i].Row+1, grid.Cells[i].Col)
		if neighbour.Initialized = true
			grid.Cells[i].South = neighbour.ID
		else
			grid.Cells[i].South = -1
		endif

		neighbour = MzGetCell(grid, grid.Cells[i].Row, grid.Cells[i].Col+1)
		if neighbour.Initialized = true 
			grid.Cells[i].East = neighbour.ID
		else
			grid.Cells[i].East = -1
		endif

		neighbour = MzGetCell(grid, grid.Cells[i].Row, grid.Cells[i].Col-1)	
		if neighbour.Initialized = true
			grid.Cells[i].West = neighbour.ID
		else
			grid.Cells[i].West = -1
		endif

	next
endfunction grid

function MzGetGridSize(grid as MzGrid)
	s = grid.Cells.length
endfunction s

function MzGetCellID(grid as MzGrid, row as integer, col as integer)
	id = grid.Cols * row + col
endfunction id

function MzGetCell(grid as MzGrid, row as integer, col as integer)
	cell as MzCell 
	if row < 0 or row >= grid.Rows or col < 0 or col >= grid.Cols 
		exitfunction cell
	endif 
	cell =  grid.Cells[grid.Cols * row + col]
endfunction cell