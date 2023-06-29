using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MazeCore
{
    public class Grid
    {
        private int _rows;
        private int _columns;
        private Cell[][] _grid;
        public Grid(int rows, int columns)
        {
            _rows = rows;
            _columns = columns;
            _grid = PrepareGrid();
            ConfigureCells();
        }
        private Cell[][] PrepareGrid()
        {
            var ret = new Cell[_columns][];

            for(int c = 0; c < _columns; c++)
            {
                ret[c] = new Cell[_rows];
            }
            return ret;
        }
        private void ConfigureCells()
        {

        }
        public Cell? GetCell(int row, int column)
        {
            return _grid[row][column];
        }
    }
}
