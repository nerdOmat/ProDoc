.. toctree::
   :maxdepth: 3 
   :numbered:

.. role:: raw-latex(raw)
   :format: latex

.. role:: inline-math
   :format: math

.. role:: only-html
   :class: only 
   :format: html

===============
Zusammenfassung
===============

Kapitel :ref:`hardware`: Es wurde eine intelligente Flugsteuerung entwickelt. Diese bietet ein Echtzeitsystem für die Umsetzung von Flugalgorithmen und ein Linuxsystem für die Ansteuerung von Payload-Sensoren. Es hat sich gezeigt, dass ein Absturz des Linux-Systems dazu führt, dass auch das Echtzeitsystem abstürzt. Da es nicht möglich war, die sicherheitsrelevanten Algorithmen der Flugsteuerung vom störungsanfälligen Linux-System zu isolieren, wurden weitere Tests dieser Hardware übersprungen und es wurde dazu übergegangen die Flugalgorithmen auf den Motortreibern zu implementieren.

Kapitel :ref:`simulation`: Eine :raw-latex:`\acs{gui}`-basierende Simulationsumgebung für Quadrocopter wurde entwickelt. Die Entwicklung wurde so weit vorangetrieben, dass die grundsätzliche Physik eines Quadrocopters simuliert werden kann und diese nun für weitere Tests zur Verfügung steht. Um auch die Positionsregelung eines Quadrocopters testen zu können müssen noch Magnetfeld und GPS integriert werden.

Kapitel :ref:`sensorfusion`: Hier werden Algorithmen für die Schätzung von Orientierung und Position hergeleitet. Dafür wird zunächst ein fundierter Literaturüberblick geliefert. Anschließend werden alle theoretischen Grundlagen die für die Herleitung der Algorithemen benötigt werden beschrieben. Anschließend werden zunächst verschiedene Algorithmen für die Orientierungsschätzung des Quadrocopters gezeigt. Diese werden verglichen und deren Einsatz im Regler wird diskutiert. Abschließend wird ein extended Kalman-Filter zur Positionsschätzung hergeleitet. Dieser konnte im Rahmen dieser Arbeit nicht mehr auf der Flugsteuerung umgesetzt und getestet werden.

Kapitel :ref:`protocols`: Da unterschiedlichste Systeme häufig über - in der Bandbreite beschränkte Funksysteme - miteinander kommunizieren müssen, wurde eine Methode gesucht den Austausch und das Speichern von Daten in geeigneter Weise zu gestalten. Hierfür wurden frei verfügbare Bibliotheken zusammengetragen und verglichen. Dabei wurde auf verschiedene Aspekte, wie Lauffähigkeit auf eingebetteten Systemen oder Unterstützung verschiedener Programmiersprachen eingegangen. Am Ende wurde jene Bibliothek ausgewählt, die am besten geeignet ist. Es wurden einige Sample-Codes mit Installationsskript geschrieben, um den Einstieg in die Bibliothek zu erleichtern.

.. Und zuletzt wurde eine gute Methode gesucht ein Signal zu übertragen.


========
Ausblick
========

.. .. only:: not latex 
 
   .. figure:: images/MERGE_DOCS_SPEC/qr/qr_german_law.*
      :align: center
      :width: 300
      
      Link zu Präsentation Rechtliches :cite:`german_law` 

.. .. only:: latex
  
   .. figure:: images/MERGE_DOCS_SPEC/qr/qr_german_law.*
      :align: center 
      :scale: 20 %

..      Luftverkehrsrechtliche Betrachtungen zu UAVs :cite:`german_law` 

.. Bereits in den Unterkapiteln wurde ein Ausblick zu den einzelnen Themen gegeben. Hier wird noch einmal ein genereller Ausblick zum Gesamtthema gegeben.

.. * Industrie 4.0 Sensorpille
.. * ETH Zürich Paper Funktionale Sicherheit Rotorausfall

