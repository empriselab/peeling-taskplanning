# peeling-taskplanning

This repository contains a domain and problem file written in PDDL
to map out the task of picking up and peeling a food item with a
robotic arm, peeler, and a cutting board. 

The plan is found using the fully observable non-deterministic (FOND) planner
Planner for Relevant Policies (PRP). The outputs of the plan are located in the
_policy_output_ folder in the format of a policy. The output is the _output.sas_
file while the raw policy produced is the file _policy.out_. Using the 
translator _translator.py_, a human readable output file is created namedʼ
_readable_output.txt_.

## Citation
### Planutils
The planner PRP is installed/accessed through the Planutils library.

GitHub Repo: https://github.com/AI-Planning/planutils

### PRP
GitHub Repo: https://github.com/QuMuLab/planner-for-relevant-policies
The _translator.py_ file is a copy of planner-for-relevant-policies/prp-scripts/translate_policy.py 
with a few minor changes so that the output is printed in the _readable_output.txt_ file.

@inproceedings{muise12icapsfond,
  author = {Christian Muise and Sheila A McIlraith and J Christopher Beck},
  title = {Improved Non-deterministic Planning by Exploiting State Relevance},
  booktitle = {The 22nd International Conference on Automated Planning and Scheduling (ICAPS)},
  year = {2012},
  subdiscipline = {Artificial Intelligence},
  type = {Conference Proceedings}

@inproceedings{muise-aaai-14,
  title={Computing Contingent Plans via Fully Observable Non-Deterministic Planning},
  author={Muise, Christian and Belle, Vaishak and McIlraith, Sheila A.},
  booktitle={The 28th AAAI Conference on Artificial Intelligence},
  year={2014},
  url={http://www.haz.ca/papers/muise-aaai-14.pdf}

@inproceedings{muise-icaps-14,
  title={Non-Deterministic Planning With Conditional Effects},
  author={Muise, Christian and McIlraith, Sheila A. and Belle, Vaishak},
  booktitle={The 24th International Conference on Automated Planning and Scheduling},
  year={2014},
  url={http://www.haz.ca/papers/muise-icaps-14.pdf}
