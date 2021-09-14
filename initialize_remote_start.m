%initialize_remote_start

%Code to remotely start and stop data collection in Vicon Nexus from Matlab.
%Written by Shannon Danforth
%14 Sept 2021

%This code draws from:
%(1) Vicon Shogun documentation https://docs.vicon.com/pages/viewpage.action?pageId=101891053#UDPcapturebroadcast/trigger-Startnotification
%(2) William Anderton's answer on ResearchGate https://www.researchgate.net/post/Does-anyone-have-experience-with-Vicon-start-stop-by-Matlab

%In Nexus: Enable remote trigger, arm, and lock. Make sure file paths
%match with those in the start and stop functions.

clear;

%values you may be defining in your experiment:
subject_id = '1';
trial_number = 1;

%the packet ID must be different each time a start or stop packet is sent.
%We'll just increment it by 1 each time.
%Remember to continue to increment if the start or stop is called multiple
%times (e.g., if this is in a loop).
packet_id = 1;

%start:
send_start_udp( subject_id, trial_number, packet_id );

%pause for a bit.
pause(5);

%incrememt packet_id:
packet_id = packet_id + 1;

%stop:
send_stop_udp( subject_id, trial_number, packet_id );