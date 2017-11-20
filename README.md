# RealTime_Underwater_DSP_

This project is a part of a bigger project, intended to design and implement an autonomous embedded system composed of Underwater Acoustic Sensor Network. Our project was to implement acoustic signals digital processing techniques for underwater communications.

## First phase:

At the beginning I performed a study on the probability of detection (Pd) for drone receiver, to determine which technique to use in order to maximise the Pd. finding the perfect technique that has maximum Pd, will help us determine what the transmitter signal should look like, as well as the receiver filter.


```
After a lot of research, we decided to choose only two transmitter signal techniques for our study:

* Linear Frequency Modulation
* Pure tone pulse

And on the receiver side, we choose two techniques for signal detection:

* Matched filter
* Energy detection

```
Results:

The simulation figures attached to project, show that Matched filtering has a higher Probability of detection. Furthermore, the probability of detection using a Matched Filetr is even higher with an LFM signal.

Also the LFM signal probability of detection does not depend on the number of samples used, in contrary to the pure tone pulse that requires higher sample numbers to improve the Pd 

## Second phase:Implementation Complexity on DSP


Results:

Ongoing ...!
