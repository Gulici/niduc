Jak chcę podzielić układ całego dokumentu?

# Wstęp
### Wprowadzenie
Opis dziedziny, motywacja do podjęcia pracy.  
Czym jest ten temat?
- dziedzina - czyli o czym traktuje praca, tutaj coś w stylu inżynierii oprogramowania, algorytmów itp.
- Trasowanie pogodowe wydaje się być prężnie rozwijaną dziedziną, powstaje dużo prac naukowych na ten temat, próbujących opracować nowe metody wyznaczania optymalnych tras. Tutaj trzeba zaznaczyć że większość dotyczy optymalizacji tras łodzi z napędem motorowym. Powodowane jest to najpewniej próbą opracowania algorytmów mających zastosowanie w transporcie. Dobrze zaplanowana trasa może nie tylko skrócić czas podróży, ale wykorzystując zjawiska pogodowe takie jak kierunek i siła wiatru oraz pływy morskie, zmniejszyć zużycie paliwa potrzebnego do odbycia podróży. Kolejnym ważnym aspektem jest przewidywanie zagrożeń i poprawę komfortu podróży. Trasa opracowana na podstawie rzeczywistej progonozy pogody może posłużyć do omijania ekstremalnych warunków możliwych do spotkania na morzu.

#### Dlaczego tworzyć algorytm trasujący dla jachtów? 
- Jeśli chodzi o obliczanie tras dla jachtów żaglowych, jest to zagadnienie jeszcze ważniejsze. Napęd żaglowy w pełni opiera się na warunkach wiatrowych. Do tego stopnia, że kurs który mogą obierać żaglówki jest w pełni uzależniony od kierunku i siły wiatru. Źle zaplanowana trasa może doprowadzić do sytuacji, gdy w skrajnym przypadku, nie będziemy w stanie dotrzeć do celu, albo będziemy musieli zrzucić żagle i płynąć na silniku.

### Cel i zakres pracy
    Opis celu i zadań do wykonania
### Układ pracy
    Opis kolejnych rozdziałów.

# Teoria

# Projekt

# Algorytm trasujący

# Podsumowanie


# Źródła

## Aplikacje
- https://www.sailrouting.com - webowa aplikacja pozwalająca wyznaczyć krótkie trasy, do 200 NM w lini prostej, algorytm bazuje na A*, darmowe demo nie pozwalające na wybór parametrów. Podobnie jak mój prototyp bazuje na prognozie ECMWF o rozdzielczości 0,25 stopnia. Prognoza jest dosyć wolna, trzeba czekać około minuty na wynik.
- https://fastseas.com - webowa aplikacja, wersja darmowa pozwala na 5 zapytań miesięcznie, ładny interfejs rysujący trasę na mapie z serwisu windy.com z narysowanym wiatrem. Najprawdopodobniej korzysta z API ww. serwisu do uzyskiwania danych pogodowych. Nieznany używany algorytm. Pozwala na tworzenie własnych diagramów polarnych, ustawianie parametrów komfortu takich jak maksymalny wiatr z rufy czy dziobu oraz szkwałów. Z przekazanych danych można wnioskować że trasa generowana jest z 1h krokiem, więc prawdopodobnie jest to algortym bazujący na isochronach. Aby korzystać z serwisu należy utworzyć konto. Generowanie własnych diagramów na podstawie dwóch parametrów długości łodzi oraz minimalnego kąta względem wiatru, następnie dla kątów BTA, 90, 135 i 180 pozwala na korekcje. Można wyeksportować trasę w formacie KMZ, KML, GPX, czy CSV.
- https://www.predictwind.com - aplikacja mobilna na iOS i Android, wykonana bardzo profesjonalnie, płatna - w zależności od pakietu nawet 400 pln miesięcznie. Większość funkcji za paywallem. Rysowana na mapie wyglądającej bardzo podobnie do tej z windy.com. W darmowej wersji pozwala jedynie oglądać prognozy.
- https://www.sailgrib.com - serwis oferujący kilka aplikacji, w tym SailGribWR o funkcji trasowania pogodowego. W wersji darmowej pozwala na wyznaczanie tras na krótkich dystansach 50 NM, o rozdzielczości prognozy 0.5 stopnia na maksymalnie 48h do przodu. Po przekazanych zrzutach ekranu widać że algorytm bazuje na metodzie isochron. Aplikacja dostępna jedynie na urządzenia z systemem Android. 

