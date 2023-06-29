using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MazeCore
{
    public class BinaryTree
    {
        public void On(Grid grid)
        {
            if (grid == null) return;
            foreach(var cell in grid.Cells)
            {
                var neighbours = new List<Cell>();
                if(cell.North != null) neighbours.Add(cell.North);
                if (cell.East != null) neighbours.Add(cell.East);
                if (neighbours.Count > 0)
                {
                    var index = grid.Rnd.Next(neighbours.Count);
                    var neighbour = neighbours[index];
                    cell.Link(neighbour);
                }
            }
        }
    }
}
