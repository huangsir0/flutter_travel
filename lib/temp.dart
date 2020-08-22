import 'util/extensions.dart';
import 'util/extensions1.dart' hide StringExtension1;
import 'util/extensions.dart' as ex1;

void main() {
  print("#90F7EC".toColor());
  print("23".parseInt());

  print(ex1.DateTimeExtension(DateTime.now()).toFormatString());


  //dynamic h = "78";
  //print(h.parseInt()); //Runtime exception: NoSuchMethodError
}
