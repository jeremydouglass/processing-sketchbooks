import java.util.Arrays;
import org.graphstream.graph.*;
import org.graphstream.algorithm.Toolkit.*;

// other than GraphStream http://graphstream-project.org/, might also consider:
//
// -  JGraphT http://jgrapht.org/ https://github.com/jgrapht/jgrapht
// -  JUNG http://jung.sourceforge.net/
// -  Grph http://www.i3s.unice.fr/~hogie/software/index.php?name=grph&page=Forum -- lots of algos http://www.i3s.unice.fr/~hogie/software/grph/doc/javadoc/overview-summary.html, although thin documentation http://www.i3s.unice.fr/~hogie/software/grph/doc/manuals/grph-algos.pdf
// -  Guava Graphs / common graph  https://github.com/google/guava/wiki/GraphsExplained  http://google.github.io/guava/releases/snapshot/api/docs/com/google/common/graph/Graphs.html  http://google.github.io/guava/releases/snapshot/api/docs/com/google/common/graph/Graph.html
// -  ...guava in processing: https://forum.processing.org/two/discussion/13076/using-guava

// Make a legend on graphviz output
//
// -  https://stackoverflow.com/questions/3499056/making-a-legend-key-in-graphviz
// -  https://stackoverflow.com/questions/19502559/graphviz-legend-key-with-nodes

GraphUtils gu = new GraphUtils();
Graph graph;

// file formats -- e.g. dot
// https://data.graphstream-project.org/api/gs-core/current/

void setup() {
  noLoop();
  graph = getSampleGraph();
}

void draw() {
  gu.init(graph);
  gu.compute();
  println(gu);
  showStyled(graph);
}

class GraphUtils implements Algorithm {
  Graph graph;
  int nodeCount;
  String nodeList;
  String edgeList;
  float averageDegree;
  float diameter;
  float diameterDirected;
  int[] degreeDistributionUndirected;
  int[][] degreeRanges = new int[3][3];
  float[] degreeAverages = new float [3];
  int adjacencyMatrix[][];
  ArrayList<Node> degreeMap = new ArrayList();

  void init(Graph g) {
    graph = g;
  }
  void compute() {
    cNodeCount();
    cNodeList();
    cEdgeList();
    cAverageDegree();
    cDiameters();
    cDegreeDistribution();
    cDegreeRanges();
    cAdjacencyMatrix();
    cDegreeMap();
  }

  void cNodeCount() {
    nodeCount = graph.getNodeCount();
  }

