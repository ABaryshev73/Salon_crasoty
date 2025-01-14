﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Не ЗначениеЗаполнено(Объект.Ответственный) Тогда 
		Объект.Ответственный = ПараметрыСеанса.ТекущийПользователь;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");	
	
КонецПроцедуры // РассчитатьСуммуДокумента()




&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)	
	СтрокаТЧ = Элементы.Товары.ТекущиеДанные;
	РаботаСТабличнымичастями.ПересчитатьСуммуВСтрокеТабЧасти(СтрокаТч);
	РассчитатьСуммуДокумента();	
КонецПроцедуры


&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)	
	СтрокаТЧ = Элементы.Товары.ТекущиеДанные;
	РаботаСТабличнымичастями.ПересчитатьСуммуВСтрокеТабЧасти(СтрокаТч);
	РассчитатьСуммуДокумента();	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	СтрокаТЧ = Элементы.Услуги.ТекущиеДанные;
	РаботаСТабличнымичастями.ПересчитатьСуммуВСтрокеТабЧасти(СтрокаТч);
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	СтрокаТЧ = Элементы.Услуги.ТекущиеДанные;
	РаботаСТабличнымичастями.ПересчитатьСуммуВСтрокеТабЧасти(СтрокаТч);
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура УслугиУслугаПриИзменении(Элемент)
	СтрокаТч = Элементы.Услуги.ТекущиеДанные;
	СтрокаТч.Количество = 1;
	Если ЗначениеЗаполнено(СтрокаТч.Услуга) Тогда 
		СтрокаТч.СтатьяЗатрат = ПолучитьСтатьюЗатрат(СтрокаТч.Услуга);
	КонецЕсли;
	РассчитатьСуммуДокумента();
	
КонецПроцедуры


&НаСервереБезКонтекста
Функция ПолучитьСтатьюЗатрат(Номенклатура)

	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	Номенклатура.СтатьяЗатрат КАК СтатьяЗатрат
	|ИЗ
	|	Справочник.Номенклатура КАК Номенклатура
	|ГДЕ
	|	Номенклатура.Ссылка = &Ссылка";
	Запрос.УстановитьПараметр("Ссылка", Номенклатура);
	Выборка = Запрос.Выполнить().Выбрать();
	Выборка.Следующий();
	Возврат Выборка.СтатьяЗатрат;

КонецФункции // ПолучитьСтатьюЗатрат()

&НаКлиенте
Процедура ТоварыНоменклатураПриИзменении(Элемент)
	СтрокаТч = Элементы.Товары.ТекущиеДанные;
	СтрокаТч.Количество = 1;
КонецПроцедуры














































