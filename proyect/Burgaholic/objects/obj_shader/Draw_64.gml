// Activating the shader
bktglitch_activate();

// Quickly setting all parameters at once using a preset
bktglitch_config_preset(BktGlitchPreset.B);

// Additional tweaking
bktglitch_set_jumbleness(0.5);
bktglitch_set_jumble_speed(2.5);
bktglitch_set_jumble_resolution(random_range(0.2, 0.4));
bktglitch_set_jumble_shift(random_range(0.2, 0.4));
bktglitch_set_channel_shift(0.01);
bktglitch_set_channel_dispersion(.05);

bktglitch_config(0.000000, 0.010000, 1.000000, 0.100000, 0.000000, 0.200000, 0.000000, 0.200000, 0.150000, 0.673333, 0.004667, 0.010000, 0.000000, 0.233333, 0.000000);

// Drawing the application surface
draw_surface(application_surface, 0, 0);

// Done with the shader (this is really just shader_reset)!
bktglitch_deactivate();