Project Name: MorseCodeMachiney

Team Members: Denalda Gashi, Ethan Manfredi, Kevin Zhang

Link to Demo Video: [https://drive.google.com/file/d/1YtOQ32_DJMiCAWIBgNSVGgrBSfq-Ay5E/view?usp=drive_link](url)

Our project is a Morse Code Translator that utilitzes three buttons on the FPGA: button, send, and reset. Button corresponds to a dot or a dash, the user will press send at the end of each letter sequence, and can press reset tp clear the screen. Our Morse Code Translator follows the standard timing for Morse Code where if the user holds the button for a second then a dot will be sent and if it's held for more than 3 seconds then a dash is sent. We used a state machine diagram to model our morseFSM code. Our Morse Code Translator is capable of outputting 10 letters correctly decoded to the VGA output.

To run our project, download the files, import the files to Vivado, and make sure top module is set as top. Our project runs on a Nexys 7 FPGA. The middle button, N17, is what the user will press to represent a dot or dash. The left button P17 is the send and the top button N17 is reset.

Overview of our code:

This block diagram shows how our modules are connected. Firstly, clk_divider will output divided_clock which slows the clock from 100 MHz to 1/10 Hz. Then, divided_clock will be used in timing_control and morseFSM as inputs for the clock. timing_control will output dotOrDash which is a 2-bit variable that corresponds to whether the user sent a dot or a dash. This output will be sent to morseFSM as inputSignal. In morseFSM, there is a 10 element array that stores the 10 letter outputs. The letter outputs depend on the inputSignal (00 for wait, 10 for dash, 01 for dot, and 11 for send). The outputs will follow the morse code binary tree diagram and act like a state machine diagram as it changes based on the inputs. The 10 letter outputs will be sent to ascii_test which will assign the letter to specific x coordinates on the VGA output.


![Capture](https://github.com/user-attachments/assets/016d6a46-17f0-4183-a6f0-047ab986ea58)
