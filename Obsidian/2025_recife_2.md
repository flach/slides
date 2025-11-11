---
theme: white
verticalSeparator: vvv
timeForPresentation: 2700
---
 <!-- slide bg="[[PeterCartoon-square.jpg]]" data-background-opacity="0.2"-->
# Making Machine Learning more transparent
<br></br>
<br></br>
<br></br>

### Peter Flach, University of Bristol
<br></br>
https://flach.github.io/slides
vvv
## Outline
1) Setting the scene
2) Explainability for time series
3) Actionable counterfactuals
4) XAI tools
6) Multi-class explanations
---
# Setting the scene 
This is how Kacper Sokol describes explainability in his PhD thesis: 
<style>
	.red-border{
		border: 5px solid red;
	}
</style>
::: block
$$
\texttt{Explainability} = \\
\underbrace{%
\texttt{Reasoning} \left( \texttt{Transparency} |  \texttt{Background Knowledge} \right)%
}_{\textit{understanding}}%
$$
:::<!-- element class="red-border" -->
::: block
"which defines $\texttt{Explainability}$ as the **process** of deriving *understanding* – i.e., extracting meaning – through $\texttt{Reasoning}$ applied to $\texttt{Transparent}$ insights distilled from a data-driven predictive system that are adjusted to the explainee’s $\texttt{Background Knowledge}$." 
::: <!-- .element: class="fragment"-->

[Explainability is in the mind of the beholder (arxiv)](https://arxiv.org/abs/2112.14466)
vvv
## A simple geometric view
![[XAIplot.jpg|400]]
- in black: decision boundary and weight vector <!-- .element: class="fragment"-->
- in red: feature vector of instance currently on the negative side <!-- .element: class="fragment"-->
- in blue: recourse/counterfactual (closest point on decision boundary) <!-- .element: class="fragment"-->
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
## This research was supported by
- [Thales UK](https://www.thalesgroup.com/en/countries/europe/united-kingdom)
- [The Alan Turing Institute](https://www.turing.ac.uk)
- [TAILOR European Network of Excellence Centres in Trustworthy AI](https://tailor-network.eu)
- [UKRI Centre for Doctoral Training in Interactive AI](https://www.bristol.ac.uk/cdt/interactive-ai/)
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