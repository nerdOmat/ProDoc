.. toctree::
   :maxdepth: 3 
   :numbered:

.. role:: raw-latex(raw)
   :format: latex

.. role:: inline-math
   :format: math

.. .. role:: only-html
   :class: only 
   :format: html


=================
Aufbau der Arbeit
=================

Die vorliegende Arbeit setzt sich aus vier Hauptthemen zusammen: Hardwareentwicklung der Flightcontrol, Simulation, Sensordatenfusion sowie Protokolle. Jedes dieser Themen ist Teil der Entwicklung der Flugsteuerung eines Quadrocopters und wurde für sich eigens behandelt und dokumentiert. Diese Aufteilung spiegelt sich im Aufbau der Arbeit wider. Jedem der vier Hauptthemen wird ein Kaptitel gewidmet und zu jedem Kapitel korrespondiert jeweils ein eigener Anhang. Dieser Aufbau beruht darauf, dass jedes dieser vier Themen in seiner Ordnerstruktur als eigenständiges Projekt angelegt wurde. Die jeweiligen Arbeiten können im Download-Bereich :cite:`downloads` der Website dieser Arbeit, neben der Arbeit im Gesamten, auch einzeln heruntergeladen und betrachtet werden. Der Link zur Website selbst, in Form eines :raw-latex:`\acs{qr}`-Codes, findet sich in Abbildung :raw-latex:`\ref{fig:web}`.

.. Jedes Thema wurde für sich eigens behandelt und dokumentiert. Diese Separabilität spiegelt sich im Aufbau der Arbeit wieder. 

.. only:: latex

   .. figure:: images/MERGE_DOCS_SPEC/qr/qr_website.*
      :align: center
      :scale: 20 %

      Link zur `Website`_ :raw-latex:`\label{fig:web}` der Arbeit

.. _Website: https://hps.othr.de/gsa39665

========================
Was ist ein Quadrocopter
========================

Quadrocopter sind vierrotorige Fluggeräte, die mittlerweile vor allem in Form von Drohnen eingesetzt werden. Jeder der vier Rotoren wird von einer Elektronik in einer Weise angesteuert, dass der Flugroboter die Balance in der Luft hält. Dadurch fliegt das Gerät sehr ruhig und eignet sich ideal um Filmaufnahmen und Bilder mit einer Boardkamera zu machen. Die Regelungselektronik kann das Fluggerät auch in einen bestimmten Winkel im Raum anstellen. Dadurch fliegt das Gerät in die gewünschte Richtung. Es gibt auch Drohnen mit mehr als vier Rotoren, dann spricht man von Multicoptern.

.. only:: not latex
 
   .. figure:: images/MERGE_DOCS_SPEC/merlinUAS.png
      :align: center 
      :width: 700

      Quadrocopter Merlin des Sensorik-Applikationszentrums

.. only:: latex

   .. figure:: images/MERGE_DOCS_SPEC/merlinUAS.*
      :scale: 80 %

      Quadrocopter Merlin des Sensorik-Applikationszentrums

===========
Anwendungen 
===========

Die Anwendungen von Flugrobotern sind zahlreich und gerade in der letzten Zeit sprießen fast täglich neue innovative Einsatzideen aus dem Boden. Beispielsweise kann man Außeninspektionen von großen technischen Anlagen wie Stromleitungen, Schornsteinen oder Windkraftanlagen durchführen. So kann auf Hubschrauber und Industriekletterer verzichtet werden. Das erhöht die Sicherheit und macht diese Einsätze kostengünstiger. Auch die Inspektion von Solarfeldern in Verbindung mit Wärmebildanlagen ist eine häufige Anwendung von Multirotor-Flugsystemen. Defekte Module können durch deren Erwärmung aufgespürt werden.  Wenn man bedenkt, dass jedes defekte Modul wie ein Widerstand wirkt und somit die Effektivität des Gesamtsystems verschlechtert, sieht man, dass eine rasche Auffindung des defekten Modules bares Geld spart.  

.. only:: not latex
   
   .. figure:: images/MERGE_DOCS_SPEC/applications.*
      :align: center 
      :width: 650
   
      Anwendungen von Flugrobotern

.. only:: latex

   .. figure:: images/MERGE_DOCS_SPEC/applications.*
      :scale: 70 %

      Anwendung von Flugrobotern 

