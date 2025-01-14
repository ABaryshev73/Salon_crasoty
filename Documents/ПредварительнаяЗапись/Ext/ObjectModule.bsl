﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ЗаказыКлиентов Приход
	Движения.ЗаказыКлиентов.Записывать = Истина;
	
	Движение = Движения.ЗаказыКлиентов.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.ЗаказКлиента = Ссылка;
	Движение.Период = Дата;
	Движение.Клиент = Клиент;
	Движение.Сумма = Услуги.Итог("Сумма");
	
	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	
	Если ЗначениеЗаполнено(Ссылка) И УслугаОказана = Ложь Тогда 
		ПроверитьОказаниеУслуг();
	КонецЕсли;
	
	ДлительностьУслуги = РассчитатьДатуОкончанияЗаписи();
	
	
   ДатаОкончанияЗаписи = ДатаЗаписи + ДлительностьУслуги * 60;	
КонецПроцедуры 

Процедура ПроверитьОказаниеУслуг()

	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("ДокументОснование", Ссылка);
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	Реализация.Ссылка КАК Ссылка
	|ИЗ
	|	Документ.Реализация КАК Реализация
	|ГДЕ
	|	Реализация.ДокументОснование = &ДокументОснование
	|	И Реализация.Проведен
	|
	|СГРУППИРОВАТЬ ПО
	|	Реализация.Ссылка";
	
	Результат = Запрос.Выполнить();
	
	Если Не Результат.Пустой() Тогда 
		УслугаОказана = Истина;
	КонецЕсли;
	

КонецПроцедуры // ПроверитьОказаниеУслуг()

Функция РассчитатьДатуОкончанияЗаписи()

 ТчУслуги = Услуги.Выгрузить(, "Услуга");
 Запрос = Новый Запрос;
 Запрос.УстановитьПараметр("ТчУслуги", ТчУслуги);
 запрос.Текст = 
 "ВЫБРАТЬ
 |	ТчУслуги.Услуга КАК Услуга
 |ПОМЕСТИТЬ ВТ_Номенклатура
 |ИЗ
 |	&ТчУслуги КАК ТчУслуги
 |;
 |
 |////////////////////////////////////////////////////////////////////////////////
 |ВЫБРАТЬ
 |	СУММА(Номенклатура.ДлительностьУслуги) КАК ДлительностьУслуги
 |ИЗ
 |	Справочник.Номенклатура КАК Номенклатура
 |		ВНУТРЕННЕЕ СОЕДИНЕНИЕ ВТ_Номенклатура КАК ВТ_Номенклатура
 |		ПО Номенклатура.Ссылка = ВТ_Номенклатура.Услуга";
 
 Результат = Запрос.Выполнить();
 
 Если Результат.Пустой() Тогда 
	 Возврат 0;
 КонецЕсли;
 
 Выборка = Запрос.Выполнить().Выбрать();
 Выборка.Следующий();
 Возврат Выборка.ДлительностьУслуги;

КонецФункции // РассчитатьДатуОкончанияЗаписи()

























































