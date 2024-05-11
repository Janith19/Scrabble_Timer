import 'package:scrabble_timer/clock_func.dart';
import 'package:test/test.dart';

void main() {
  test("start", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
      timeControlMillis: 0,
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
      timeControlMillis: 0,
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
      timeControlMillis: 1000,
    );
    expect(clockTimer.isTicking(), equals(false));
    clockTimer.start();
    expect(clockTimer.isTicking(), equals(true));
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

  test("increments", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
      timeControlMillis: 5000,
      incrementsMillis: 1000,
    );

    clockTimer.start();
    nowMillis += 1000;
    clockTimer.pause();

    clockTimer.start();
    nowMillis += 1000;
    clockTimer.pause();

    expect(clockTimer.getAvailableMillis(), equals(5000 - 2000 + 2000));
  });

  test("paused first", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
      timeControlMillis: 5000,
      incrementsMillis: 1000,
    );

    clockTimer.pause();
    expect(clockTimer.getMillisElapsed(), equals(0));
  });

  test("started multiple times", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
      timeControlMillis: 5000,
      incrementsMillis: 1000,
    );

    clockTimer.start();
    nowMillis += 1000;
    clockTimer.start();
    nowMillis += 1000;
    expect(clockTimer.getMillisElapsed(), equals(2000));
  });

  test("available time is never negative", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
      timeControlMillis: 5000,
      incrementsMillis: 1000,
    );

    clockTimer.start();
    nowMillis += 6000;
    expect(clockTimer.getAvailableMillis(), equals(0));
  });

  test("time is not ticking when time is up", () {
    int nowMillis = 1000;
    final clockTimer = ClockFunc(
      getNowMillis: () => nowMillis,
      timeControlMillis: 5000,
      incrementsMillis: 1000,
    );

    clockTimer.start();
    nowMillis += 6000;
    expect(clockTimer.isTicking(), equals(false));
  });
}
