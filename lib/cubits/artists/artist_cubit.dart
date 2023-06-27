import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:palette_generator/palette_generator.dart';

part 'artist_state.dart';

class ArtistCubit extends Cubit<ArtistState> {
  ArtistCubit() : super(const ArtistState()) {
    generateColor();
  }

  generateColor() {
    var image =
        "https://i.scdn.co/image/ab67616d0000b273e01db9d23e1ff625e3b288b9";
    PaletteGenerator.fromImageProvider(NetworkImage(image)).then(
      (value) => emit(
        state.copyWith(
          color: value.dominantColor?.bodyTextColor.value,
        ),
      ),
    );
  }
}
