import 'dart:math';

final random = Random();

final mockResults = {
  "results": List.generate(10, (index) {
    final placements = List.generate(6, (i) => i + 1)..shuffle(random);

    return {
      "raceNum": 10 - index, // Descending
      "resultPlacing": {
        "first": placements[0],
        "second": placements[1],
        "third": placements[2],
        "fourth": placements[3],
        "fifth": placements[4],
        "sixth": placements[5],
      },
      "status": index == 0 ? 1 : 0,
    };
  }),
  "total": 10,
};
