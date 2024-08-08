﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Не ЗначениеЗаполнено(Объект.Ответственный) Тогда 
		Объект.Ответственный = ПараметрыСеанса.ТекущийПользователь;
	КонецЕсли;
	
КонецПроцедуры


&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	СтрокаТЧ = Элементы.Услуги.ТекущиеДанные;
	РаботаСТабличнымичастями.ПересчитатьСуммуВСтрокеТабЧасти(СтрокаТЧ);
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	СтрокаТЧ = Элементы.Услуги.ТекущиеДанные;
	РаботаСТабличнымичастями.ПересчитатьСуммуВСтрокеТабЧасти(СтрокаТЧ);
КонецПроцедуры

&НаКлиенте
Процедура УслугиУслугаПриИзменении(Элемент)
	СтрокаТч = Элементы.Услуги.ТекущиеДанные;
	СтрокаТч.Количество = 1;
	Если ЗначениеЗаполнено(СтрокаТч.Услуга) Тогда 
		СтрокаТч.Цена = РаботаСЦенами.ПолучитьЦенуПродажиНаДату(СтрокаТч.Услуга, Объект.Дата);
	Иначе
		СтрокаТч.Цена = 0;
	КонецЕсли;
	РаботаСТабличнымичастями.ПересчитатьСуммуВСтрокеТабЧасти(СтрокаТЧ);
КонецПроцедуры
