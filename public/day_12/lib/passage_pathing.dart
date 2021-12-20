class PassagePathing {
  final String input;

  PassagePathing(this.input);

  /// Returns number of distict paths that:
  /// - start at 'start'
  /// - end at 'end'
  /// - don't visit small caves more than once
  int call() {
    final allPaths = findPaths(startPaths);
    print(allPaths);
    return allPaths.length;
  }

  List<Path> get startPaths => startTunnels.map((tunnel) {
        final to = tunnel.takeTunnel('start');
        return ['start', to];
      }).toList();

  List<Tunnel> get startTunnels =>
      tunnels.where((t) => t.isStartTunnel).toList();

  List<Tunnel> get tunnels => input.split('\n').map((line) {
        final parts = line.split('-');
        return Tunnel(parts.first, parts.last);
      }).toList();

  List<Path> findPaths(List<Path> paths) {
    final newPaths = <List<String>>[];
    paths.forEach((path) {
      final lastCave = path.lastCave;
      if (lastCave != 'end') {
        final possibleNextCaves = getPossibleNextCaves(lastCave);

        possibleNextCaves.forEach((next) {
          final newPath = [...path, next];
          if (newPath.isValid) {
            newPaths.add(newPath);
          }
        });
      } else {
        newPaths.add(path);
      }
    });

    if (newPaths.any((newPaths) => !newPaths.hasCave('end'))) {
      return findPaths(newPaths);
    }
    return newPaths;
  }

  List<String> getPossibleNextCaves(String cave) {
    return tunnels
        .where((tunnel) => !tunnel.isStartTunnel)
        .where((tunnel) => tunnel.containsCave(cave))
        .map((tunnel) => tunnel.takeTunnel(cave))
        .toList();
  }
}

typedef Path = List<String>;

class Tunnel {
  final String from;
  final String to;

  Tunnel(this.from, this.to);

  bool containsCave(String cave) => from == cave || to == cave;

  bool get isStartTunnel => from == 'start' || to == 'start';
  bool get isEndTunnel => from == 'end' || to == 'end';

  String takeTunnel(String cave) {
    if (from == cave) return to;
    if (to == cave) return from;
    throw Exception("Cannot take this tunnel ($from-$to) from $cave");
  }
}

extension PathExtensions on Path {
  void addCave(String cave) => this.add(cave);

  bool hasCave(String cave) => this.contains(cave);

  String get lastCave => this.last;

  bool get isValid {
    return this.every((cave) {
      return this.where((element) => element == cave).length < 2 ||
          cave.isBigCave;
    });
  }
}

extension CaveExtensions on String {
  bool get isBigCave => this.toUpperCase() == this;
}