### Prace/artykuły naukowe
- The physics of sailing - Bryon D. Anderson - https://pubs.aip.org/physicstoday/article/61/2/38/413188/The-physics-of-sailingSails-and-keels-like - artykuł naukowy omawiający kluczowe zjawiska fizyczne związane z żeglowaniem. Dla mnie kluczowe jest to w jaki sposób przewidywać prędkość jachtu. Znajdujemy w nim informacje o używaniu diagramów polarnych do przedstawienia prędkości łodzi w zależności od kursu względem wiatru i jego prędkości.
- Ship weather routing: A taxonomy and survey - Zis, Thalis P.V.; Psaraftis, Harilaos N.; Ding, Li - źródło https://orbit.dtu.dk/en/publications/ship-weather-routing-a-taxonomy-and-survey - praca przeglądowa na temat trasowania pogodowego i optymalizacji transportu morskiego.
- Modeling and Optimization Algorithms in Ship Weather Routing - https://www.sciencedirect.com/science/article/pii/S2405535216300043 - przeglądowy artykuł przedstawiający różne algorytmy i podejścia do tematu wyznaczania tras 
- METHOD OF ROUTING SHIPS SAILING IN DEDICATED ENVIRONMENT - Marcin Życzkowski - https://mostwiedzy.pl/pl/publication/method-of-routing-ships-sailing-in-dedicated-environment,142596-1 - artykuł, autor proponuje algorytm wyznaczania suboptymalnych pod kątem czasu podróży, ale dążący jednoczennie do minimalnej ilości zmian kierunku, bazujący na dyskretyzacji przestrzeni do siatki i algorytmie Dijkstry. Zdecydowaną wadą jest ograniczenie możliwych kierunków które może obrać jacht. 
- EVOLUTIONARY MULTI–OBJECTIVE WEATHER ROUTING OF SAILBOATS, Sobecka E., Szłapczyński R., Życzkowski M. - dostęp https://journal.mostwiedzy.pl/pmr/article/view/267 - przykład całkiem nowej pracy na temat trasowania pogodowego. Autorzy badają możliwości implementacji algorytów genetycznych do obliczania tras dla łodzi żaglowych. Skupiają się na opracowaniu metody nie tyle optymalnej pod względem czasu podróży, a również komfortu i bezpieczeństwa załogi. Algorytm dąży do minimum czasu, wymaganych zmian kursu oraz średniego przechyłu jachtu.
- A new method for searching optimal path on a raster plane including cost of direction changes - R. Szłapczyński, dostęp https://journal.mostwiedzy.pl/pmr/article/view/1332 - autor opracował ulepszenie generowania najkrótszej trasy bazującej na algorytmie Lee. Skupił się na rozszerzeniu generowania trasy o dodatkowy koszt wykonywania zmiany kierunku. Dzięki temu trasa dąży do minimum odległości przy wykonaniu jak najmniejszej liczby zwrotów. Opracowany algorytm jednak opiera się na przestrzeni podzielonej na siatkę, co może się nadawać dla napędu motorowego, jednak nie dla żaglowego.
- Weather routing of (sail-assisted) motor vessels - H. Hagiwara, https://repository.tudelft.nl/record/uuid:a6112879-4298-40a6-91c7-d9a431a674c7 - dosyć stara, obszerna praca na temat trasowania pogodowego, jednak w ciągu dalszym cytowana. Traktuje o metodzie isochron, a dokładnie jej ulepszonej przez autora wersji pod kątem szukania tras optymalnych pod względem zużycia paliwa.
- ADOPTED ISOCHRONE METHOD IMPROVING SHIP SAFETY IN WEATHER ROUTING WITH EVOLUTIONARY APPROACH - https://www.researchgate.net/publication/238194267_ADOPTED_ISOCHRONE_METHOD_IMPROVING_SHIP_SAFETY_IN_WEATHER_ROUTING_WITH_EVOLUTIONARY_APPROACH - Szłapczyńska Joanna
Śmierzchalski Roman - artykuł z 2007, traktuje o problemach z klasycznym podejsciem do metody isochron zaproponowanej przez R.W. James'a i ulepszonej przez Hagiware. Metoda Jamesa, której zamysłem było ręczne rozwiązywanie graficzne, była zbyt ciężka obliczeniowo i pamięciowo dla ówczesnych komputerów, natomiast ulepszona, działała jedynie przy założeniu że w badanym obszarze nie występują lądy. Autorzy proponują rozwiązanie detekcji kolizji z lądem, jednak obliczenia wektorowe, a konkretnie sprawdzania przecięcia linii były zbyt skomplikowane. Dlatego decydują się na przedstawienie obszaru w postaci bitmapy, gdzie sprawdzenie czy dana komórka zawiera ląd wymaga O(1) złożoności czasowej. Opisują dwa algorytmy, jeden do sprawdzania przecięcia z lądem dla prostej, oraz drugi do wyznaczenia pierwszego miejsca przecięcia.

### Źródła internetowe
- https://en.wikipedia.org/wiki/Polar_diagram_(sailing) - artykuł o diagramach polarnych, dowiadujemy się z niego o tym, że diagramy polarne opisują specyficzne łodzie, oraz są tworzone przez projektantów lub przez specjalistyczne programy przewidujące prędkość jachtu.
- https://jieter.github.io/orc-data/site/ - baza danych obejmująca diagramy polarne certyfikowanych łodzi przez ORC (Offshore Racing Congress)


wymagania funkcjonalne:

- system zawiera serwis sluzacy do planowania tras zeglarskich metoda izochron
- system dostarcza uzytkownikowi webowy interfejs
- webowy interfejs dostarcza interaktywna mape, na ktorej uzytkownik moze zaznaczac punkt startowy i docelowy
- na interaktwnej mapie rysowana jest wygenerowana trasa, oraz jest mozliwosc wyswietlenia wygenerowanych izochron
- serwis planujacy przyjmuje dane wejsciowe w formacie diagramow polarnych, punktow start i goal, umozliwia przekazanie parametru wplywajacego na koszt wykonania zwrotu, czy maksymalnej dopuszczalnej predkosci wiatru
- uzytkownik za pomoca interfejsu moze wybierac jachty opisane diagramami polarnymi, lub dodac wlasną, ktora zostanie zapisana w bazie danych
- system pobiera dane pogodowe z api emcwf, dba o aktualizacje prognozy pogody, pobierajac nowe pliki grib
- serwis pogodowy przygotowuje dane dla wskazanego obszaru i przekazuje je do serwisu planujacego
- serwis pogodowy cache'uje gotowe dane dla obszarow, na potrzeby kolejnych kalkulacji
- system posiada baze danych, ktora przechwuje dane uzytkownikow i jachtow.
- interfejs po obliczeniach trasy, wyswietla jej statystyki w formie tabelarycznej, podsumowujace kluczowe informacje, takie jak predkosc wiatru w danym odcinku, czasy znajdowania sie w danym miejscu, pokonywane dystanse, predkosc lodzi, rzeczywisty kierunek wiatru, kierunek kursu, kierunek wiatru wzgledem kursu
 