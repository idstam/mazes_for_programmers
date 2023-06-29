namespace MazeCore
{
    public class Cell
    {
        private int _row;
        private int _column;
        private Cell? _north;
        private Cell? _south;
        private Cell? _east;
        private Cell? _west;

        private HashSet<Cell> _links;
        private HashSet<Cell> _neigbours;
        public Cell(int row, int column)
        {
            _row = row;
            _column = column;
            _links = new HashSet<Cell>();
        }

        public int Row { get => _row; set => _row = value; }
        public int Column { get => _column; set => _column = value; }
        public Cell? North { get => _north; set => _north = value; }
        public Cell? South { get => _south; set => _south = value; }
        public Cell? East { get => _east; set => _east = value; }
        public Cell? West { get => _west; set => _west = value; }

        public void Link(Cell cell, bool bidi = true)
        {
            _links.Add(cell);
            if (bidi)
            {
                cell.Link(this, false);
            }
            
        }
        public void Unlink(Cell cell, bool bidi = true)
        {
            _links.Remove(cell);
            if(bidi)
            {
                cell.Unlink(this, false);
            }
        }
        public HashSet<Cell> Links { get => _links; }
        public bool Linked(Cell? cell)
        {
            if (cell==null)
            {
                return false;
            }
            return _links.Contains(cell);
        }
        public HashSet<Cell> Neighbours()
        {
            var ret = new HashSet<Cell>();
            if(North != null) { ret.Add(North); }
            if(South != null) { ret.Add(South); }
            if(East != null) { ret.Add(East); }
            if(West != null) { ret.Add(West); } 
            
            return ret;
        }
    }
}