In :cite:`wales` wird eine Möglichkeit vorgestellt, Walfischen mit einer Drohne autonom zu folgen. Dies wird mithilfe von Bilderkennungsalgorithmen umgesetzt. Ein Video unter der Rubrik  *weiterführende Links* im Downloadsbereich der Website dieser Arbeit :cite:`downloads` verdeutlicht, wie schwierig es ist, Walfische und Delphine von einem Boot aus mit einer Drohne manuell zu filmen. Dies zeigt das Potential dieser Technologie für Meeresbiologen. 

Eine sehr vielversprechende praktische Anwendung ist der Einsatz von Flugrobotern in der Landwirtschaft. Wird in der Landwirtschaft mit Sensorik gearbeitet um bestimmte Parameter zu ermitteln, spricht man von Präzisionslandwirtschaft (*Precision Agriculture, PA*). Bestimmte Werte, wie beispielsweise der Nitratgehalt von Pflanzen, können durch die Auswertung von Satellitenbildern erhoben werden. Da diese Variante jedoch sehr teuer ist, werden Möglichkeiten erforscht, diese Bilddaten mithilfe von Flugrobotern zu sammeln :cite:`crop_nitrat`, :cite:`crop_uav`.

.. Auch hierzu findet sich ein Video unter der Rubrik *weiterführende Links* im Downloadsbereich der Website dieser Arbeit :cite:`downloads`.

