---
theme: white
verticalSeparator: vvv
timeForPresentation: 2700
---
 <!-- slide bg="[[PeterCartoon-square.jpg]]" data-background-opacity="0.2"-->
# Transparent ML
<br></br>
<br></br>
<br></br>

### Peter Flach, University of Bristol
<br></br>
https://flach.github.io/slides

---
# Setting the scene 
![[conversation.jpg|800]]

[Glass-Box: Explaining AI Decisions With Counterfactual Statements Through Conversation With a Voice-enabled Virtual Assistant.](https://www.ijcai.org/proceedings/2018/0865.pdf)
vvv
## The geometry of counterfactuals
![[XAIplot.jpg|400]]
- in black: decision boundary and weight vector <!-- .element: class="fragment"-->
- in red: feature vector of instance currently on the negative side <!-- .element: class="fragment"-->
- in blue: recourse/counterfactual (closest point on decision boundary) <!-- .element: class="fragment"-->
vvv
## Local Interpretable Model-Agnostic Explanations (LIME)

<grid drag="100 50" drop="20 100 53" flow="row" align="stretch">
![[husky_org.jpeg|1000]] <!-- .element: class="fragment"-->
![[husky_segments.jpeg|1000]] <!-- .element: class="fragment"-->
![[husky_mask.jpeg|1000]] <!-- .element: class="fragment"-->
</grid>

---
# Counterfactuals
::: block <!-- element class="red-border fragment"-->
The recourse to be applied to the feature vector in order to change the predicted
class.
:::
::: block <!-- .element: class="fragment"-->
![[RP.jpg|200]] 
This work was led by Rafael Poyiadzi. 
:::
vvv
[FACE: Feasible and Actionable Counterfactual Explanations (AIES 2020)](https://dl.acm.org/doi/10.1145/3375627.3375850)

![[face.png|500]] 
Four counterfactuals for X: 
+ A has low margin; 
+ B is in a low-density region; 
+ C requires crossing a low-density region; 
+ **D is the one found by FACE.** 
vvv
## Example paths found by the FACE algorithm
![[face2.png ]] 
vvv
## From 0 to 8: *MNIST* example
![[mnist0.png]]
![[mnist1.png]]
---
# Explaining multi-class predictions
::: block <!-- .element: class="fragment"-->
![[PGN.jpg|200]] 
This work was led by Paul-Gauthier Noé. 
:::
vvv
### Explaining a probabilistic prediction on the simplex with Shapley compositions 
![[shapcomp0.png|800]]
[ECAI 2024 paper](https://doi.org/10.3233/FAIA240605)
| [arXiv](https://arxiv.org/abs/2408.01382)
| [github](https://github.com/shapley-composition)
vvv
## Standard two-class Shapley values
![[shapcomp1.png|1200]]
vvv
## True multi-class explanations
![[shapcomp2.png]]
vvv
## Per-feature histograms
![[shapcomp3.png]]
vvv
## Cumulative visualisation
![[shapcomp4.png]]

---
# XAI for time series
![[TS.jpg|200]] <!-- .element: class="fragment"-->

[Sivill and Flach, AISTATS 2022](https://proceedings.mlr.press/v151/sivill22a.html)
| [github](https://github.com/TortySivill/LIMESegment)
| [slideslive](https://slideslive.com/38980514/limesegment-meaningful-realistic-time-series-explanations?ref=recommended)
vvv
## What's special about time series?
1) We need meaningful "super segments".
2) We need to be able to "switch off" segments.
3) We need to be able to define local neighbourhoods through similarity. 
vvv
## Segmenting time series
![[SegmentationDemonstration.png|700]]
Segments and changepoints are constructed by considering similarity relations that preserve adjacency. 
vvv
## Background vs. foreground
![[Perturb_Intution.png]]
::: block <!-- .element: class="fragment"-->
**Background** components are present throughout.
:::
::: block <!-- .element: class="fragment"-->
**Foreground** components can then be "switched off" as required for LIME. 
:::
vvv
## Similarity
![[zero_TS_demonstration.png|800]]
::: block <!-- .element: class="fragment"-->
With *dynamic time warping* the third perturbation is most similar to the original. 
:::
vvv
## Case study on MIMIC
![[sepsis_casestudy_LS.png]]
---
# XAI tools
![[KS.jpg|200]] <!-- .element: class="fragment"-->
Most of this work was led by Kacper Sokol <br>and funded by Thales UK.
vvv
## FAT forensics
![[academic_software-HCAI.png|400]]
- [*JOSS* paper (2020)](https://joss.theoj.org/papers/10.21105/joss.01904)
- [*Software Impacts* paper (2022)](https://www.softwareimpacts.com/article/S2665-9638(22)00095-1/fulltext)
- [`fat-forensics.org` Toolbox with demos](https://fat-forensics.org/getting_started/)
vvv
## bLIMEy: build LIME yourself
![[blimey.png|800]]

[arxiv](https://arxiv.org/abs/1910.13016)
| [github](https://fat-forensics.org/how_to/transparency/tabular-surrogates.html)
vvv
## XAI Fact Sheets
*A framework for systematic assessment of <br>explainable approaches*

![[taxonomy.png|400]]
- [(Sokol and Flach, AIES 2020)](https://dl.acm.org/doi/abs/10.1145/3351095.3372870)
| [video](https://www.youtube.com/watch?v=Hy8udfSU5dM)
- [Kacper's slides](https://usi.xmlx.io/slides/1_introduction/taxonomy.html)
---
# Wrapping up
vvv
## Take-home messages
+ Approaches such as LIME (and SHAP) should be considered *algorithm schemas*.
  + There are many devils in the details!
+ Explainability approaches don't always generalise well across data types.
  + What works for images doesn't necessarily work for tabular data, and *vice versa*.
+ We need to take probabilities seriously. 
  + In particular, they are rarely additive. 
vvv

<!-- slide bg="[[PeterCartoon-square.jpg]]" data-background-opacity="0.1"--><grid drag="100 30" drop="top" flow="row" align="stretch">
## With thanks to...
</grid>
<grid drag="80 30" drop="10 20" flow="row" align="stretch">
Kacper Sokol

Torty Sivill

Rafael Poyiadzi
</grid>
<grid drag="80 30" drop="10 60" flow="row" align="stretch">
Paul-Gauthier Noé

Miquel Perelló Nieto

Raul Santos-Rodriguez
</grid>
<grid drag="80 40" drop="10 15" flow="row" align="stretch">
![[KS.jpg]] <!-- .element: class="fragment"-->
![[TS.jpg]] <!-- .element: class="fragment"-->
![[RP.jpg]] <!-- .element: class="fragment"-->
</grid>
<grid drag="80 40" drop="10 53" flow="row" align="stretch">
![[PGN.jpg]] <!-- .element: class="fragment"-->
![[MPN.jpg]] <!-- .element: class="fragment"-->
![[RSR.jpg]] <!-- .element: class="fragment"-->
</grid>