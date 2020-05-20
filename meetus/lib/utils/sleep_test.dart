class SleepTest {

   Future<bool> sleep() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 2500));
    return true;
  } 
}