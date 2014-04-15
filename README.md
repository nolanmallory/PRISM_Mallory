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

####Testbench Simulation



##Reverse Engineering



####Simulation Analysis
