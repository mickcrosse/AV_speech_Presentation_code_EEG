pcl_file = "Incongruent_Speech_Study.pcl";
default_path = "C://Users//TCDUSER//Documents//Experiments//Incongruent Speech Study//Stimuli//";

response_matching = simple_matching;
response_logging = log_active;
active_buttons = 1;
button_codes = 125;

write_codes = true; 
pulse_width = 10;

begin;

picture {} default;

picture {
	text { 
		caption = " "; 
		font_size = 36; 
		font_color = 122, 122, 122; 
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
		font_color = 122, 122, 122; 
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

trial{
	nothing {};
	code = "127";
	port_code = 127;
	time = 2000;
} stop_trial;
	
trial {
   trial_duration = forever;
   trial_type = specific_response;
	terminator_button = 1;
	picture finish_pic;
} finish_trial;