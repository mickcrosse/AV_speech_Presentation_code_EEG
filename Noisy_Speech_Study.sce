pcl_file = "Noisy_Speech_Study.pcl";
default_path = "C://Users//TCDUSER//Documents//Experiments//Noisy Speech Study//EEG//Stimuli//";

response_matching = simple_matching;
response_logging = log_active;
active_buttons = 2;
button_codes = 125, 124;

write_codes = true; 
pulse_width = 10;

begin;

picture {} default;

bitmap { filename = "box_unchecked.bmp"; } box_unchecked;
bitmap { filename = "box_checked.bmp"; } box_checked;
bitmap { filename = "cursor.bmp"; transparent_color = 112, 112, 112; } cursor;

picture {

	bitmap box_unchecked; x = 50; y = 210;
	bitmap box_unchecked; x = 50; y = 150;
	bitmap box_unchecked; x = 50; y = 90;
	bitmap box_unchecked; x = 50; y = 30;
	bitmap box_unchecked; x = 50; y = -30;
	bitmap box_unchecked; x = 50; y = -90;
	bitmap box_unchecked; x = 50; y = -150;
	bitmap box_unchecked; x = 50; y = -210;
	bitmap box_unchecked; x = 50; y = -270;
	bitmap box_unchecked; x = 50; y = -330;
	bitmap box_unchecked; x = 50; y = -390;
	
	text { caption = "0%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = 210;
	text { caption = "10%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = 150;
	text { caption = "20%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = 90;
	text { caption = "30%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = 30;
	text { caption = "40%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = -30;
	text { caption = "50%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = -90;
	text { caption = "60%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = -150;
	text { caption = "70%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = -210;
	text { caption = "80%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = -270;
	text { caption = "90%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = -330;
	text { caption = "100%"; font_size = 20; font_color = 64, 64, 64; }; x = -100; y = -390;

	text {
		caption = "What percentage of words did you understand?";
		font_size = 36;
		font_color = 64, 64, 64;
	}; x = 0; y = 350;

	text { 
		caption = " Continue >> "; 
		font_size = 36; 
		text_align = align_center; 
		font_color = 64, 64, 64; 
	}; x = 450; y = -440;
	on_top = true; 

	box { 
		height = 63; 
		width = 269; 
		color = 64, 64, 64; 
	}; x = 450; y = -440;
	
	bitmap cursor; x = 0; y = 0; on_top = true;
	
} score_pic;

picture {
	text { 
		caption = " "; 
		font_size = 20; 
		font_color = 64, 64, 64; 
	} intro_txt;
	x = 0; y = 0;
} intro_pic;

picture {
   bitmap { 
		filename = "crosshair.png"; 
	} default_start_pic;
   x = 0; y = 0;
} start_pic;

video { 
	filename = "obama_a_1.avi"; 
} vid;

picture {
   bitmap { 
		filename = "crosshair.png"; 
	} default_end_pic;
   x = 0; y = 0;
} end_pic;

picture {
	text { 
		caption = " "; 
		font_size = 36; 
		font_color = 64, 64, 64; 
	} finish_txt;
	x = 0; y = 0;
} finish_pic;

trial {
   trial_duration = forever;
   trial_type = specific_response;
	terminator_button = 1;
	picture intro_pic;
} intro_trial;

trial {
	picture start_pic;
	time = 0;
	nothing {};
	code = "126";
	port_code = 126;
	time = 1000;
} start_trial;

trial {
	stimulus_event {
		video vid;
		code = "0,0";
		port_code = 0;
		time = 1000;
	} stim_event;
	picture end_pic;
} stim_trial;

trial {
	nothing {};
	code = "127";
	port_code = 127;
	time = 2000;
} stop_trial;

trial {
	picture score_pic;
} decision_trial;
	
trial {
   trial_duration = forever;
   trial_type = specific_response;
	terminator_button = 1;
	picture finish_pic;
} finish_trial;