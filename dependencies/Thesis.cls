% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This thesis template is based on:
% - official CTU FIT thesis template
% - https://github.com/hroncok/diplomka
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dependencies/Thesis}[2018/03/12 CTU FIT standard class for theses]

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Thesis type
\newif\if@thesistypedefined

\DeclareOption {thesis=B} { \gdef \@thesistype{B} \@thesistypedefinedtrue }
\DeclareOption {thesis=M} { \gdef \@thesistype{M} \@thesistypedefinedtrue }

% Languages
\newif \if@langdefined
\newif \if@langczech
\newif \if@langslovak

\DeclareOption {czech} {
	\@langczechtrue
	\@langslovakfalse

	\@langdefinedtrue
}

\DeclareOption {slovak} {
	\@langczechfalse
	\@langslovaktrue

	\@langdefinedtrue
}

\DeclareOption {english} {
	\@langczechfalse
	\@langslovakfalse

	\@langdefinedtrue
}

% Font size
\DeclareOption {10pt} { \PassOptionsToClass {\CurrentOption} {memoir} }
\DeclareOption {11pt} { \PassOptionsToClass {\CurrentOption} {memoir} }
\DeclareOption {12pt} { \PassOptionsToClass {\CurrentOption} {memoir} }

\ExecuteOptions{11pt}

\ProcessOptions

\if@langdefined \else
	\ClassError{FITthesis}{Language not specified}{Add option czech for Czech language or option english for English language or option slovak for Slovak language.}
\fi

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Settings
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass [a4paper,twoside] {memoir} [2008/08/07]

\setsecnumdepth {subsubsection}
\chapterstyle {madsen}

\RequirePackage{babel}[2008/07/06]
\RequirePackage[unicode,pdfusetitle]{hyperref}

\RequirePackage{chngcntr}
\counterwithout*{footnote}{chapter}

\RequirePackage{lmodern}


% Listings
\RequirePackage{listings}

\AtBeginDocument{\counterwithin{listing}{chapter}}
\let\Chapter\chapter
\def\chapter{\addtocontents{lol}{\protect\addvspace{10pt}}\Chapter}


\setlrmargins{4cm}{*}{*}\checkandfixthelayout

\RequirePackage{etoolbox}

\AtEndEnvironment{table}{\gdef\there@is@a@table{}}
\AtEndDocument {%
	\ifdefined \there@is@a@table \label{tab:was:used:in:doc} \fi
}
\DeclareRobustCommand{\listoftablescond}{\@ifundefined{r@tab:was:used:in:doc}{}{\listoftables*}}
\RequirePackage{url}

% line breaks in URL
\def \UrlBreaks {\do\/\do\-\do\_}
\emergencystretch=3em

% Line hight
\DisemulatePackage {setspace}
\RequirePackage {setspace}
\setstretch {1.2}

% Paragraphs
\DisemulatePackage {parskip}
\RequirePackage [parfill] {parskip}


% Support for acronyms
\RequirePackage [nopostdot,acronym,nonumberlist,sort=def] {glossaries}

