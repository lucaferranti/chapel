use IO;

var f = open("binary-output.bin", ioMode.cwr);

var A = (1,2,3,4,5);
{
  var w = f.writer(serializer=new binarySerializer(endianness.big));
  writeln("Writing ", A);
  w.write(A);
  w.close();
}

{
  var r = f.reader(deserializer=new binaryDeserializer(endianness.big));
  var B = (0,0,0,0,0);
  r.read(B);
  writeln("Read ", B);
  assert(B==A);
}


{
  var r = f.reader(deserializer=new binaryDeserializer(endianness.big));
  var num:int;
  var B = (0,0,0,0,0);
  var i=0;
  while r.read(num) {
    B[i] = num;
    i += 1;
  } 
  writeln("Read again ", B);
  assert(B==A);
}


f.close();
