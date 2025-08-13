if (!audio_is_playing(mus_start)) {
    audio_play_sound(mus_start, 1, true); // 1 = priority, true = loop
}
