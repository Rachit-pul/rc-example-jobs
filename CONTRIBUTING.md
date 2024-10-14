# Contribute to ICDS Job Examples

Our goal is to have a recipe file for all software on ICDS' clusters. Any contributions are welcome and will be acknowledged here.

### Job Structure Recommendations

1. Aim for a job runtime of 5-10 minutes. You can artificially inflate the runtime by using strategic  `sleep` commands
2. Jobs do not have to be meaningful. Having an example that does something interesting is a bonus but not required
3. Jobs that finish successfully should:
    - Have an exit code of 0
    - Have an empty error file
    - Have some output in the output file
3. Jobs that DO NOT finish successfully should:
    - Have an non-zero exit code
    - Have some output in the error file
4. Having two submit scripts, one serial example and one parallel example, is helpful

### Style Recommendations

1. Use long directives such as `--nodes=1` vs `-N 1`
2. Use .out and .err to indicate output and error files respectively
3. Use replacement symbols and environmental variables sparingly, but as helpful
4. Include a README.md which includes:
    - a brief overview of what the job does
    - details on input and output files if used
    - contributer information (name and date)

### Example sites

The following are some sources of example jobs:
 - https://github.com/unlhcc/job-examples
 - https://supercomputing.swin.edu.au/docs/2-ozstar/oz-slurm-examples.html
 - https://hpc-uit.readthedocs.io/en/latest/jobs/examples.html
