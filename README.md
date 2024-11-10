# Upcounter--Design-and-Verification
This project contains the design and verification of an Up Counter module, implemented in SystemVerilog and UVM. The counter increments on every clock cycle, resetting to zero after reaching a specified maximum count.
Features

Configurable Bit Width: The counter width can be adjusted to match application requirements.
Reset and Enable Signals: Includes reset functionality to initialize the counter and an enable signal to control counting.
Parameterized Max Count: The maximum count can be parameterized to any desired value.

Design Specifications
Language: SystemVerilog
Clock: The counter increments on the rising edge of the clock.
Reset: Synchronous reset to zero.
Enable: Counts only when the enable signal is high.

Verification Methodology
The design verification follows UVM (Universal Verification Methodology) to ensure comprehensive testing of the counter's functionality.


Testbench Overview
Assertions: Ensure correct behavior, such as resetting to zero and counting sequence.
Randomized Testing: Vary the enable signal, reset, and clock to validate counter robustness.
Coverage: Functional coverage is used to track the coverage of various scenarios.


Test Scenarios
Basic Count Test: Check if the counter increments as expected.
Boundary Condition Test: Verify the counter reset at the maximum count.
Enable Control Test: Test the counter behavior when the enable signal is toggled.
Reset Test: Validate that the counter resets correctly.
