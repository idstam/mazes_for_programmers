namespace MazeTest
{
    using MazeCore;

    [TestClass]
    public class GridTest
    {
        [TestMethod]
        public void TestGetCell()
        {
            var grid = new MazeCore. Grid(3, 3);
            Assert.IsNotNull(grid);
            Assert.IsNull(grid.GetCell(5, 5));
        }
        [TestMethod]
        public void TestNeigbours()
        {
            var grid = new MazeCore.Grid(3, 3);
            Assert.IsNull(grid.GetCell(0, 0)?.North);
            Assert.IsNotNull(grid.GetCell(0, 0)?.South);
            Assert.IsNotNull(grid.GetCell(0, 0)?.East);
            Assert.IsNull(grid.GetCell(0, 0)?.West);
        }
        [TestMethod]
        public void SizeTest()
        {
            var grid = new MazeCore.Grid(3, 3);
            Assert.AreEqual(9, grid.Size);

            grid = new MazeCore.Grid(5, 3);
            Assert.AreEqual(15, grid.Size);

            grid = new MazeCore.Grid(3, 6);
            Assert.AreEqual(18, grid.Size);
        }
    }
}