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

  static String repositoryText="Repository name :";
  static String languageText="Language :";
  static String visibilityText="Visibility :";
  static String descriptionText="Description :";
  static String createdText="Created :";
  static String updatedText="Updated :";
  static String pushedText="Pushed :"  ;
  static String topicsText="Topics :";
  static String starsText="Stars";
  static String forksText="Forks";
  static String detailsText="Details";
}
