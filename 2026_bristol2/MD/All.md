## The parable of the elephant

![elephant](img/elephant.png)  <!-- .element height="80%" width="80%" -->

> Courtesy of Gemini (incl. obvious mistakes!) <!-- .element: class="fragment" -->


## The (AI) elephant in the room

![elephant](img/elephantAI.png)  <!-- .element height="80%" width="80%" -->

> Generated with Gemini.


### Measurement in machine learning

- Features are measurements
  - so they have scales, units, admissible statistics etc. 
- *Experiments are measurements*
  - e.g., confusion matrix obtained through cross-validation
  - what we really want to assess empirically is almost never directly observable!


## Stevens' Levels of measurement

Scale type | Description | Statistics
---|---|---
Nominal | no order, no unit | mode
Ordinal | order, no unit | median, quantile, range
Interval | can choose unit and zero | arithmetic mean, variance
Ratio | fixed zero, can choose unit | geometric mean, coefficient of variation

Each scale type inherits statistics from levels above.


### Levels of measurement: discussion

1. Many statisticians challenge the rigid connection between scale types and admissible statistics.
  - E.g., Spearman's rank correlation statistic would not be admissible for ordinal data.
2. Many common scales do not fit well:
  - scales bounded from both sides;
  - scales with a fixed unit;
  - integer measurements.

Such scales abound in machine learning!  <!-- .element: class="fragment" -->

----

## How physicists do measurement

- Physical quantities are assumed to have a unique associated **dimension** [(Fourier, 1822)](https://books.google.co.uk/books?id=No8IAAAAMAAJ&pg=PA128#v=onepage&q&f=false).
- In order to be compared and added or subtracted, quantities need to be *commensurable* (have the same dimension).
- Incommensurable quantities may be multiplied and divided, giving new derived dimensions.
  - E.g. pressure has dimension $M L^{-1} T^{-2}$
  - SI units Pascal = Newton/m$^2$ = kg/(m*s$^2$).


### Dimensional coherence

> Construct a square whose circumference equals its area. 

Most people would solve $4x = x^2 \rightarrow x=4$. <!-- .element: class="fragment" -->

However, $4$ is now a dimensioned quantity -- four of what? <!-- .element: class="fragment" -->

A dimensionally correct analysis would introduce a unit of length $u$: <!-- .element: class="fragment" -->

$$4(x/u)=(x/u)^2 \rightarrow x=4u$$<!-- .element: class="fragment" -->


### Dimensionless quantities

- Angle is a ratio of lengths, hence dimensionless; but it has units (radians, degrees).
	- Sometimes units also cancel, e.g. ABV has unit ml ethanol per 100 ml liquid (percentage).<!-- .element: class="fragment" -->
- Trigonometric functions are ratios of lengths as well, but $\tan \theta > \theta$ doesn't seem to make much sense. <!-- .element: class="fragment" -->
	- Perhaps there are different kinds of length?<!-- .element: class="fragment" -->
- Transcendental functions ($\exp$, $\log$, $\sin$ etc.) require dimensionless and unitless arguments.<!-- .element: class="fragment" -->
  - $\log(10 kg) = \log(10) + \log(kg)$ ???<!-- .element: class="fragment" -->


### Without dimensions anything goes...

Do the following expressions make sense? 
- [$f(x) = x-\ln(x)$](https://www.wolframalpha.com/input?i=x+-+ln+x)  <!-- .element: class="fragment" -->
- [$g(x) = x-\sin(x)$](https://www.wolframalpha.com/input?i=x+-+sin+x)  <!-- .element: class="fragment" -->
- [$h(p) = p-\ln(p)$ where $p$ is a probability](https://www.wolframalpha.com/input?i=x+-+ln+x%2C+x+%5Cin+%5B0%2C1%5D)  <!-- .element: class="fragment" -->


### From dimensions to signatures

Rather than having dimensions and units cancel, why not carry them around as type signatures? 

```tan :: xlength -> ylength -> real```

```tan xl yl = yl/xl```

<br>

```angle :: arclength -> radius -> real```

```angle al r = al/r```

ML quantities can have more than one signature, as we will see later. 

----

## How to build on this in machine learning and AI?

- Both perspectives (levels of measurement and dimensional analysis) have interesting features but appear overly focused on establishing a 'true' scale type or dimension for a measurement.
  - Machine learning needs something more *flexible*.
  - In particular, a better treatment of "dimensionless" quantities which are everywhere you look!
    - relative frequencies, probabilities, evaluation metrics...


### The computer science perspective

- *Abstract data types* can be adapted to the situation:
  - they provide relevant *meta-data*; 
  - they link to useful *operations*.
- In particular, **higher-order functional languages** such as [Haskell](https://www.haskell.org) or [Lean](https://lean-lang.org) allow reasoning with and about types.
  - This provides a formal language and logic for measurement meta-data.
- The challenge is to develop a generally agreed ["Systeme international"](https://en.wikipedia.org/wiki/International_System_of_Units) of ML measurements.


### Example: (Shannon) entropy

<div style="display: flex; justify-content: center; gap: 20px;">

![xpecBits Haskell code](img/xpecBits.png)  <!-- .element height="60%" width="60%" --> 
<!-- https://replit.com/@flach/ThoughtfulWarlikeRuntimelibrary -->
![Scoring rules](img/genEntropy.png)  <!-- .element height="45%" width="45%" -->
<!-- https://replit.com/@flach/KeyBewitchedRoute -->

</div>


### Signatures depend on context

The key point is that measures like Shannon entropy can have different signatures depending on the context: 
- **average message length** in information theory;  
- **expected loss** when forecasting the true distribution (generalised entropy) using the logarithmic scoring rule.  

Under the squared loss scoring rule the generalised entropy is *Bernoulli variance, which therefore has the same signature as Shannon entropy* in the context of proper scoring rules.   

----

## Towards a new Science of AI

![elephant](img/elephantAI.png)  <!-- .element height="40%" width="40%" -->

- The parable of the elephant is accurate: we are investigating AI with ill-suited "senses".
- We need to treat AI artefacts as *poorly understood study objects*, 
like atoms before discovery of the electron or genetics before the double helix, 
and develop the right **measuring instruments**. 


## Measuring instruments for machine learning

Ultimately, empirical ML needs to make *causal* statements:

> Algorithm A outperformed algorithm B **because** the classes were highly imbalanced.

- I.e., with re-balanced classes (counterfactual intervention) the difference in performance would disappear.    <!-- .element: class="fragment" -->
  - NB. In empirical ML we can actually carry out interventions, which makes causal inference a whole lot easier!   <!-- .element: class="fragment" -->


## Concluding remarks

Proper treatment of performance evaluation in machine learning and AI requires a sophisticated **measurement framework** with the following components:
- *Coherent types and meta-data* for the observable performance indicators;
- *Latent-variable models* for the unobservable performance indicators of interest;
- *Causal models* to allow for counterfactual reasoning.
