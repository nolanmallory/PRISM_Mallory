PRISM_Mallory
=============
##Design

####Schematic
![alt text][logo]
[logo]: /ALU.png

####ALU Test/Debug
The code that had to be written for the ALU was mostly very simple to understand. The only difficilty came when writing the ROR code. Originally I tried to use a built in function to perform this action. However, I was having problems and ended up doing it by reassigning each bit manually. With the help of the mastermind Captain Silva, I was able to successfully write the ROR code.
```
when "011" => 
	Result(3) <= AccumulatorSignal(0);
    Result(2) <= AccumulatorSignal(3);--ROR
	Result(1) <= AccumulatorSignal(2):
	Result(0) <= AccumulatorSignal(1);
```

####ALU Testbench Simulation
![alt text][logo1]
[logo1]: /ALU_sim.JPG

####Datapath Test/Debug
The code that had to be written for the datapath was alot more difficult than the ALU. Using the PC code written for us and the help of Captain Silva, I went through the remaining registers, trying to give them some code for themselves. The largest issue I personally faced was getting the clock to work with the rest of the code. I originally had it one way, similar to the PC code. Then switched it to the way we have used it before. After doing so, the simulation matched the one given on the Lab 4 handout.

For Example:
```
elsif (Clock'event and Clock='1') then
    if (PCLd = '1' and JmpSel = '1') then
```
changed to something like

```elsif (rising_edge(Clock) and MARHiLd = '1') then```
####Datapath Simulation 
![alt text][logo11]
[logo11]: /Datapath_sim.JPG
##Reverse Engineering

####Simulation Analysis

####50 to 100 ns
![alt text][logo111]
[logo111]: /50to100.JPG
During this period, the IR is given the instruction of 7 first. It will complete the LDAI function. Next it is given the command of 3. This is the ROR function; so on the rising edge, the accumulator will rotate whatever its holding on bit to the right. In this case, b (1011) will be rotated to become d (1101). Last, the IR is given the instruction of 4, taking the operand of 3 and putting it on the data bus.


####Jump Instruction at 225 ns
![alt text][logo3]
[logo3]: /225.JPG

At this time the IR is carrying the instruction for b, or JN. It says to Jump to the operand address if the accumulator has a negative number. The accumulator holds the value of d (1101) so it is negative. The addr is given the value of 2 from MarLo as a result.

####PRISM program listing
![alt text][logo23]
[logo23]: /Prism.JPG

I went through the simulation to help create this code. Using whatever was in the IR, I formulated the sequence of instructions. 