% Define new glossary style for list of acronyms
\newglossarystyle {acronyms} {%
   \glossarystyle {long}  % style that uses longtable
   \renewcommand {\glossarysection}[2][] {}  % disable header
   \renewcommand {\glsgroupskip} {}  % disable grouping

   % Renew the entry field to make the entries bold
   \renewcommand* {\glossaryentryfield}[5] {%
      \bfseries\glsentryitem{##1}\glstarget{##1}{##2} & ##3\glspostdescription\space ##5%
      \tabularnewline
   }
}

% Acromym style
\renewcommand{\acrfullformat}[2]{#2\space(#1)}



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parts
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareRobustCommand {\chapterstyletitle}[1] {
	\@makechapterhead{#1}
	\noindent
}

% Introduction part
\newenvironment {introduction} {
	\setsecnumdepth{part}
}{
	\setsecnumdepth {subsubsection}
}

% Conclusion part
\newenvironment {conclusion} {
	\setsecnumdepth {part}
   \chapter{Závěr}
}{
	\setsecnumdepth {subsubsection}
}

% Literature part
\newenvironment{literature}{
	\setsecnumdepth{part}
   \chapter{Literatura}
}{
	\setsecnumdepth{subsubsection}
}



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@supervisordefined
\DeclareRobustCommand{\supervisor}[1]{
	\def\thesupervisor{#1}
	\@supervisordefinedtrue
}

\newif\if@departmentdefined
\DeclareRobustCommand{\department}[1]{
	\def\thedepartment{#1}
	\@departmentdefinedtrue
}

\newif \if@websitedefined
\DeclareRobustCommand {\website}[1] {
	\def\thewebsite{#1}
	\@websitedefinedtrue
}

\newif\if@acknowledgementsdefined
\DeclareRobustCommand{\acknowledgements}[1]{
	\def\theacknowledgements{#1}
	\@acknowledgementsdefinedtrue
}

\newif\if@abstractxxdefined
\DeclareRobustCommand{\abstractXX}[1]{
	\def\theabstractxx{#1}
	\@abstractxxdefinedtrue
}

\newif\if@abstractendefined
\DeclareRobustCommand{\abstractEN}[1]{
	\def\theabstracten{#1}
	\@abstractendefinedtrue
}

% \newif\if@declarationofauthenticitydefined
% \DeclareRobustCommand{\declarationOfAuthenticity}[1]{
% 	\def\thedeclarationofauthenticity{#1}
% 	\@declarationofauthenticitydefinedtrue
% }

\newif\if@cityfordeclarationdefined
\DeclareRobustCommand{\placeForDeclarationOfAuthenticity}[1]{
	\def\thecityfordeclaration{#1}
	\@cityfordeclarationdefinedtrue
}

\newif\if@keywordsxxdefined
\DeclareRobustCommand{\keywordsXX}[1]{
	\def\thekeywordsxx{#1}
	\@keywordsxxdefinedtrue
}

\newif\if@keywordsendefined
\DeclareRobustCommand{\keywordsEN}[1]{
	\def\thekeywordsen{#1}
	\@keywordsendefinedtrue
}

\newif\if@authorwithdegreesdefined
\DeclareRobustCommand{\authorWithDegrees}[1]{
	\def\theauthorwithdegrees{#1}
	\@authorwithdegreesdefinedtrue
}

\newif\if@authorGNdefined
\DeclareRobustCommand{\authorGN}[1]{
	\def\theauthorGN{#1}
	\@authorGNdefinedtrue
}

\newif\if@authorFNdefined
\DeclareRobustCommand{\authorFN}[1]{
	\def\theauthorFN{#1}
	\@authorFNdefinedtrue
}

\DeclareRobustCommand{\thesistype}{\if@thesistypedefined \if\@thesistype B\if@langczech {Bakalářská práce}\else\if@langslovak {Bakalárska práca}\else {Bachelor's thesis}\fi\fi\else\if\@thesistype M\if@langczech {Diplomová práce}\else\if@langslovak {Diplomová práca}\else {Master's thesis}\fi\fi
		\else
			\ClassError{FITthesis}{Thesis type not specified}{Add option thesis=B for bachelor's thesis or option thesis=M for master's thesis.}
		\fi\fi
	\else
		\ClassError{FITthesis}{Thesis type not specified}{Add option thesis=B for bachelor's thesis or option thesis=M for master's thesis.}
	\fi
}


% Types of licences
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@declarationOptionSelected
\DeclareRobustCommand{\declarationOfAuthenticityOption}[1]{
	\ifx1#1 \DeclareRobustCommand{\thedeclarationofauthenticity}{
		% Minimální
		\if@langczech{
			Prohlašuji, že jsem předloženou práci vypracoval(a) samostatně a že jsem uvedl(a) veškeré použité informační zdroje v~souladu s~Metodickým pokynem o~etické přípravě vysokoškolských závěrečných prací.

			Beru na vědomí, že se na moji práci vztahují práva a povinnosti vyplývající ze zákona č.~121/2000~Sb., autorského zákona, ve znění pozdějších předpisů, zejména skutečnost, že České vysoké učení technické v~Praze má právo na uzavření licenční smlouvy o~užití této práce jako školního díla podle §~60 odst.~1 autorského zákona.
		
		}\else\if@langslovak{
			Prehlasujem, \v ze som predlo\v zen\'u pr\'acu vypracoval(a) samostatne a \v ze som uviedol(uviedla) v\v setky informa\v cn\'e zdroje v~s\'ulade s~Metodick\'ym pokynom o~etickej pr\'iprave vysoko\v skolsk\'ych z\'avere\v cn\'ych pr\'ac.

			Beriem na vedomie, \v ze sa na moju pr\'acu vz\v tahuj\'u pr\'ava a povinnosti vypl\'yvaj\'uce zo~z\'akona \v c.~121/2000~Sb., autorsk\'eho z\'akona, v znen\'\i\ neskor\v s\'\i ch predpisov,  a~skuto\v cnos\v t, \v ze \v Cesk\'e vysok\'e u\v cen\'\i{} technick\'e v~Praze m\'a pr\'avo na uzavrenie licen\v cnej zmluvy o~pou\v zit\'\i\ tejto pr\'ace ako \v skolsk\'eho diela pod\v la \S{}~60 odst.~1 autorsk\'eho z\'akona.

		}\else{
			I hereby declare that the presented thesis is my own work and that I have cited all sources of information in accordance with the Guideline for adhering to ethical principles when elaborating an academic final thesis.
			
			I acknowledge that my thesis is subject to the rights and obligations stipulated by the Act No.~121/2000 Coll., the Copyright Act, as amended, in particular that the Czech Technical University in Prague has the right to conclude a license agreement on the utilization of this thesis as school work under the provisions of Article~60(1) of the Act.

		}\fi\fi
	}\@declarationOptionSelectedtrue\fi
	\ifx2#1 \DeclareRobustCommand{\thedeclarationofauthenticity}{
		% Udělení práv škole
		\if@langczech{
			Prohlašuji, že jsem předloženou práci vypracoval(a) samostatně a že jsem uvedl(a) veškeré použité informační zdroje v~souladu s~Metodickým pokynem o~etické přípravě vysokoškolských závěrečných prací.

			Beru na vědomí, že se na moji práci vztahují práva a povinnosti vyplývající ze zákona č.~121/2000~Sb., autorského zákona, ve znění pozdějších předpisů. V~souladu s~ust. §~46 odst.~6 tohoto zákona tímto uděluji nevýhradní oprávnění (licenci) k~užití této mojí práce, a to včetně všech počítačových programů, jež jsou její součástí či přílohou a veškeré jejich dokumentace (dále souhrnně jen \uv{Dílo}), a to všem osobám, které si přejí Dílo užít. Tyto osoby jsou oprávněny Dílo užít jakýmkoli způsobem, který nesnižuje hodnotu Díla, avšak pouze k~nevýdělečným účelům. Toto oprávnění je časově, teritoriálně i množstevně neomezené.

		}\else\if@langslovak{
			Prehlasujem, \v ze som predlo\v zen\'u pr\'acu vypracoval(a) samostatne a \v ze som uviedol(uviedla) v\v setky informa\v cn\'e zdroje v~s\'ulade s~Metodick\'ym pokynom o~etickej pr\'iprave vysoko\v skolsk\'ych z\'avere\v cn\'ych pr\'ac.

			Beriem na vedomie, \v ze sa na moju pr\'acu vz\v tahuj\'u pr\'ava a povinnosti vypl\'yvaj\'uce zo z\'akona \v c.~121/2000~Sb, autorsk\'eho z\'akona, v znen\'\i\ neskor\v s\'\i ch predpisov. V s\'ulade s ustanoven\'\i m \S{}~46 odst.~6 tohoto z\'akona t\'ymto ude\v lujem bezv\'yhradn\'e opr\'avnenie (licenciu) k~pou\v z\'\i vaniu tejto mojej pr\'ace, a to vr\'atane v\v setk\'ych po\v c\'\i ta\v cov\'ych programov ktor\'e s\'u jej s\'u\v cas\v tou alebo pr\'\i lohou a tie\v z v\v setkej ich dokument\'acie (\v dalej len \uv{Dielo}), a to v\v setk\'ym osob\'am, ktor\'e si praj\'u Dielo pou\v z\'iva\v t. Tieto osoby s\'u opr\'avnen\'e Dielo pou\v z\'\i va\v t ak\'ymko\v lvek sp\^ osobom, ktor\'y nezni\v zuje hodnotu Diela, ale len pre~nez\'arobkov\'e \'u\v cely. Toto opr\'avnenie je \v casovo, \'uzemne a mno\v zstevne ne\-ob\-me\-dze\-n\'e.

		}\else{
			I hereby declare that the presented thesis is my own work and that I have cited all sources of information in accordance with the Guideline for adhering to ethical principles when elaborating an academic final thesis.
			
			I acknowledge that my thesis is subject to the rights and obligations stipulated by the Act No.~121/2000 Coll., the Copyright Act, as amended. In accordance with Article~46(6) of the Act, I hereby grant a nonexclusive authorization (license) to utilize this thesis, including any and all computer programs incorporated therein or attached thereto and all corresponding documentation (hereinafter collectively referred to as the ``Work''), to any and all persons that wish to utilize the Work. Such persons are entitled to use the Work for non-profit purposes only, in any way that does not detract from its value. This authorization is not limited in terms of time, location and quantity.

		}\fi\fi
	}\@declarationOptionSelectedtrue\fi
	\ifx3#1 \DeclareRobustCommand{\thedeclarationofauthenticity}{
		% Licenční smlouva se školou
		\if@langczech{
			Prohlašuji, že jsem předloženou práci vypracoval(a) samostatně a že jsem uvedl(a) veškeré použité informační zdroje v~souladu s~Metodickým pokynem o~etické přípravě vysokoškolských závěrečných prací.
		
			Beru na vědomí, že se na moji práci vztahují práva a povinnosti vyplývající ze zákona č.~121/2000~Sb., autorského zákona, ve znění pozdějších předpisů. Dále prohlašuji, že jsem s~Českým vysokým učením technickým v~Praze uzavřel licenční smlouvu o~užití této práce jako školního díla podle §~60 odst.~1 autorského zákona. Tato skutečnost nemá vliv na ust. §~47b zákona č.~111/1998~Sb., o~vysokých školách, ve znění pozdějších předpisů.

		}\else\if@langslovak{
			Prehlasujem, \v ze som predlo\v zen\'u pr\'acu vypracoval(a) samostatne a \v ze som uviedol(uviedla) v\v setky informa\v cn\'e zdroje v~s\'ulade s~Metodick\'ym pokynom o~etickej pr\'iprave vysoko\v skolsk\'ych z\'avere\v cn\'ych pr\'ac.

			Beriem na vedomie, \v ze sa na moju pr\'acu vz\v tahuj\'u pr\'ava a povinnosti vypl\'yvaj\'uce zo z\'akona \v c.~121/2000~Sb., autorsk\'eho z\'akona, v znen\'\i\ neskor\v s\'\i ch predpisov. \v Dalej prehlasujem, \v ze som s~\v Cesk\'ym vysok\'ym u\v cen\'\i m technick\'ym uzavrel licen\v cn\'u zmluvu o~pou\v zit\'\i\ tejto pr\'ace ako \v skolsk\'eho diela pod\v la \S{}~60 odst.~1 autorsk\'eho z\'akona. T\'ato skuto\v cnos\v t nem\'a vplyv na ust. \S{}~47b z\'akona \v c.~111/1998~Sb. o~vysok\'ych \v skol\'ach.

		}\else{
			I hereby declare that the presented thesis is my own work and that I have cited all sources of information in accordance with the Guideline for adhering to ethical principles when elaborating an academic final thesis.
			
			I acknowledge that my thesis is subject to the rights and obligations stipulated by the Act No.~121/2000 Coll., the Copyright Act, as amended. I further declare that I have concluded a license agreement with the Czech Technical University in Prague on the utilization of this thesis as school work under the provisions of Article~60(1) of the Act. This fact shall not affect the provisions of Article~47b of the Act No.~111/1998 Coll., the Higher Education Act, as amended.

		}\fi\fi
	}\@declarationOptionSelectedtrue\fi
	\ifx4#1 \DeclareRobustCommand{\thedeclarationofauthenticity}{
		% Otevřená licence
		\if@langczech{
			Prohlašuji, že jsem předloženou práci vypracoval samostatně a že jsem uvedl veškeré použité informační zdroje v~souladu s~Metodickým pokynem o~etické přípravě vysokoškolských závěrečných prací.

			Beru na vědomí, že se na moji práci vztahují práva a povinnosti vyplývající ze zákona č.~121/2000~Sb., autorského zákona, ve znění pozdějších předpisů. V~souladu s~ust. §~46 odst.~6 tohoto zákona tímto uděluji nevýhradní oprávnění (licenci) k~užití této mojí práce, a to včetně všech počítačových programů, jež jsou její součástí či přílohou, a veškeré jejich dokumentace (dále souhrnně jen \uv{Dílo}), a to všem osobám, které si přejí Dílo užít. Tyto osoby jsou oprávněny Dílo užít jakýmkoli způsobem, který nesnižuje hodnotu Díla, a za jakýmkoli účelem (včetně užití k~výdělečným účelům). Toto oprávnění je časově, teritoriálně i~množstevně neomezené. Každá osoba, která využije výše uvedenou licenci, se však zavazuje udělit ke každému dílu, které vznikne (byť jen zčásti) na základě Díla, úpravou Díla, spojením Díla s~jiným dílem, zařazením Díla do díla souborného či zpracováním Díla (včetně překladu), licenci alespoň ve výše uvedeném rozsahu a zároveň zpřístupnit zdrojový kód takového díla alespoň srovnatelným způsobem a ve srovnatelném rozsahu, jako je zpřístupněn zdrojový kód Díla.

		}\else\if@langslovak{
			Prehlasujem, \v ze som predlo\v zen\'u pr\'acu vypracoval(a) samostatne a \v ze som uviedol(uviedla) v\v setky informa\v cn\'e zdroje v~s\'ulade s~Metodick\'ym pokynom o~etickej pr\'iprave vysoko\v skolsk\'ych z\'avere\v cn\'ych pr\'ac.

			Beriem na vedomie, \v ze sa na moju pr\'acu vz\v tahuj\'u pr\'ava a povinnosti vypl\'yvaj\'uce zo z\'akona \v c.~121/2000~Sb., autorsk\'eho z\'akona, v znen\'\i\ neskor\v s\'\i ch predpisov.  V~s\'ulade s ustanoven\'\i m \S{}~46 odst.~6 tohoto z\'akona t\'ymto ude\v lujem bezv\'yhradn\'e opr\'avnenie (licenciu) k~u\v z\'\i vaniu tejto mojej pr\'ace, a to vr\'atane v\v setk\'ych po\v c\'\i ta\v cov\'ych programov ktor\'e s\'u jej s\'u\v cas\v tou alebo pr\'\i lohou a tie\v z v\v setkej ich dokument\'acie (\v dalej len \uv{Dielo}), a to v\v setk\'ym osob\'am, ktor\'e si praj\'u Dielo u\v z\'iva\v t. 

			Tieto osoby s\'u opr\'avnen\'e Dielo pou\v z\'\i va\v t ak\'ymko\v lvek sp\^ osobom, ktor\'y nezni\v zuje hodnotu Diela, a za ak\'ymko\v lvek \'u\v celom (vr\'atane komer\v cn\'eho vyu\v zitia). Toto opr\'avnenie je \v casovo, \'uzemne a mno\v zstevne neobmedzen\'e. Ka\v zd\'a osoba, ktor\'a vyu\v zije vy\v s\v sie uveden\'u licenciu, sa v\v sak zav\"azuje priradi\v t ka\v zd\'emu dielu, ktor\'e vznikne (\v co i len \v ciasto\v cne) na z\'aklade Diela, \'upravou Diela, spojen\'\i m Diela s~in\'ym dielom, zaraden\'\i m Diela do diela s\'uborn\'eho \v ci zpracovan\'\i m Diela (vr\'atane prekladu), licenciu aspo\v n vo vy\v s\v sie uvedenom rozsahu a~z\'arove\v n sa zav\"azuje spr\'\i stupni\v t zdrojov\'y k\'od tak\'eho diela aspo\v n zrovnate\v ln\'ym sp\^osobom a v~zrovnate\v lnom rozsahu ako je zpr\'\i stupnen\'y zdrojov\'y k\'od Diela.

		}\else{
			I hereby declare that the presented thesis is my own work and that I have cited all sources of information in accordance with the Guideline for adhering to ethical principles when elaborating an academic final thesis.
			
			I acknowledge that my thesis is subject to the rights and obligations stipulated by the Act No.~121/2000 Coll., the Copyright Act, as amended. In accordance with Article~46(6) of the Act, I hereby grant a nonexclusive authorization (license) to utilize this thesis, including any and all computer programs incorporated therein or attached thereto and all corresponding documentation (hereinafter collectively referred to as the ``Work''), to any and all persons that wish to utilize the Work. Such persons are entitled to use the Work in any way (including for-profit purposes) that does not detract from its value. This authorization is not limited in terms of time, location and quantity. However, all persons that makes use of the above license shall be obliged to grant a license at least in the same scope as defined above with respect to each and every work that is created (wholly or in part) based on the Work, by modifying the Work, by combining the Work with another work, by including the Work in a collection of works or by adapting the Work (including translation), and at the same time make available the source code of such work at least in a way and scope that are comparable to the way and scope in which the source code of the Work is made available.
		}\fi\fi
	}\@declarationOptionSelectedtrue\fi
	\ifx5#1 \DeclareRobustCommand{\thedeclarationofauthenticity}{
		% Oprávnění k užití
		\if@langczech{
			Prohlašuji, že jsem předloženou práci vypracoval(a) samostatně a že jsem uvedl(a) veškeré použité informační zdroje v~souladu s~Metodickým pokynem o~etické přípravě vysokoškolských závěrečných prací.
		
			Beru na vědomí, že se na moji práci vztahují práva a povinnosti vyplývající ze zákona č.~121/2000~Sb., autorského zákona, ve znění pozdějších předpisů. V~souladu s~ust. §~46 odst.~6 tohoto zákona tímto uděluji nevýhradní oprávnění (licenci) k~užití této mojí práce, a to včetně všech počítačových programů, jež jsou její součástí či přílohou a veškeré jejich dokumentace (dále souhrnně jen \uv{Dílo}), a to všem osobám, které si přejí Dílo užít. Tyto osoby jsou oprávněny Dílo užít jakýmkoli způsobem, který nesnižuje hodnotu Díla a za jakýmkoli účelem (včetně užití k~výdělečným účelům). Toto oprávnění je časově, teritoriálně i množstevně neomezené.

		}\else\if@langslovak{
			Prehlasujem, \v ze som predlo\v zen\'u pr\'acu vypracoval(a) samostatne a \v ze som uviedol(uviedla) v\v setky informa\v cn\'e zdroje v~s\'ulade s~Metodick\'ym pokynom o~etickej pr\'iprave vysoko\v skolsk\'ych z\'avere\v cn\'ych pr\'ac.

			Beriem na vedomie, \v ze sa na moju pr\'acu vz\v tahuj\'u pr\'ava a povinnosti vypl\'yvaj\'uce zo z\'akona \v c.~121/2000~Sb., autorsk\'eho z\'akona, v znen\'\i\ neskor\v s\'\i ch predpisov.  V~s\'ulade s ustanoven\'\i m \S{}~46 odst.~6 tohoto z\'akona t\'ymto ude\v lujem bezv\'yhradn\'e opr\'avnenie (licenciu) k~u\v z\'\i vaniu tejto mojej pr\'ace, a to vr\'atane v\v setk\'ych po\v c\'\i ta\v cov\'ych programov ktor\'e s\'u jej s\'u\v cas\v tou alebo pr\'\i lohou a tie\v z v\v setkej ich dokument\'acie (\v dalej len \uv{Dielo}), a to v\v setk\'ym osob\'am, ktor\'e si praj\'u Dielo u\v z\'iva\v t. Tieto osoby s\'u opr\'avnen\'e Dielo pou\v z\'\i va\v t ak\'ymko\v lvek sp\^ osobom, ktor\'y nezni\v zuje hodnotu Diela (vr\'atane komer\v cn\'eho vyu\v zitia). Toto opr\'avnenie je \v casovo, \'uzemne a~mno\v zstevne neobmedzen\'e.

		}\else{
			I hereby declare that the presented thesis is my own work and that I have cited all sources of information in accordance with the Guideline for adhering to ethical principles when elaborating an academic final thesis.
			
			I acknowledge that my thesis is subject to the rights and obligations stipulated by the Act No.~121/2000 Coll., the Copyright Act, as amended. In accordance with Article~46(6) of the Act, I hereby grant a nonexclusive authorization (license) to utilize this thesis, including any and all computer programs incorporated therein or attached thereto and all corresponding documentation (hereinafter collectively referred to as the ``Work''), to any and all persons that wish to utilize the Work. Such persons are entitled to use the Work in any way (including for-profit purposes) that does not detract from its value. This authorization is not limited in terms of time, location and quantity.
		}\fi\fi
	}\@declarationOptionSelectedtrue\fi
	\ifx6#1 \DeclareRobustCommand{\thedeclarationofauthenticity}{
		% Po dohodě s ČVUT
		\if@langczech{
			Prohlašuji, že jsem předloženou práci vypracoval(a) samostatně a že jsem uvedl(a) veškeré použité informační zdroje v~souladu s~Metodickým pokynem o~etické přípravě vysokoškolských závěrečných prací.
		
			Beru na vědomí, že se na moji práci vztahují práva a povinnosti vyplývající ze zákona č.~121/2000~Sb., autorského zákona, ve znění pozdějších předpisů. Dále prohlašuji, že jsem s~Českým vysokým učením technickým v~Praze uzavřel dohodu, na základě níž se ČVUT vzdalo práva na uzavření licenční smlouvy o~užití této práce jako školního díla podle §~60 odst.~1 autorského zákona. Tato skutečnost nemá vliv na ust. §~47b zákona č.~111/1998~Sb., o~vysokých školách, ve znění pozdějších předpisů.

		}\else\if@langslovak{
			Prehlasujem, \v ze som predlo\v zen\'u pr\'acu vypracoval(a) samostatne a \v ze som uviedol(uviedla) v\v setky informa\v cn\'e zdroje v~s\'ulade s~Metodick\'ym pokynom o~etickej pr\'iprave vysoko\v skolsk\'ych z\'avere\v cn\'ych pr\'ac.

			Beriem na vedomie, \v ze sa na moju pr\'acu vz\v tahuj\'u pr\'ava a povinnosti vypl\'yvaj\'uce zo z\'akona \v c.~121/2000~Sb., autorsk\'eho z\'akona, v znen\'\i\ neskor\v s\'\i ch predpisov.  \v Dalej prehlasujem, \v ze som s~\v CVUT uzavrel dohodu, na z\'aklade ktorej sa \v CVUT vzdalo pr\'ava na uzavrenie licen\v cnej zmluvy o~pou\v z\'\i van\'\i\ tejto pr\'ace ako \v skolsk\'eho diela pod\v la \S{}~60 odst.~1 autorsk\'eho z\'akona. T\'ato skuto\v cnos\v t nem\'a vplyv na ust. \S{}~47b z\'akona \v c.~111/1998~Sb. o~vysok\'ych \v skol\'ach.

		}\else{
			I hereby declare that the presented thesis is my own work and that I have cited all sources of information in accordance with the Guideline for adhering to ethical principles when elaborating an academic final thesis.
			
			I acknowledge that my thesis is subject to the rights and obligations stipulated by the Act No.~121/2000 Coll., the Copyright Act, as amended. I further declare that I have concluded an agreement with the Czech Technical University in Prague, on the basis of which the Czech Technical University in Prague has waived its right to conclude a license agreement on the utilization of this thesis as school work under the provisions of Article~60(1) of the Act. This fact shall not affect the provisions of Article~47b of the Act No.~111/1998 Coll., the Higher Education Act, as amended. 
		}\fi\fi
	}\@declarationOptionSelectedtrue\fi
}



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pages
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Title Page
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareRobustCommand{\titlepage}{
	\begin{titlingpage}
		% CTU logotype
		\noindent
			\if@langczech
				\includegraphics[width=0.5\textwidth]{dependencies/CVUTLogo}
			\else
				\includegraphics[width=0.5\textwidth]{dependencies/CVUTLogo-en}
			\fi
		\vfill

		% Thesis type
		{\Large\noindent\thesistype}
		\vspace{1cm}

		% Title
		\if\thetitle\empty
			\ClassError{FITthesis}{Thesis' title unspecified}{Specify title of this thesis using the \protect\title\space command.}
		\else
			\noindent\textbf{\LARGE \begin{flushleft}\thetitle\end{flushleft}}
		\fi
		\vspace{4mm}

		% Author
		\if@authorwithdegreesdefined
			\noindent\textbf{\Large \textit{\theauthorwithdegrees}}
		\else
			\ClassError{FITthesis}{Thesis' author with degrees unspecified}{Specify author of this thesis (i.e. your name \& degrees) using the \protect\theauthorwithdegrees\space command.}
		\fi
		\vfill

		% Department
		\if@departmentdefined {\noindent \thedepartment}\else
			\ClassError{FITthesis}{Department unspecified}{Specify the department using the \department command.}
		\fi

		\vspace{0.1cm}

		% Supervisor
		\noindent
			\if@langczech {Vedoucí práce:}\else\if@langslovak {Vedoucí práce:}\else{Supervisor:}\fi\fi
			\if@supervisordefined {~\thesupervisor}\else
				\ClassError{FITthesis}{Thesis' supervisor unspecified}{Specify the supervisor of this thesis using the \protect\thesupervisor\space command.}
			\fi
		\vspace{1cm}

		% Date
		\noindent\today
	\end{titlingpage}
}


% Acknowledgements Page
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareRobustCommand{\acknowledgementspage}{
	\if@acknowledgementsdefined
		\cleardoublepage
		\thispagestyle{empty}
		
		~
		
		\vfill

		\if@langczech
			\chapterstyletitle{Poděkování}
		\else\if@langslovak
			\chapterstyletitle{Poďakovanie}
		\else
			\chapterstyletitle{Acknowledgements}
		\fi\fi
		\theacknowledgements
	\fi
}


% Declaration Page
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareRobustCommand{\declarationofauthenticitypage}{
	\cleardoublepage
	\thispagestyle{empty}

	~
	
	\vfill
		
	\if@declarationOptionSelected
		\if@langczech
			\chapterstyletitle{Prohlášení}
		\else\if@langslovak
			\chapterstyletitle{Prehlásenie}
		\else
			\chapterstyletitle{Declaration}
		\fi\fi
		\thedeclarationofauthenticity{}
		\vspace{1cm}

		\noindent
			\if@cityfordeclarationdefined
				\if@langczech {}\else\if@langslovak {}\else {In }\fi\fi\thecityfordeclaration{}
				\if@langczech {dne}\else\if@langslovak {}\else {on}\fi\fi~\today \hfill \dots\dots\dots\dots\dots\dots\dots
			\else
				\ClassError{FITthesis}{Místo prohlášení nebylo zadáno}{Nastavte místo, kde bylo podepsáno prohlášení, včetně předložky (např. V~Praze) pomocí příkazu \placeForDeclaration.}
			\fi

	\else
		\ClassError{FITthesis}{Declaration of authenticity unspecified}{Select the declaration of authenticity using the \declarationOfAuthenticityOption command.}
	\fi
}


% Imprint Page
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareRobustCommand{\imprintpage}{
	\clearpage
	\thispagestyle{empty}
	
	~
	
	\vfill
	
	\if@langczech{
		\noindent České vysoké učení technické v~Praze

		\noindent Fakulta informačních technologií
	}
	\else\if@langslovak{
		\noindent České vysoké učení technické v~Praze

		\noindent Fakulta informačních technologií
	}
	\else{
		\noindent Czech Technical University in Prague
		
		\noindent Faculty of Information Technology
	}\fi\fi
	
	\noindent \textcopyright{} \the\year{} \theauthorGN{} \theauthorFN{}.
	\if@langczech
		Všechna práva vyhrazena.
	\else\if@langslovak
		Všetky práva vyhradené.
	\else
		All rights reserved.
	\fi\fi
	
	\if@langczech{
		\noindent \textit{Tato práce vznikla jako školní dílo na Českém vysokém učení technickém v~Praze, Fakultě informačních technologií. Práce je chráněna právními předpisy a mezinárodními úmluvami o~právu autorském a právech souvisejících s~právem autorským. K~jejímu užití, s~výjimkou bezúplatných zákonných licencí, je nezbytný souhlas autora.}}
	\else\if@langslovak{
		\noindent \textit{T\'ato pr\'aca vznikla ako \v skolsk\'e dielo na  FIT \v CVUT v Prahe. Pr\'aca je chr\'anen\'a medzin\'arodn\'ymi predpismi a zmluvami o autorskom pr\'ave a pr\'avach s\'uvisiacich s autorsk\'ym pr\'avom. Na jej vyu\v zitie, s~v\'ynimkou bezplatn\'ych z\'akonn\'ych licenci\'\i, je nutn\'y s\'uhlas autora.}}
	\else{
		\noindent \textit{This thesis is a school work as defined by Copyright Act of the Czech Republic. It has been submitted at Czech Technical University in Prague, Faculty of Information Technology. The thesis is protected by the Copyright Act and its usage without author's permission is prohibited (with exceptions defined by the Copyright Act).}}
	\fi\fi
	
	\if@langczech{
		\subsection*{Odkaz na tuto práci} \MakeUppercase{\theauthorFN{}}, \theauthorGN{}. \textit{\thetitle{}}. \thesistype{}. Praha: České vysoké učení technické v~Praze, Fakulta informačních technologií, \the\year.\if@websitedefined{ Dostupný také z~WWW: $\langle$\url{\thewebsite}$\rangle$.}\fi}
	\else\if@langslovak{
		\subsection{Odkaz na t\'uto pr{\' a}cu} \theauthorFN{}, \theauthorGN{}. \textit{\thetitle{}}. \thesistype{}. Praha: {\v C}esk\'e vysok\'e u\v cen\'\i{} technick\'e v~Praze, Fakulta informa{\v c}n{\' i}ch technologi{\' i}, \the\year.\if@websitedefined{ Dostupn\'y aj z~WWW: $\langle$\url{\thewebsite}$\rangle$.}\fi}
	\else{
		\subsection*{Citation of this thesis} \MakeUppercase{\theauthorFN{}}, \theauthorGN{}. \textit{\thetitle{}}. \thesistype{}. Czech Technical University in Prague, Faculty of Information Technology, \the\year.\if@websitedefined{ Available also from WWW: $\langle$\url{\thewebsite}$\rangle$.}\fi}
	\fi\fi
}


% Abstract Pages
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareRobustCommand{\abstractpage}{%
	\if@abstractxxdefined
		\cleardoublepage
		\thispagestyle{empty}
		~
		\vfill
		\chapterstyletitle{Abstrakt}\theabstractxx
	\else
		\ClassError{FITthesis}{Abstract in Czech unspecified}{Specify abstract in Czech language using the \abstractXX command.}
	\fi
	
	\if@keywordsxxdefined
		\paragraph*{Klíčová slova} \thekeywordsxx{}
	\else
		\ClassError{FITthesis}{Czech keywords unspecified}{Specify the keywords in Czech of your thesis using \keywordsXX command.}
	\fi

	\if@abstractendefined
		\cleardoublepage
		\thispagestyle{empty}
		~
		\vfill
		\chapterstyletitle{Abstract}\theabstracten
	\else
		\ClassError{FITthesis}{Abstract in English unspecified}{Specify abstract in English using the \abstractEN command.}
	\fi
	\if@keywordsendefined%
		\paragraph*{Keywords} \thekeywordsen{}
	\else
		\ClassError{FITthesis}{English keywords unspecified}{Specify the keywords in English of your thesis using \keywordsEN command.}
	\fi

}



% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Structure
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AfterEndPreamble{
	\thispagestyle{empty}
	% Zadání - PDF
	\includepdf[pages={1}]{dependencies/Assignment.pdf}
	
	\frontmatter
	\pagestyle{plain}
	\cleardoublepage
	% 	\setcounter{page}{3}
	\titlepage
	
	\setcounter{page}{3}
	\acknowledgementspage
	
	\declarationofauthenticitypage
	\imprintpage
	
	\abstractpage
	
	\cleardoublepage
	\tableofcontents*
	
	\cleardoublepage
	\renewcommand \listingscaption{Zdrojový kód}
	\renewcommand \listoflistingscaption{Seznam zdrojových kódů}
	\listoflistings

	\cleardoublepage
	\listoffigures*
	
	\cleardoublepage
	\listoftablescond

	\pagestyle{ruled}
	\mainmatter
}