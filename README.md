# 355FinalProject

Foot drop is a condition wherein the afflicted individual is unable to produce dorsiflexion and lift the front part of their foot.  This often requires Functional Electrical Stimulation (FES) to stimulate the tibialis anterior (TA) muscle and clear the patient’s foot during the swing portion of the gait cycle. 

We created a 2-D state space equation model to investigate the activation of the tibialis anterior under FES to determine the ankle angle during the swing phase of the gait cycle. Four states were modeled, simulated, and plotted in MATLAB including ankle joint angle, angular velocity, normalized TA muscle length, and activation of electrical stimulation. 

The state equations were obtained using activation dynamics, muscle contraction dynamics (Hill muscle model, torque), rigid-body dynamics, musculoskeletal geometry, and kinematics calculations. The initial conditions for these states were based on the toe-off position in the gait cycle and the simulation length spanned the duration of the swing phase of the gait cycle.  

Multiple simulations were run to investigate the impacts of pulse width modulation, frequency, sex, and fatigue on each of the states. Our model produced the following results: While the impact of sex was minimal, increasing pulse width modulation and frequency increased activation of electrical stimulation, and fatigue generally elicited a smaller force response from the TA. 

The results were validated through comparing plots to literature. A limitation of the model is that it is based on the actuation of only the TA muscle and models only the swing phase.

The following paper was used as a reference throughout the project:
X. Zhang, Z. Jiang, X. Li, P. Xu, Z. Lucev Vasic, I. Culjak, M. Cifrek, M. Du, and Y.-ming Gao, “Dynamics combined with Hill model for functional electrical stimulation ankle angle prediction,” IEEE Journal of Biomedical and Health Informatics, 2021. Available: 10.1109/jbhi.2022.3158426
