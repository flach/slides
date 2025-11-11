### Machine Learning is a form of Data Science

Data Science is a family of *disciplines operating at the junction of data and knowledge*, building on rich data and domain knowledge to produce **value** in a variety of forms: 
- scientific knowledge and models
- societal value
- economic value
- personal value
- ...


### Data and Knowledge

*Data* provides factual information about events, situations, circumstances etc. that matter to us. 
It is a vehicle for **describing** relevant parts of the physical or virtual world. 

*Knowledge* is the carrier of **understanding**: 
- (K in) Domain knowledge is indispensable for processing and exploiting the data in a productive way. 
- (K out) Further knowledge is produced by applying analytics to data.


### Data Science Activity Types

<center>![DS-Venn](img/DS-Venn.svg) <!-- .element height="50%" width="50%" --></center>

*
*
*


## Back to the roots: Data Mining

> the overall process of knowledge discovery from data, including how the data is stored and accessed, how algorithms can be scaled to massive datasets and still run efficiently, how results can be interpreted and visualised, and how the overall human-machine interaction can be modeled and supported

U. Fayyad, G. Piatetsky-Shapiro and P. Smyth, "The KDD process for extracting useful knowledge from volumes of data", Commun. ACM, vol. 39, no. 11, pp. 27-34, Nov. 1996.


### CRoss-Industry Standard Process for DM

> CRISP-DM was conceived in late 1996 by three "veterans" of the young and immature data mining market. DaimlerChrysler (then Daimler-Benz) was already experienced ... in applying data mining in its business operations. SPSS (then ISL) ... had launched the first commercial data mining workbench - Clementine - in 1994. NCR ... had established teams of data mining consultants and technology specialists to service its clients' requirements.

P. Chapman (2000). CRISP-DM 1.0: Step-by-step data mining guide.


### CRISP-DM Process Model

<center>![CRISP-DM Process Model](img/CRISP-Process-Model.png)</center>


### CRISP-DM Phases

<center>![CRISP-DM Phases](img/Crisp-DM.svg) <!-- .element height="55%" width="55%" --></center>


### CRISP-DM Generic Tasks

<center>![CRISP-DM Tasks](img/CRISP-Tasks.png)</center>


### CRISP-DM evolution

<center>![CRISP-DM evolution](img/EvolutionKDD.svg) <!-- .element height="100%" width="100%" --></center>
<small>Adapted from G.  Mariscal,  O.  Marban,  and  C.  Fernandez: A  survey  of  datamining and knowledge discovery process models and methodologies, Knowledge Engineering Review 25(2):137-166, 2010.</small>


### The process view is **goal-oriented**

CRISP-DM is about processes and different tasks and roles within those processes. 

Data is an ingredient towards achieving the goal, but not more than that. 

In the more exploratory Data Science world we need a methodology that is less prescriptive and *puts the data centre stage*. 

*
*
*


## From Data Mining to Data Science 

<center>![Google Trends](img/GT.png) <!-- .element height="70%" width="70%" --></center>


### Data takes centre stage

Contemporary Data Science *starts from the data*: 
- We know or suspect there is value in these data, how do we unlock it? 
- What are the possible operations we can apply to the data to utilise their value?

While moving away from the process, the methodology becomes less prescriptive and more inquisitive:
things you **can** do to data rather than things you **should** do to data. 


### From mining to prospecting

If data mining is like mining for precious metals, Data Science is like *prospecting*: searching for deposits of precious metals where profitable mines can be located. 

Such a prospecting process is fundamentally **exploratory** and can include some of the following activities: 


### Exploratory activities in Data Science

- *Goal exploration*: finding business goals which can be achieved in a data-driven way;
- *Data source exploration*: discovering new and valuable sources of data;
- *Data value exploration*: finding out what value might be extracted from given data;
- *Result exploration*: relating Data Science results back to the business goals;
- *Narrative exploration*: extracting valuable stories (e.g., visual or textual) from the data;
- *Product exploration*: finding ways to turn the value extracted from the data into a service or app. 


### DST space extends CRISP-DM space

<center>![DST space](img/DSspace.svg) <!-- .element height="75%" width="100%" --></center>


### Travelling through DST space

<center>![Trajectory](img/DSspace:BBVA.svg) <!-- .element height="75%" width="100%" --></center>


### A Data Science Trajectory

<center>![Trajectory](img/Ex_TourOperator.svg) <!-- .element height="75%" width="100%" --></center>

- *Goal Exploration*: activity recommender for tourists
- *Data Value Exploration*: get third-party location data
- *Data Preparation*: create user-location-activity ratings
- *Modelling*: train a recommender system
- *Product Exploration*: explore most appropriate end-user product/presentation	

*
*
*


## Example DST Trajectories

<center>![Activities](img/Activities.png) <!-- .element height="50%" width="50%" --></center>


### Pollution simulator

<center>![Ex_Simulation](img/Ex_Simulation.svg) <!-- .element height="100%" width="100%" --></center>

- Integration of traffic simulation models with meteorological data; 
- Exploring the most appropriate end-user presentation. 


### Payment geovisualisation

<center>![Ex_BBVA_tourism_spending](img/Ex_BBVA_tourism_spending.svg) <!-- .element height="100%" width="100%" --></center>

- *data value exploration* where the bank systematically looked through the data it held; 
- *goal exploration* where the bank chose to do an interactive website; 
- *result exploration* to decide which parts of the data could be monetised; 
- *narrative exploration*: e.g., "Ever wondered when Brazilians buy their food?"


### Data publishing

<center>![Ex_DataProduct](img/Ex_DataProduct.svg) <!-- .element height="100%" width="100%" --></center>

- *data source exploration* in case of external data;  
- *data acquisition* where the required data is downloaded, scraped and explored; 
- *data preparation* where data is parsed and structured; 
- *data architecting* where data is annotated and managed;  
- *data release* where both data and extraction pipelines are shared for public use.


### Further reading

<center>![TKDE](img/TKDE.png) <!-- .element height="100%" width="100%" --></center>

*
*
*


## Concluding remarks

CRISP-DM bears similarity to software engineering methodologies with an accepted series of phases and fixed entry/exit points. 

DST captures the additional complexity in Data Science of having a much richer set of activities, not all of which are relevant for every DS project. 

This creates uncertainty for project management, which DST mitigates in a variety of ways. 


### How DST helps DS project management

1. DST activities are systematically enumerated and hence reasonably comprehensive. <!-- .element: class="fragment" --> 
2. A library of previous trajectories provides templates for new projects. <!-- .element: class="fragment" --> 
3. DST trajectories facilitate project planning: e.g., activities can be assigned personnel and budgets, and transitions function as milestones. <!-- .element: class="fragment" --> 
4. DST encourages techniques from workflow inference and management, collection of statistics, etc. <!-- .element: class="fragment" --> 


### How DST relates to AutoML

AutoML is a process to automatically discover and configure machine learning workflows. 

For that to work in practice we need a language to describe possible workflows and how they are composed of basic building blocks. 

Data Science Trajectories provides a framework for defining such a language and meta-inductive bias. 


## Thanks for listening! 

<center>![Trajectory](img/DSspace:BBVA.svg) <!-- .element height="70%" width="70%" --></center>
