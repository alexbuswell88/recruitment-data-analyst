# Data Analytics Assessment

## Objective

This repository serves as a conduit for a specialized data analytics task, tailored to gauge a candidate's proficiency in data management, data processing, and problem-solving. Moreover, it also evaluates your ability to narrate a compelling story through data. 

Your task is to choose one of the problems defined below, solve it using the provided data and tools, and present your solution and thought process during the interview.

## Problems to Solve
1. Create a dashboard to visualize which tracks best suit Williams cars.
2. Develop a simple tyre management strategy dashboard.
3. Saftety car impact; What impact does a safety car have on race outcomes, which races have the highest likelyhood of a safety car and how might this play into tyre strategies.
3. Tell a data-driven story of your own choosing from the available dataset.

## Prerequisites

To successfully undertake this task, you should possess the following skills:

- Proficiency in data analysis techniques using Python: You should be comfortable in manipulating, analyzing, and visualizing data with Python.
- Experience with data visualization tools and libraries: To effectively communicate your findings, you should be capable of creating engaging and meaningful dashboards.
- Familiarity with container management using Docker and Docker Compose: While in-depth knowledge isn't necessary, a basic understanding of DevOps principles will be beneficial.
- Knowledge of Git for version control: A GitHub account will be necessary for you to share your work with us.

Remember, our primary focus lies in your data analysis skills and your ability to tell a story from the data.

## What We Provide

This repository contains the following resources to assist you:

- A docker-compose.yml file for setting up a Jupyter notebook server, and MinIO Object Store for storing any raw data.
- A requirements.txt file specifying the Python packages necessary for executing the provided scripts.
- A set of Jupyter notebooks to guide you through the process of data retrieval and analysis.

## Instructions

1. Fork this repository to your GitHub account.
2. Select one of the proposed problem scenarios for your analysis.
3. Review the provided Jupyter notebooks for data samples to help develop your potential solution.
5. Analyze and visualize the data to answer the problem you chose using any methods or tools you deem fit.
6. Share the link to your forked GitHub repository with us so we can review your work during the interview.

## Note

- We value the quality of the solution, not the quantity. There is no 'right' way to do this. We are interested in your decisions, your justification, and your development process.
- Consider appropriate error handling and testing strategies.
- Ensure all data is handled in UTF-8 to support multi-byte characters.

## During the Interview

We will spend 45 minutes reviewing your solution, which includes:

- Code review and discussion.
- Discussion on your problem-solving process.
- Brainstorming future development ideas.

## Setup Notes:
### Requirements
Ensure you have recent versions of Docker and Docker Compose installed.

### Building the Images
This will build all the images referenced in the Docker Compose file. You will need to re-run this command after making any code changes (you can also specify individual services to build if more convenient).
```
docker-compose build
```

### Starting the Services
To run the services. It may take a short while to run the start-up scripts.

```
docker-compose up
```


### Cleaning Up
To tidy up, bring down the containers and delete them.
```
docker-compose down
```