Ein wesentlicher Punkt, der Verbesserungspotential verspricht, ist die funktionale Sicherheit des Flugroboters. Für die Verwendung von Fluggeräten mit sechs oder mehr Rotoren spricht, dass sie auch bei Ausfall eines Rotors immer noch stabil fliegen. Da im Rahmen dieser Arbeit jedoch festgestellt wurde, dass Fluggeräte mit nur vier Rotoren längere Flugzeiten aufweisen wird hier auf mehr Rotoren verzichtet. Eine Möglichkeit trotzdem einen Absturz zu verhindern ist die Anbringung eines Fallschirmes. Hier ist jedoch häufig eine relativ hohe Flughöhe notwendig, da kommerziell erhältliche Fallschirme bis zu 200 ms benötigen, bis diese sich öffnen. Eine weitere Möglichkeit wurde von der ETH Zürich in :cite:`rotor_loss` vorgestellt. Die Funktionalität dieser Methode konnte für den Ausfall von einem oder zwei gegenüberliegenden Rotoren experimentell nachgewiesen werden. In der Simulation, konnte die Funktionalität dieser Methode sogar für den Ausfall von drei Rotoren nachgewiesen werden. Es wird bei Rotorausfall auf die Regelung des Yaw-Winkels verzichtet. Da durch den Rotorausfall das Drehmoment der Yaw-Axe nicht mehr ausgeglichen wird, beginnt der Quadrocopter in dieser Axe zu rotieren. Indem man immer dem Rotor mehr Schub zuweist, der bei der Rotationsbewegung des Quadrocopters gerade den tiefsten Punkt passiert. Regelt man auf diese Weise einen bestimmten Neigungswinkel, kann der Flugroboter gelenkt werden. Unter Umständen führt jedoch der Schubverlust eines oder mehrerer Rotoren dazu, dass sich der Quadrocopter zwangsweise im Sinkflug befindet.  Hierzu findet sich ein Video der ETH Zürich unter der Rubrik *weiterführende Links* im Downloadsbereich der Website dieser Arbeit :cite:`downloads`. Diese beiden Möglichkeiten sollten evaluiert, erforscht und erprobt werden.

Desweiteren kann der Flugroboter als Sensorplatform in weiteren Versuchen für den Einsatz im Katastrophenschutz getestet werden. Neben der bereits bekannten Methode der Vermisstensuche mit Wärmebildkamera können innovative Technologien, wie sie beispielsweise im Rahmen einer Übung zum Thema *Suchen und Retten in Städten* (USAR, *Urban Search and Rescue*) des Technischen Hilfswerks praktisch erprobt wurden. Hier wurden mittels einer, an der Friedrich-Alexander Universität Erlangen-Nürnberg entwickelten Technologie, Verschüttete über die :raw-latex:`\acs{gsm}`-Signale von deren Mobiltelefonen geortet :cite:`locate_gsm`. Eine weitere Methode, Verschüttete aufzuspüren ist die Detektion von Brustkorbbewegung durch Radarmessungen (Bioradar) :cite:`bioradar`, wie sie an der Universität Freiburg erforscht wurden. Dies sind vielversprechende Technologien, deren Nutzen für den Katastrophenschutz durch den mobilen, autonomen Einsatz zusammen mit dem Flugroboter gesteigert werden kann.

Die Flugzeit eines Quadrocopters ist durch den Akkubetrieb naturgemäß endlich. Da eine der Hauptanwendungen des Flugroboters im Katastrophenschutz der Schwebeflug zur Lageübersicht mit Kamera ist, ist es sinnvoll, für diesen Anwendungsfall über eine Verlängerung der Flugzeit, durch die Versorgung vom Boden aus nachzudenken. Eine Möglichkeit bieten hocheffektive Solarzellen, wie sie beispielsweise von den Firmen LaserMotive :cite:`lasermotive` oder L2W Eneregy :cite:`l2w` angeboten werden. Die Versorgung kann dann entweder drahtlos, über einen gerichteten Laser oder über die Einkopplung eines Lasers in leichte Glasfaserkabel erfolgen.

.. evtl Braincopter
.. l2wenergy.com
