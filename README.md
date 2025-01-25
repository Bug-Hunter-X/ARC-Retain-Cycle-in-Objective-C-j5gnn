# Objective-C ARC Retain Cycle Bug

This repository demonstrates a common bug in Objective-C related to Automatic Reference Counting (ARC) and retain cycles.  The bug involves creating a retain cycle using a delegate or block, leading to memory leaks and unexpected application behavior.  The solution showcases how to prevent retain cycles using techniques like weak references.

## Bug Description:

The `Bug.m` file contains code that creates a retain cycle, preventing objects from being deallocated.  This occurs because two objects hold strong references to each other, creating a circular dependency. 

## Solution:

The `Solution.m` file demonstrates how to resolve the retain cycle using `weak` references. By using `weak` instead of `strong` to reference the delegate or block, the retain cycle is broken, allowing the objects to be properly deallocated.