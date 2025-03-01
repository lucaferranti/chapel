

module FormatHelper {
  use JSON;
  use IO;
  use ChplFormat;
  use ObjectSerialization;

  enum FormatKind {
    default,
    json,
    little,
    big,
    syntax,
    object
  }

  config param format : FormatKind = FormatKind.default;

  proc getFormatVal(param writing : bool) {
    select format {
      when FormatKind.default {
        if writing then return new IO.defaultSerializer();
        else return new IO.defaultDeserializer();
      }
      when FormatKind.json {
        if writing then return new jsonSerializer();
        else return new jsonDeserializer();
      }
      when FormatKind.little {
        if writing then return new binarySerializer(endian=IO.endianness.little);
        else return new binaryDeserializer(endian=IO.endianness.little);
      }
      when FormatKind.big {
        if writing then return new binarySerializer(endian=IO.endianness.big);
        else return new binaryDeserializer(endian=IO.endianness.big);
      }
      when FormatKind.syntax {
        if writing then return new chplSerializer();
        else return new chplDeserializer();
      }
      when FormatKind.object {
        if writing then return new objectSerializer(endian=IO.endianness.little);
        else return new objectDeserializer(endian=IO.endianness.little);
      }
      otherwise return nothing;
    }
  }

  var FormatReader = getFormatVal(false);
  var FormatWriter = getFormatVal(true);

  proc printDebugFmt(val) throws {
    writeln("===== writing: =====");
    stdout.writeln(val);
    writeln("--------------------");
    if format == FormatKind.little || format == FormatKind.big ||
       format == FormatKind.object {
      var f = openMemFile();
      {
        var w = f.writer();
        w.withSerializer(FormatWriter).write(val);
      }
      var r = f.reader();
      try {
        while true {
          stdout.writef("%02xu", r.readByte());
        }
      } catch { }
      stdout.writeln();
    } else {
      try {
        stdout.withSerializer(FormatWriter).writeln(val);
      } catch e {
        stdout.writeln("ERROR: ", e);
      }
    }
    writeln("====================");
  }

}
