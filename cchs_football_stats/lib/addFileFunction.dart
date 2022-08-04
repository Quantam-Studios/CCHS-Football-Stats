// General
import 'dart:io';
import './main.dart';
// Excel Reading
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
// Hive Models
import './models/game.dart';
import './models/season.dart';
import './models/combo.dart';
// Hive DataBase
import 'package:cchs_football_stats/helper_scripts/boxes.dart';

pickFile() async {
  FilePickerResult? file = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    // ensures excel files only can be added
    allowedExtensions: ['xlsx', 'xls'],
    withData: true,
  );

  // withReadStream: true); // makes a file picker window
  // checks if you selected a file
  if (file == null) return;
  //IMPORTANT: this will only work if it exists, but it's not already made yet
  Directory directory = Directory("This PC/Documents/football games");

  List<String?> fileNames = file.names;
  print(directory.path.isEmpty);

  List<PlatformFile> theFiles = file.files;
  for (var x = 0; x < theFiles.length; x++) {
    Uint8List? theByteCode = theFiles[x].bytes;

    //print(String.fromCharCode(80));

    //int theString = theByteCode.forEach((element) {convert(element);});
    //theByteCode.remove();
    //theByteCode.forEach( => (int));
    //print("this is the byte code");
    //print(theFile.bytes);
    Game game = Game(); // makes a new game
    game.combos = [];
    //GETS THE DATE FROM THE FILE NAME
    String fileNameString = fileNames[x].toString().substring(13, 23);
    List<String> date = fileNameString.split('-');
    int year = int.parse(date[0]);
    int month = int.parse(date[1]);
    int day = int.parse(date[2]);
    //SETS THE DATE TO BE THE DATE ABOVE
    game.date = DateTime(year, month, day);
    print(game.date.toString());

    int currentSeasonIndex = getCurrentSeason(game.date.year);
    if (currentSeasonIndex == -1) {
      Season season = Season();
      season.years = year;
      seasons.add(season);
      currentSeasonIndex = seasons.length - 1;
      season.games = [];
      addSeason(season);
    }
    print(currentSeasonIndex);
    seasons[currentSeasonIndex].games.add(game);
    int currentGameIndex = seasons[currentSeasonIndex].games.indexOf(game);
    //print(seasons);
    if (theByteCode != null) {
      Excel excelFile = Excel.decodeBytes(theByteCode);
      //PULLS THE FIRST COLUM OF THE LAST ROW FROM THE SHEET AND MAKES IT AN INTEGER
      List<List<Data?>> excelSheet = excelFile.sheets.values.single.rows;
      Data? totalPlays = excelSheet[excelSheet.length - 1][0];
      int totalPlaysInt = totalPlays?.value;
      String totalPlaysStirng = totalPlaysInt.toString();
      //MAKES IT THE TOTAL NUMBER OF PLAYS
      game.totalPlays = int.parse(totalPlaysStirng);
      for (int x = 1; x < excelSheet.length; x++) {
        makePlay(excelSheet[x], currentGameIndex, currentSeasonIndex);
      }
    }
    addGame(game);
  }
}

void makePlay(List<Data?> data, int gameIndex, int seasonIndex) {
  //MAKES A NEW COMBO
  Combo combo = Combo();
  Game thisGame = seasons[seasonIndex].games[gameIndex];
  //SETS THE COMBO PLAY
  combo.play = data[8]?.value;
  //SETS THE COMBO TYPE FROM THE VALUE ON THE SPREADSHEET
  String? OorD = data[1]?.value.toString();
  if (OorD == 'O' || OorD == 'o') {
    combo.isOffense = true;
  } else {
    if (OorD == 'D' || OorD == 'd') {
      combo.isOffense = false;
    } else {
      combo.isOffense = null;
    }
  }
  var number = data[0]?.value;
  combo.playNumber = int.tryParse(number.toString());
  //SETS WETHER EFFICIENT OR NOT FROM THE SPREADSHEET
  String? isEfficient = data[10]?.value.toString();
  if (isEfficient == 'y' || isEfficient == 'Y') {
    combo.efficient = true;
  } else {
    if (isEfficient == 'n' || isEfficient == 'N') {
      combo.efficient = false;
    } else {
      combo.efficient = null;
    }
  }
  //ADDS THE MOTION
  //PUTS THE COMBO IN THE RIGHT LIST
  thisGame.combos.add(combo);
}

// GET CURRENT SEASON
// returns a seasons index or -1 if it doesn't exist yet.
int getCurrentSeason(int date) {
  if (Boxes.getSeasons().isNotEmpty) {
    for (int x = 0; x < Boxes.getSeasons().length; x++) {
      int year = seasons[x].years;
      if (date == year) {
        return x;
      }
    }
  }
  return -1;
}

// HIVE FUNCTIONALITY
// the following are helper functions to save data hive backend

// Add new game to hive
Future addGame(Game newGame) async {
  // IMPORTANT: (TEMP) the flollowing lines is needed to initialize the unknown data.
  newGame.opponent = '';
  newGame.away = true;
  newGame.totalDefPlays = 0;
  newGame.totalOffPlays = 0;
  newGame.totalPlays = 0;
  for (int x = 0; x < newGame.combos.length; x++) {
    newGame.combos[x].motion = '';
    newGame.combos[x].formation = '';
    newGame.combos[x].rb = 0;
    newGame.combos[x].te = 0;
  }

// -----------------------------------------------------------------

  // Transfer object types to hive readable
  // Add new game
  // Save to local storage
  final box = Boxes.getGames();
  box.add(newGame);
}

// Add new season to hive
Future addSeason(Season newSeason) async {
  // IMPORTANT: (TEMP) the flollowing lines is needed to initialize the unknown data.
  newSeason.totalGames = 0;

// -----------------------------------------------------------------

  // Transfer object types to hive readable
  // Add new season
  // Save to local storage
  final box = Boxes.getSeasons();
  box.add(newSeason);
}
