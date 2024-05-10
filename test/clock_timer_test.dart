import 'package:scrabble_timer/clock_func.dart';
import 'package:test/test.dart';

void main() {
  test("start", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
    );

    clockTimer.start(); // Call start() on the instance of ClockFunc
    nowMillis += 1000;

    expect(clockTimer.getMillisElapsed(),
        equals(1000)); // Use instance method to get millis elapsed
  });

  test("pause", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
    );

    clockTimer.start();
    nowMillis += 1000;
    clockTimer.pause();
    nowMillis += 1000;
    expect(clockTimer.getMillisElapsed(), equals(1000));

    clockTimer.start();
    nowMillis += 1000;
    expect(clockTimer.getMillisElapsed(), equals(2000));
    clockTimer.pause();

    nowMillis += 1000;
    expect(clockTimer.getMillisElapsed(), equals(2000));
  });

  test("is time running", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
    );
    expect(clockTimer.isTicking(), equals(false));
    clockTimer.start();
    expect(clockTimer.isTicking(), equals(false));
    clockTimer.pause();
    expect(clockTimer.isTicking(), equals(false));
  });

  test("available time", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
      timeControlMillis: 5000,
    );
    clockTimer.start();
    expect(clockTimer.getAvailableMillis(), equals(5000));
    nowMillis += 1000;
    expect(clockTimer.getAvailableMillis(), equals(4000));
    clockTimer.pause();
    nowMillis += 1000;
    expect(clockTimer.getAvailableMillis(), equals(4000));
  });
  test("is time up", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
      timeControlMillis: 5000,
    );
    clockTimer.start();
    nowMillis += 5000;
    expect(clockTimer.isTimeUp(), equals(true));
  });
}
