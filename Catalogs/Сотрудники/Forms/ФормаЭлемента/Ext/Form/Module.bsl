﻿
&НаКлиенте
Процедура СформироватьФИО()

	Объект.Наименование = Объект.Фамилия + " " + Объект.Имя + " " + Объект.Отчество;

КонецПроцедуры // СформироватьФИО()

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	СформироватьФИО();
КонецПроцедуры

&НаКлиенте
Процедура ФамилияПриИзменении(Элемент)
	СформироватьФИО();
КонецПроцедуры

&НаКлиенте
Процедура ИмяПриИзменении(Элемент)
	СформироватьФИО();
КонецПроцедуры  

&НаКлиенте
Процедура ОтчествоПриИзменении(Элемент)
	СформироватьФИО();
КонецПроцедуры