  void cNodeList() {
    StringList list = new StringList();
    for (Node n : graph) {
      list.append(n.getId());
    }
    nodeList = join(list.array(), ", ");
  }
  void cEdgeList() {
    StringList list = new StringList();
    for (Edge e : graph.getEachEdge()) {
      list.append(e.getId());
    }
    edgeList = join(list.array(), ", ");
  }
  void cAverageDegree() {
    averageDegree = (float)Toolkit.averageDegree(graph);
  }
  void cDiameters() { // longest direct path
    diameter = (float)Toolkit.diameter(graph);
    diameterDirected = (float)Toolkit.diameter(graph, null, true);
  }
  void cDegreeDistribution() {
    degreeDistributionUndirected = Toolkit.degreeDistribution(graph);
  }
  void cDegreeRanges() {
    int min, inmin, outmin;
    min = inmin = outmin = Integer.MAX_VALUE;
    int max, inmax, outmax;
    max = inmax = outmax = 0;
    int tot, intot, outtot;
    tot = intot = outtot = 0;
    for (Node n : graph) {
      min = Math.min(min, n.getDegree());
      max = Math.max(max, n.getDegree());
      tot = tot + n.getDegree();
      inmin = Math.min(inmin, n.getInDegree());
      inmax = Math.max(inmax, n.getInDegree());
      intot = intot +  n.getInDegree();
      outmin = Math.min(outmin, n.getOutDegree());
      outmax = Math.max(outmax, n.getOutDegree());
      outtot = outtot + n.getOutDegree();
    }
    degreeRanges[0][0] = min;
    degreeRanges[0][1] = max;
    degreeRanges[0][2] = tot;
    degreeRanges[1][0] = inmin;
    degreeRanges[1][1] = inmax;
    degreeRanges[1][2] = intot;
    degreeRanges[2][0] = outmin;
    degreeRanges[2][1] = outmax;
    degreeRanges[2][2] = outtot;
  }
  void cAdjacencyMatrix () {
    adjacencyMatrix = new int[nodeCount][nodeCount];
    for (int i = 0; i < nodeCount; i++) {
      for (int j = 0; j < nodeCount; j++) {
        adjacencyMatrix[i][j] = graph.getNode(i).hasEdgeBetween(j) ? 1 : 0;
      }
    }
  }
  String toString() {
    StringList list = new StringList();
    list.append("--------------------");
    list.append(graph.getId() + "\n   [graph descriptive statistics]");
    list.append("--------------------");
    list.append("");
    list.append("Node Count: " + nodeCount);
    list.append("");
    list.append("Node List:  " + nodeList); 
    list.append("Edge List:  " + edgeList);
    list.append("");
    list.append("Average degree: " + nf(averageDegree, 0, 2));
    list.append("");
    list.append("Diameter (directed):   " + diameterDirected); // the largest of all the shortest paths from any node to any other node
    list.append("Diameter (undirected): " + diameter); // the largest of all the shortest paths from any node to any other node
    list.append("");
    String[] ddu = {"", ""};
    for (int i = 0; i < degreeDistributionUndirected.length; i++) {
      ddu[0] = ddu[0] + i + " ";
      ddu[1] = ddu[1] + degreeDistributionUndirected[i] + " ";
    }
    list.append("Degree Distribution (undirected): ");
    list.append("   degree: " + ddu[0]);
    list.append("    nodes: " + ddu[1]);
    list.append("");
    list.append("Degree Ranges: ");
    list.append("    min max tot");
    list.append("all " + Arrays.toString(degreeRanges[0]));
    list.append(" in " + Arrays.toString(degreeRanges[1]));
    list.append("out " + Arrays.toString(degreeRanges[2]));
    list.append("");

    list.append("Degree map: (high degree nodes)");
    list.append("#   In  Out Total");    
    for(Node n : degreeMap){
      if(n.getDegree()>3){
        list.append(n.getId() + ":  " + n.getInDegree() + "   " + n.getOutDegree() + "   " + n.getDegree());      
      }
    }  
    return join(list.array(), "\n");
  }
  String printAdjacencyMatrix() {
    StringList list = new StringList();
    list.append("Adjacency Matrix: ");
    for (int[] row : adjacencyMatrix) {
      list.append("   " + Arrays.toString(row));
    }
    return join(list.array(), "\n");
  }
  void cDegreeMap() {
    degreeMap = Toolkit.degreeMap(graph);
  }
  //// BetweennessCentrality only works on undirected graphs
  //void cBetweennessCentrality() {
  //   http://graphstream-project.org/doc/Algorithms/Several-often-used-algorithms-on-graphs/ 
  //   BetweennessCentrality bcb = new BetweennessCentrality();
  //   bcb.init(graph);
  //   bcb.compute();
  //   for (Node n : graph) {
  //     println(n.getId() + ": " + n.getAttribute("Cb"));
  //   }
  //}
}

void showStyled (Graph g) {
  // http://graphstream-project.org/gs-talk/tutorials.html
  g.setAttribute("ui.stylesheet", "" +
    "edge {" +
    "   size: 3px;" +
    "   fill-color: gray;" +
    "}");
  // or:
  // graph.setAttribute("ui.stylesheet", "url(data/style.css);");
  g.display();
  // for more see:
  // http://graphstream-project.org/doc/Advanced-Concepts/GraphStream-CSS-Reference/
}

Graph getSampleGraph() {
  Graph graph = new SingleGraph("Tutorial 1");
  graph.setStrict(false);
  graph.setAutoCreate( true );
  graph.addEdge("AB", "A", "B", true);
  graph.addEdge("BC", "B", "C", true);
  graph.addEdge("CA", "C", "A", true);
  graph.addEdge("DA", "D", "A", true);
  graph.addEdge("ED", "E", "D", true);
  graph.addEdge("FE", "F", "E", true);
  graph.addEdge("GE", "G", "E", true);
  graph.addEdge("HC", "H", "C", true);
  graph.addEdge("IC", "I", "C", true);
  graph.addEdge("JC", "J", "C", true);
  graph.addEdge("JI", "J", "I", true);
  graph.addEdge("WX", "W", "Z", true);
  graph.addEdge("XY", "X", "Y", true);
  graph.addEdge("YZ", "Y", "Z", true);
  graph.addEdge("ZA", "Z", "A", true);
  return(graph);
}