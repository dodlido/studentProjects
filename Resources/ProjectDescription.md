# The Design and Implementation of a RISC-V Processor with an Embedded Encryption Accelerator

## Introduction

RISC-V is an instruction-set architecture (ISA) that was originally designed  
to support computer architecture research and education and is in the process of becoming a standard free and open architecture for industry implementations as well.   
The RISC-V ISA has gained significant traction as a microcontroller due to its flexibility, scalability, and cost-effectiveness. As an open standard, RISC-V allows designers to customize the architecture to suit specific application needs, whether for low-power IoT devices or more complex embedded systems. Unlike proprietary architectures, RISC-V offers complete transparency and freedom from licensing fees, which makes it an attractive option for companies looking to reduce development costs. The modular design of RISC-V enables the inclusion of optional extensions, such as floating-point units or vector processing, tailoring the microcontroller to the demands of a particular project. 

## Project Description

Students will implement a minimal version of the RISC-V RV32I instruction set. In addition to that, the students will design and implement a hardware accelerator for an encryption algorithm of their choice. Finally, the students will embed the accelerator into the core, using the reserved opcode space to create their own custom instructions tasked with managing the accelerator.   
The students will create a specification of the resulting processor, familiarizing themselves with industry standards. 

## Project Goals 

1. RISC-V \- Designing and implementing a minimal, yet fully operational, RV32I compatible core.   
2. Hardware Acceleration \- getting to know the need of using custom hardware accelerators to offload certain tasks from the CPU workload by:  
   1. Design, implement and embed an encryption accelerator to the designed core.  
   2. Analyze the performance advantages of the selected method.  
3. Low Power \- Students will learn how to optimize their designs for low power edge devices.   
4. Documentation \- Students will learn how to compare between alternative solutions and create an architecture level specification of a block. 

## References

1. RISC-V specification \- [https://lf-riscv.atlassian.net/wiki/spaces/HOME/pages/16154769/RISC-V+Technical+Specifications](https://lf-riscv.atlassian.net/wiki/spaces/HOME/pages/16154769/RISC-V+Technical+Specifications)  
2. Design and Implementation of Low-Power IoT RISC-V Processor with Hybrid Encryption Accelerator, 2023, Sen Yang et al \- [https://www.mdpi.com/2079-9292/12/20/4222](https://www.mdpi.com/2079-9292/12/20/4222)