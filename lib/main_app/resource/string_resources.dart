class StringResources {
  //Home
  static String githubText = "Github";
  static String bestMatchText = "Best Match";
  static String mostStarsText = "Most Stars";
  static String fewestStarsText = "Fewest Stars";
  static String mostForksText = "Most Forks";
  static String fewestForksText = "Fewest Forks";
  static String recentlyUpdatedText = "Recently Updated";
  static String leastRecentlyUpdatedText = "Least Recently Updated";
  static String enumName(String enumToString) {
    List<String> paths = enumToString.split(".");
    return paths[paths.length - 1];
  }
}
