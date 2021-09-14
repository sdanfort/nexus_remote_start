# nexus_remote_start
Start Vicon Nexus remotely from Matlab via UDP. This code was compiled from two main sources.

(1) Vicon Shogun docummentation (has C++ example, but not Matlab): https://docs.vicon.com/pages/viewpage.action?pagaeId=101891053#UDPcapturebroadcast/trigger-Startnotification

(2) William Anderton's answer to this post on ResearchGate: https://www.researchgate.net/post/Does-anyone-have-experience-with-Vicon-start-stop-by-Matlab

To run this example, run `initialize_remote_start.m`. There you can play around with defining the subject ID and trial number or add other inputs to the start/stop functions.

In Nexus, be sure to enable remote trigger, arm, and lock. Make sure the file paths in the start/stop functions match with those in Nexus. And increment/change the `packet_id` EVERY TIME you define a new start/stop message or it won't work!
