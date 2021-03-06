#!/bin/bash
xterm -hold -e roscore &
sleep 1
xterm -hold -e roslaunch ardrone_autonomy ardrone.launch  &
sleep 1
xterm -hold -e rostopic echo /ardrone/navdata  &
sleep 1
xterm -hold -e roslaunch ardrone_joystick teleop.launch &
sleep 1
xterm -hold -e rosrun ardrone_followme ardrone_followme &
sleep 1
xterm -hold -e rosrun image_view image_view image:=/ardrone/front/image_raw &
xterm -hold -e rosrun rviz rviz -d  "../configs/ShowArMarkerAsTF.rviz"
