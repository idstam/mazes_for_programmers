// File: types.agc
// Created: 23-07-12

global true = 1
global false = 0

type MzCell
	ID as integer
	Row as Integer
	Col as Integer
	North as Integer
	South as Integer
	East as Integer
	West as Integer
	Links as Integer[]
	Initialized as Integer
endType

type MzGrid
	Rows as integer 
	Cols as integer
	Cells as MzCell[]
endtype