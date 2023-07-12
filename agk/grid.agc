// File: Grid.agc
// Created: 23-07-12

function CreateGrid(rows as integer, cols as integer)
	grid as Grid
	grid.Rows = rows 
	grid.Cols = cols 
	for r = 0 to rows-1
		for c = 0 to cols -1
			grid.Cells.insert(CreateCell(r, c))			 
		next 
	next

	for i = 0 to grid.Cells.length -1
		cell as Cell
		cell = GetCellByCoordinates(grid, grid.Cells[i].Row-1, grid.Cells[i].Col)
		if cell.Initialized = true then grid.Cells[i].North = CreateCellID(cell)

		cell = GetCellByCoordinates(grid, grid.Cells[i].Row+1, grid.Cells[i].Col)
		if cell.Initialized = true then grid.Cells[i].South = CreateCellID(cell)

		cell = GetCellByCoordinates(grid, grid.Cells[i].Row, grid.Cells[i].Col+1)
		if cell.Initialized = true then grid.Cells[i].East = CreateCellID(cell)

		cell = GetCellByCoordinates(grid, grid.Cells[i].Row, grid.Cells[i].Col-1)	
		if cell.Initialized = true then grid.Cells[i].West = CreateCellID(cell)

	next
endfunction grid

function GetGridSize(grid as Grid)
	s = grid.Cells.length
endfunction s

function GetCellByID(grid as Grid, cellID as CellID)
	cell as Cell 
	cell =  GetCellByCoordinates(grid, cellID.Row, cellID.Col)
endfunction cell

function GetCellByCoordinates(grid as Grid, row as integer, col as integer)
	cell as Cell 
	if row < 0 or row >= grid.Rows or col < 0 or col >= grid.Cols 
		exitfunction cell
	endif 
	cell =  grid.Cells[grid.Rows * row + col]
endfunction cell