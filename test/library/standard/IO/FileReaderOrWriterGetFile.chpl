use IO;

proc main() {
  var f1 = openTempFile();
  var fr1 = f1.reader();
  var fw1 = f1.writer();

  {
    fw1.write('Hello!');
    fw1.flush();

    var f2 = fw1.getFile();
    assert(f1 == f2);

    var fr2 = f2.reader();
    var s: string;
    fr2.readAll(s);
    assert(s == 'Hello!');
  }

  {
    var f3 = fr1.getFile();
    assert(f3 == f1);

    var fw3 = f3.writer();
    fw3.write('Super!');
    fw3.flush();

    var s: string;
    fr1.readAll(s);
    assert(s == 'Super!');
  }
}
