# The Design and Implementation of a Systolic Array Core

## Introduction

Modern computing workloads such as machine learning inference, image processing, and scientific simulations demand high-throughput, energy-efficient computation. Systolic arrays, with their regular and pipelined structure, offer an effective hardware solution for accelerating dense matrix operations, a fundamental component of these workloads.

This project proposes the design and implementation of a systolic array core with an integrated DMA (Direct Memory Access) engine to efficiently stream matrix data from external DRAM. The proposed design aims to provide a scalable and reusable compute unit for a wide range of high-performance computing applications.

## Objectives 

1. To design a parameterizable systolic array architecture for matrix multiplication.  
2. To implement a DMA controller that efficiently streams matrix data from external DRAM to the systolic array.  
3. To support configurable matrix dimensions for input matrices.  
4. To verify correctness through simulation using representative matrix workloads.  
5. To evaluate the system in terms of throughput, latency, and scalability.

## Scope

1. Conduct a literature review on systolic array architectures and DMA mechanisms.  
2. Design and implement:  
   1. A systolic array compute unit.  
   2. A DMA engine capable of burst-mode data transfers from DRAM.  
   3. A control unit for synchronizing data flow between memory and the compute core.  
6. Integrate and verify the full system through zero-level-simulation.  
7. Analyze system performance across multiple matrix sizes and configurations.

## Key Takeaways

1. Custom Hardware Acceleration: The project delivers a specialized hardware unit for matrix multiplication based on a systolic array, enabling high-throughput computation for data-intensive applications.  
2. Efficient Memory Streaming: A dedicated DMA controller is designed to autonomously fetch matrix data from external DRAM, reducing CPU overhead and maximizing data throughput.  
3. Configurable Architecture: The systolic array supports adjustable input matrix dimensions, making it adaptable to a variety of problem sizes and use cases.  
4. Deep Understanding of Systolic Arrays: This project provides hands-on experience with systolic arrays — a foundational concept used in many hardware accelerators, especially for AI, DSP, and scientific workloads.

## References

1. H. T. Kung (1982) \- Why Systolic Architectures [https://www.eecs.harvard.edu/\~htk/publication/1982-kung-why-systolic-architecture.pdf](https://www.eecs.harvard.edu/~htk/publication/1982-kung-why-systolic-architecture.pdf)  
2. Qingzeng Song et al. (2024) \- High-throughput systolic array-based accelerator for hybrid transformer-CNN networks [https://www.sciencedirect.com/science/article/pii/S1319157824002830](https://www.sciencedirect.com/science/article/pii/S1319157824002830)  
3. Instructor project repository \- References, coding examples and documentation templates [https://github.com/dodlido/studentProjects](https://github.com/dodlido/studentProjects)  
   
