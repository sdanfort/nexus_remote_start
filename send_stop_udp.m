function send_stop_udp( subject_id, trial_number, packet_id )

%change these numbers to strings to incorporate into the stop_msg:
trial_number = num2str(trial_number);
packet_id = num2str(packet_id);

%form the stop_msg:
%Pay attention to the trial name and database path.
%Make sure to switch to forward slashes if using OSX.
%The double back slashes in filepath are for sprintf()
stop_msg = sprintf( '<?xml version="1.0" encoding="UTF-8" standalone="no" ?><CaptureStop><Name VALUE="subject%s_trial%s"/><DatabasePath VALUE="C:\\Users\\my_user_name\\Documents\\vicon_data\\my_experiment\\subject%s\\session_date\"/><Delay VALUE="33"/><PacketID VALUE="%s"/></CaptureStop>', subject_id, trial_number, subject_id, packet_id );

%Create a UDP sender in Matlab:
%https://www.mathworks.com/help/dsp/ref/dsp.udpsender-system-object.html
%Address 255.255.255.255 means we are broadcasting to every available IP address.
myudp = dsp.UDPSender('RemoteIPAddress','255.255.255.255','RemoteIPPort',...
    30,'LocalIPPortSource','Property','LocalIPPort',31);

%send packet.
myudp( int8( stop_msg ) );