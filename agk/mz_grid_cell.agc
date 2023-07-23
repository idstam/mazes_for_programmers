// File: Cell.agc
// Created: 23-07-12



function MzCreateCell(id as integer, row as integer, col as integer)
	ret as MzCell
	ret.ID = id
	ret.Row = row
	ret.Col = col
	ret.North = -1
	ret.South = -1
	ret.East = -1
	ret.West = -1
	ret.Initialized = true
	
endfunction ret

function MzLinkCells(grid ref as MzGrid, cell1 as integer, cell2 as integer, bidi as integer)
	if grid.Cells[cell2].Initialized = false then exitfunction

	
	grid.Cells[cell1].Links.insert(cell2)
	if bidi = true
		MzLinkCells(grid,cell2, cell1, false)
	endif
endfunction

function MzUnlinkCells(grid ref as MzGrid, cell1 as integer, cell2 as integer, bidi as integer)
	for i = grid.Cells[cell1].Links.length to 0 step -1
		if grid.Cells[cell1].Links[i] = cell2
			grid.Cells[cell1].Links.remove(i)
		endif
	next
	
	if bidi = true then MzUnlinkCells(grid, cell2, cell1, false)
		
endfunction

function MzLinked(cell1 as MzCell, cell2 as MzCell)
	if cell2.Initialized = false then exitfunction false
	for i = 0 to cell1.Links.length
		if cell1.Links[i] = cell2.ID then exitfunction true
	next
	
endfunction false

function MzGetCellNeighbours(grid as MzGrid,cell as MzCell)
	neighbours as integer[]
	if grid.Cells[cell.North].Initialized = true then neighbours.insert(cell.North)
	if grid.Cells[cell.South].Initialized = true then neighbours.insert(cell.South)
	if grid.Cells[cell.East].Initialized = true then neighbours.insert(cell.East)
	if grid.Cells[cell.West].Initialized = true then neighbours.insert(cell.West)
endfunction neighbours