Im Sensorik-Applikationszentrum wird besonderes Augenmerk auf den Einsatz von Flugrobotern für Umwelt- und Katastrophenschutz gelegt. Hier finden sich zahlreiche Einsatzmöglichkeiten. Es wird am Anfang des Einsatzes ein Gerät mit Kamera in die Luft gebracht und Bilder werden an eine Bodenstation gesendet. So hat die Einsatzleitung zügig einen Überblick über das Geschehen und kann schnell Entscheidungen treffen. Auch Schadensanalysen nach Bränden sind möglich. Denkbar sind auch automatisierte Flüge über Katastrophengebieten oder Vermissten- Suchmissionen mit Wärmebildkameras.  Mithilfe von geeigneter Sensorik, wie :raw-latex:`\acs{cbrne}`-Detektoren [#cbrne]_ können Daten in Bereichen gesammelt werden, die für Rettungskräfte nur schwer zugänglich sind.

.. [#cbrne] CBRNE: **engl.** *chemical, biological, radiological, nuclear and high-yield explosives*, **deutsch** *chemische, biologische, radiologische, nukleare und explosive Gefahrstoffe* 

==========
Geschichte
==========


.. 1888 hat Otto von Lilienthal den Flug von Störchen untersucht und anhand dieser Beobachtungen festgestellt, dass Auftrieb durch eine gewölbte Flügelform erreicht wird. Diese Behauptung hat er durch praktische Versuche nachgewiesen. Die daraus entstandenen Ergebnisse veröffentlichte er in seinem Werk *Der Vogelflug als Grundlage der Fliegekunst*, welches bis heute, als das bahnbrechendste Werk aus der Flugtechnik gilt. Die darin enthaltenen Erkenntnisse bildeten die Grundlagen zu den weiteren Ergebnissen der Luftfahrt mit dem Prinzip *schwerer als Luft* und führte schließlich dazu, dass Ingenieure zu praktischen Versuchen mit Drehflüglern inspiriert wurden. Die Theorie des vertikalen Flugs wurde von William Rankine, W. Froude und R. E. Froude formuliert (*Blatt-Theorie*) und wird im Theorieteil behandelt.

.. .. figure:: images/MERGE_DOCS_SPEC/lilienthal.pdf
      :scale: 50 %

..      Aus *Der Vogelflug als Grundlage der Fliegekunst* von Otto von Lilienthal

Das Konzept eines Luftfahrzeuges mit vier Rotoren wurde erstmals 1907 von Brequet und Richet untersucht. Deren schweres und großes Luftfahrzeug hob nur wenige Meter über dem Boden ab und flog nur kurze Zeit :cite:`leishman_brequet`. Erst 1920 wurde wieder ein Fluggerät mit vier Rotoren entwickelt (Étienne Oehmichen, seit 1920). Der erste Prototyp war zunächst zu schwer und benötigte einen zusätzlichen Wasserstoffballon um fliegen zu können :cite:`leishman`. Die Fluggeräte mit vier Rotoren wurden schließlich durch die Erfindung der Taumelscheibe gänzlich verdrängt. In den sechziger Jahren gab es noch einmal einige Entwicklungen von Fluggeräten mit vier Rotoren, die meisten kamen jedoch über das Konzeptstadium nicht hinaus :cite:`nasa_hist_vtol`.  

Durch die Verfügbarkeit von immer genaueren und billigeren Gyroskop- und Beschleunigungssensoren haben in den letzten Jahren Quadrocopter Einzug in den Bereich der sogenannten (:raw-latex:`\textit{Unmanned Aerial Vehicles, \acs{uav}}`), in Form von kleinen unbemannten Fluggeräten, gehalten.  


===========
Rechtliches
===========

Aufgrund der steigenden Popularität von Flugdrohnen wurde für sie das Luftverkehrsgesetz (:raw-latex:`\acs{luftvg}`) abgeändert. Kommerziell eingesetzte Flugroboter bekommen jetzt eine eigene Kategorie: *unbemannte Luftfahrsysteme*. Es bedarf einer Aufstiegsgenemigung für ihren Betrieb. Hobbygeräte fallen weiterhin unter die Kategorie *Flugmodelle* und sind nicht genehmigungspflichtig, wenn sie unter 5kg wiegen. Sowohl der autonome Flug als auch der Flug außerhalb des Sichtbereiches des Piloten ist derzeit weiterhin gesetzeswidrig.  

.. only:: not latex 
   
   Eine Präsentation, welche die Gesetzeslage von unbemannten Luftfahrzeugen unter 5 kg in Deutschland untersucht findet sich `hier`_.

.. only:: latex

   .. figure:: images/MERGE_DOCS_SPEC/qr/qr_german_law.*
      :align: center 
      :scale: 20 %

      `Link`_ zur Präsentation Luftverkehrsrechtliche Betrachtungen zu :raw-latex:`\acsp{uav}` :raw-latex:`\label{fig:german_law}`


Für genauere Informationen zur Gesetzeslage wurde online eine Präsentation hinterlegt :cite:`german_law`. Dort wurden Gesetze mit Relevanz für unbemannte Luftfahrzeuge unter 5 kg in Deutschland zusammengetragen und mit Quellen belegt.

.. _hier: https://hps.othr.de/gsa39665/files/rechtliches_embed.svg 
.. _Link: https://hps.othr.de/gsa39665/files/rechtliches_embed.svg

=================
Stand der Technik
=================

Die Fluglage- und Positionsregelung von Quadrocoptern wurde bereits vielfach untersucht. Die ersten Arbeiten mit hohem Impact-Faktor sind wohl jene der ETH-Zürich :cite:`full-control` und des Deutschen Luft und Raumfahrtzentrums (:raw-latex:`\textit{\acs{dlr}}`) :cite:`hirzinger`, beide aus dem Jahr 2007. Hier werden gewöhnliche :raw-latex:`\acs{pid}`-Regler verwendet. Im Laufe der Zeit wurden auch weitere Regelungskonzepte vorgestellt. So kommen Fuzzy-Regler :cite:`meister`, Backstepping- :cite:`backstepping` :cite:`wendel` oder Sliding-mode-Regler :cite:`sliding_mode` :cite:`backstepping_sliding` zum Einsatz. Auch neuronale Netze zur Höhenregelung :cite:`neural_altitude` oder - in Verbindung mit einem Backstepping Regler - zur Fluglageregelung :cite:`neural_backstepping` wurden vorgeschlagen. In :cite:`neural_control` wird ein neuronales Netz zur Regelung des Quadcopters vorgelegt.

Um notwendige Werte für die Positions- und Fluglageregelung zu erhalten werden barometrischer Höhendruck-, Magnetfeld-, Beschleunigungs-, Drehraten- und :raw-latex:`\acs{gps}`-Sensoren in geeigneter Weise fusioniert. Diese Themen wurden bereits zahlreich behandelt. Die Fluglageschätzung wird in :cite:`meister` :cite:`wendel` :cite:`quaternion_att` :cite:`mahony` :cite:`madgwick_paper` :cite:`madgwick_internal` :cite:`kalman_vel` :cite:`compare_complementary` :cite:`compare`, die Positionsschätzung mithilfe von Globaler Navigation Satelliten Systemen wird in :cite:`meister` :cite:`wendel` :cite:`sae` :cite:`indoor_gps` :cite:`farrel` behandelt. Als Werkzeug der Sensorfusion wird häufig der Kalman-Filter verwendet. Dieser wird in :cite:`kalman_paper` :cite:`poor_man` :cite:`kalman_embedded` :cite:`est_theo` :cite:`kalman_ieee` :cite:`kalman_introduction` beschrieben. Für eine detailliertere Einführung in den Stand der Technik zum Thema Sensorfusion sei auf das Kapitel :ref:`sensorfusion` verwiesen.

Viele Open Source Flugsteuerungen wurden in den letzten Jahren umgesetzt. Einige von ihnen werden in :cite:`build_own` vorgestellt und verglichen. 

Auch bezüglich der Energieversorgung des unbemannten Luftfahrzeuges (:raw-latex:`\acs{uav}`) gibt es Forschungen. In :cite:`akku_kalman` wurde beispielsweise eine Akkuüberwachung basierend auf einem Kalman-Filter vorgestellt. In :cite:`laser_power` wird ein Quadrocopter mithilfe einer speziellen hocheffektiven Solarzelle :cite:`effective_solar` der Firma LaserMotive :cite:`lasermotive` über einen Infrarotlaser mit Energie versorgt.

Für die Untersuchung der Aerodynamik der Rotoren sei zunächst auf ein Standardwerk über Hubschraubertechnik der Cambridge Universität, von J. Gordon Leishman, verwiesen :cite:`leishman`. Hier wird in die Grundlagen der aerodynamischen Untersuchung von Rotoren eingegangen. Leishman hat auch interessante Themen, wie beispielsweise das Schubverhalten überlappender Rotoren :cite:`leishman_overlap` untersucht. Die Behandlung von verschiedensten Aerodynamik-Themen, die Quadrocopter im Speziellen betreffen finden sich in :cite:`2dwind` :cite:`wind_disturbance` :cite:`wind_field` :cite:`turbulence` :cite:`vertical`. Das Thema Simulation von Quadrocoptersystemen wird in :cite:`gazebo_ROS` :cite:`jsbsim` :cite:`matlab_sim` :cite:`flight_gear_sim` :cite:`MAVsim` behandelt. Der Stand der Technik bezüglich der Themen Aerodynamik und Simulation wird neben dem physikalischen Bewegungsmodell eines Quadrocopters, in Kapitel :ref:`simulation` noch einmal feingliedriger zusammengetragen.


.. Quadrocopter sind aufgrund deren wenig komplexer Mechanik, der Fähigkeit senkrecht zu starten und zu landen (*Vertical Take off and landing, VTOL*) und deren ruhiger Fluglage beliebte Flugroboter für verschiedenste Anwendungen. In den letzten Jahren wurden jedoch auch alternative Konzepte, mit all ihren Vor- und Nachteilen, vorgestellt.

.. * Gleiter
.. * Zepelin (blimp)
.. * alternatives Quadcopter-Konzept
.. * CoaxCopter 

Die Bestrebungen, unbemannte Luftfahrzeuge in die jeweiligen nationalen Lufträume zu integrieren, ergeben völlig neue Forschungsfelder. Im November 2013 veröffentlichte die Bundesluftfahrtbehörde der USA (:raw-latex:`\textit{Federal Aviation Administration \acs{faa}}`) die sogenannte :raw-latex:`\textit{Integration of Civil Unmanned Aircraft Systems (\acs{uas}) in the National Airspace System \acs{nas} Roadmap}`  :cite:`roadmap_uas`, ein Plan, unbemannte Luftfahrzeuge sicher in den amerikanischen Luftraum einzubringen. Eine der größten Herausforderungen dieses Vorhabens ist wohl die Fähigkeit anderen Luftfahrzeugen zuverlässig auszuweichen. Bisher gilt die Regelung des Ausweichens bei Sichtung (*See and Avoid*). Dies muss von einem unbemanntem Luftfahrzeug automatisiert geschehen (*Sense and Avoid*).

.. Deshalb werden beispielsweise die Gründe für den Absturzes einer ferngelenkten bla-Drohne des Amerikanischen Grenzschutzes in Arizona untersucht, um solche Vorfälle zukünftig zu verhindern.

Auch EUROCONTROL [#eurocontrol]_ hat Bestrebungen, ferngelenkte Luftfahrzeuge (:raw-latex:`\textit{Remotely Piloted Aircraft Systemes, \acs{rpas}}`) im Zeitfenster von 2020 bis 2028 in den allgemeinen Luftraum zu integrieren :cite:`roadmap_euro`. Forschungen zur Umsetzung dieses Vorhabens finden als Teil des :raw-latex:`\acs{sesar}`-Projekts (:raw-latex:`\textit{Single European \acs{atm} Research}`) statt :cite:`sesar_approach`, ein pan-europäisches Programm zur Modernisierung und Vereinheitlichung des europäischen Flugverkehrsmanagements (:raw-latex:`\textit{Airtraffic Control, \acs{atm}}`) mit dem Ziel, die Sicherheit zu erhöhen und Kosten zu senken. 

.. Hier werden beispielsweise die Einbindung von UAVs in den Luftraum simuliert :cite:`sim_sesar`, oder 

Da sowohl der amerikanische als auch der europäische Ansatz, :raw-latex:`\acsp{uav}` in den Luftraum zu integrieren, auf alle Größen von UAVs abzielen, sollten die resultierenden gesetzlichen und technischen Entwicklungen vorsichtig verfolgt werden.

.. _eurocontrol: Europäische Organisation zur Sicherung der Luftfahrt

=========================================================================
Forschung und Entwicklung von UAS-Technik im Sensorik-Applikationszentrum
=========================================================================

Für das :raw-latex:`\ac{sappz}` ist der Quadrocopter in vielerlei Hinsicht interessant. Zum einen besteht die Elektronik aus zahlreichen Sensoren: Beschleunigungssensoren, Gyroskopsensoren und Magnetfeldsensoren für die Ermittlung der Neigung des Quadrocopters im Raum, sowie barometrische Drucksensoren zur Höhenbestimmung werden verwendet. Hier kann das Know-How des Sensorik-Applikationszentrums im Bereich der Sensorfusions- und Filteralgorithmik einfließen.  Zum anderen kann der Quadrocopter als Sensorplattform dienen. Es können eigene Sensoren sowie Fremdsensoren angeschlossen werden. Ebenso kann man :raw-latex:`\acs{gps}` gestützt bestimmte Messpunkte abfahren und den Quadrocopter als Werkzeug zur Messwertaufnahme in der Luft verwenden.  Besonderes Augenmerk bei der Entwicklung wird dabei auf die Vereinfachung der Bedienung, den autonomen Flug und ein durchdachtes Gesamtkonzept gelegt.

.. Forschungsgebiete im Sensorik-Applikationszentrum:

.. * Teilautonomer und autonomer Flug
.. * Head-Tracker
.. * Stabilität
.. * Gehäusetechnologie
.. * Sensorik-Trägerplattform 

Im Sensorik-Applikationszentrum wird derzeit das unbemannte Luftahrzeug (Unmanned Aerial Vehicle, :raw-latex:`\acs{uav}`) :raw-latex:`\textbf{merlin \acs{uas}}` entwickelt. Die Hauptanwendungen dieses Systems sind folgende:

 * Inspektion von Solarfeldern, Pipelines
 * Feuerwehr und Katastrophenschutz
 * Sensor-Trägerplattform

Dabei wird nicht nur das :raw-latex:`\acs{uav}`, basierend auf einem Quadrocopter, entwickelt sondern das komplette System mit Bodenstation, (:raw-latex:`\textit{Unmanned Aerial System, \acs{uas}}`). 

.. Bilder ... Solarfeld, Pipelines.

===============
Ziel der Arbeit
===============

Eines der Hauptthemen der :raw-latex:`\acs{uas}`-Forschung im Sensorik-Applikationszentrum ist die Vereinfachung der Bedienung. Gerade in den Anwendungen des Katastrophenschutzes ist dies wichtig, da im Einsatzfall wenig Zeit bleibt, sich mit der Bedienung des Gerätes auseinanderzusetzen. Deshalb ist es notwendig, eine eigene Flugsteuerung zu entwickeln, deren Flugalgorithmen beeinflusst werden können. Nur so können die Flugeigenschaften an die gewünschten vereinfachten Bedienkonzepte angepasst werden.

Da ein Quadrocopter ein instabiles System ist, müssen dessen vier Rotoren stets in einer Weise angesteuert werden, dass die Fluglage des Quadrocopters korrigiert wird. Dabei ist die Regelung der bürstenlosen Motoren nicht die Aufgabe der Flugsteuerung. Hierfür wurde eine eigene Motortreiber-Hardware [#firemicro]_ entwickelt. Es muss also eine Verbindung zu jenen Motortreibern bestehen. Außerdem muss geeignete Sensorik vorhanden sein, um die inertiale Orientierung bestimmen zu können.

.. .. figure:: images/MERGE_DOCS_SPEC/system.*
   :scale: 45 %

..   Anforderungen der FlightConrol 

Da der Quadrocopter am Sensorik-Applikationszentrum als Sensor-Trägerplattform verwendet wird, ist es desweiteren notwendig, dass benötigte Schnittstellen (:raw-latex:`\acs{i2c}`, :raw-latex:`\textit{\acs{spi}}`, :raw-latex:`\textit{\acs{uart}}`, *Ethernet*, :raw-latex:`\textit{\acs{usb}}`)  vollständig nach außen geführt werden.

.. figure:: images/MERGE_DOCS_SPEC/system.*
   :scale: 45 %

   Anforderungen der FlightConrol 

Die Flugregelung ist zeitkritisch und sollte in Echtzeit und in wenigen Millisekunden stattfinden. Für die Anbindung der Sensoren ist ein Betriebssystem sinnvoll, da hier der Integrationsaufwand zur Entwicklung von Treibersoftware wesentlich geringer ist. Deshalb fiel die Entscheidung, eine Recheneinheit zu verwenden, welche sowohl aus einem ARM-Core als auch einem :raw-latex:`\acs{dsp}`-Core besteht.

.. Anforderungen sowohl Flugsteuerung, als auch Sensorplattform ... Dual-Core-Hardware ...

Im Rahmen dieser Arbeit wurden folgende Aufgaben zur Entwicklung jener *Flugsteuerung* durchgeführt:

* :ref:`hardware`: Es wurde basierend auf dem OMAP-L138 von Texas Instruments eine Flughardware aufgebaut. Deren Ausgang hat die Möglichkeit, mit den Motortreibern zu kommunizieren. Außerdem verfügt die Hardware über die notwendige inertiale Sensorik zur Bestimmung der Fluglage. In dieser Arbeit wurde die Hardware entwickelt, jedoch nicht getestet.
* :ref:`simulation`: Basierend auf der Open-Source Software Gazebo wurde eine Simulation für den Test von Flugalgorithmen entwickelt. Mithilfe jener Simulation kann in Realzeit und rundenbasierend das Verhalten des Quadrocopters unter Einfluss eines Stimulus simuliert werden. Auch eine grafische Oberfläche zur visuellen Darstellung des Flugverhaltens wurde entwickelt.
* :ref:`sensorfusion`: Für die Ermittlung von Flughöhe, Orientierung und Position des Quadrocopters ist es notwendig, die Werte von verschiedenen Sensoren in geeigneter Weise zu fusionieren. Hier werden sowohl Komplementär- als auch Kalmanfilter verwendet.
* :ref:`protocols`: Da es notwendig ist, dass verschiedene Systeme unter verschiedenen Programmiersprachen unter Verwendung von Funksystemen mit begrenzter Bandbreite mit der Flugplattform kommunizieren, ist eine Möglichkeit zur einheitlichen Serialisierung und Deserialisierung jener Daten notwendig. Auch das Speichern und Lesen von Daten muss auf verschiedenen Plattformen einheitlich ablaufen. Deshalb wurden verschiedene Bibliotheken, welche diese Anforderungen erfüllen, zusammengetragen, untersucht und verglichen. 

.. [#firemicro] Das Motortreiberboard (*FireMicroControl*) wurde von Johannes Fischer entwickelt 
