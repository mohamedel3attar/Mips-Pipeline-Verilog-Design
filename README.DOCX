1.Intro:
 
1.1.	Short Description:

This Project is simply a Design of pipeline MIPS processor written in Verilog (VHDL) with handling of Data hazards and forwarding process to achieve the maximum performance in units of clock cycles. 

Also, this Design Code is written in simple way without any complexities, and every single module is written in a separate file to avoid coding traffic and to manage and distribute tasks on all members in the team; which makes the development process easier and co-operative.

1.2.	Attached Files:

With this project brief you will find the design Verilog code which is all with extension “.v” except the program assembly code that you will write as a binary file of extension “.txt”.

As we said before in the previous section every single module was written in separate file, so surely you will find file for specified module you want to look at with no effort.

In addition, there are some //comments for some ports’ names and the behavior description for other code lines.



1.3.	Workflow management:

At the beginning, we made a project plan in addition to some guide lines to make the integration process more easy and quick. 

We created a “GitHub” repository to handle task completion and final integrations so every task finished by one of the team members is pulled with request to be added to the Master repository.

After adding the task, the rest of team members review it and ask for explanation in an online meeting to discuss every single detail that may not be clear and from here the FAQ  comes. After that, the module is then updated if there is something to be edited for optimization or to get better results at all the test cases.


1.4.	Process Phases:

The project process was divided mainly in 2 phases:
Phase One:
The single cycle MIPS processor was implemented and the modules of the single cycle were integrated, after that we tested it with a neat Test-bench and it totally worked after some bugs and issues which were of course solved and cured.

Phase Two:
In phase 2 we continued our work to implement the pipeline MIPS processor by implementing the modules of hazard detection unit and forwarding units in addition to the four Pipeline registers and other modules.

After finishing all the modules and their implementation, we made a test bench for the pipelined processor with different test cases to test data and control hazards handling and it successfully could handle these with good optimization in time.

Note: in the second section we will get a lot deeper in Design and other technicalities. 





















2.Design: 

 2.1. Modules:

  As we mentioned before that every single module is in a single file 
  attached in the project folder.

 In the single cycle the following modules are implemented:
•	ALU32Bit.
•	ALUControl.
•	ControlUnit.
•	Adder.
•	InstructionMemory.
•	PC.
•	PCAdder.
•	RegisterFile.
•	ShiftLeft2.
•	SignExtend.
•	Mux2x1.
•	DataMemory.

All these modules are tasked on each member of the team to be   fulfilled, that made the process very easy and quick to be finished.

In phase 2 we have to implement the pipeline MIPS so it was the time to implement the necessary modules for data hazard detection and handling and forwarding process in addition to cover all probabilities  of data hazard and branch instruction,so the next coming modules are also tasked to the team again and finished in a good and professional way after many online meeting for brainstorming and discussion.

Phase 2 Modules for pipelining:
•	IF_ID_reg.
•	ID_EX_reg.
•	EX_MemReg.
•	Mem_Wbreg.
•	Comparator.
•	HazardDetectionUnit.
•	ForwardingUnit.
•	Mux3x1.

o	The IF_ID_reg.v file is the register file between the instruction Fitch stage and instruction decoding stage which will pass the stored result of the first stage to the next stage (instruction decoding stage) with the next clock cycle.

o	The ID_EX_reg.v file is the register file between the instruction Decoding stage and Execution stage which will pass the stored result of the first stage to the next stage (Execution stage) with the next clock cycle.

o	The EX_MemReg.v file is the register file between the Execution stage and Memory stage which will pass the stored result of the first stage to the next stage (Memory stage) with the next clock cycle.

o	The Mem_Wbreg.v file is the register file between the Memory stage and Write back stage which will pass the stored result of the first stage to the next stage (Write back stage) with the next clock cycle.

o	Comparator is module between the ReadData1 and ReadData2(the outputs of register file) to compare between them to optimize branch instructions and the output signal of this module will be flag of equality between the two Data if equal the flag will equal 1 else the flag will equal 0.

o	Hazard detection unit is that module which detect if there is data hazard and handle it, this module covers all data hazard cases (RAW, WAR, RAR).

o	Forwarding unit by definition is made to handle forwarding process between different clock cycles and instructions to achieve the maximum optimization of clock cycle.

2.2. Testing and Test Benches:

        Testing all these modules was not that easy thing whether for phase 1 or phase 2 but harder in phase 2 after attaching pipeline modules to the design for that we created two test benches for every phase.

For phase 1 we concerned on testing the more complexed code to make sure that the design working all the way right and efficient with also a maximum optimization, attached for the folder a file “MIPSTestBenchPhase1.v” which contain the test bench that we used and also attached file “Code.txt” which contain the code we used for testing.

For Phase2 we made a new separate Test Bench module which was more clear and easy to integrate the Pipeline modules it’s also attached to the folder with the test code used to test the pipeline to achieve optimization goals.

