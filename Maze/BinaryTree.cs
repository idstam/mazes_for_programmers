using MazeCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Maze
{
    public class BinaryTree:IStrategy
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
                    var neighbour = grid.Sample(neighbours);
                    cell.Link(neighbour);
                }
            }
        }
    }
}
