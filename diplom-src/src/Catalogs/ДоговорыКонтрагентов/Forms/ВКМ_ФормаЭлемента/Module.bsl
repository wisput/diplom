#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// ++ Агаев Диплом 15.06.2024
	
	ВКМ_ВывестиЭлементыДляВидаАбонентскаяПлата();
		
	// --
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ВидДоговораПриИзменении(Элемент)
	
	// ++ Агаев Диплом 15.06.2024
	
	ВКМ_УстановитьВидимостьЭлементовВидаАбонентскаяПлата();
		
	// --

КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ВКМ_ВывестиЭлементыДляВидаАбонентскаяПлата()
	
	// ++ Агаев Диплом 15.06.2024
	
	ВидАбоненскоеОбслуживание = Объект.ВидДоговора = Перечисления.ВидыДоговоровКонтрагентов.ВКМ_АбоненскоеОбслуживание;
	
	
	ГруппаПериода = Элементы.Добавить("ГруппаПериода", Тип("ГруппаФормы"), ЭтотОбъект);
	ГруппаПериода.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	ГруппаПериода.ОтображатьЗаголовок = Ложь;
	ГруппаПериода.Видимость = ВидАбоненскоеОбслуживание;
	ГруппаПериода.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяЕслиВозможно;
	ГруппаПериода.Заголовок = "";
	
	РеквизитДатаНачалаДействия = Элементы.Добавить("ДатаНачала", Тип("ПолеФормы"), ГруппаПериода);
	РеквизитДатаНачалаДействия.Вид = ВидПоляФормы.ПолеВвода;
	РеквизитДатаНачалаДействия.ПутьКДанным = "Объект.ВКМ_ДатаНачалаДействия";
	РеквизитДатаНачалаДействия.Заголовок = "Период";
	
	ДекорацияТире = Элементы.Добавить("Тире", Тип("ДекорацияФормы"), ГруппаПериода);
	ДекорацияТире.Вид = ВидДекорацииФормы.Надпись;
	ДекорацияТире.Заголовок = " - ";
	
	РеквизитДатаОкончанияДействия = Элементы.Добавить("ДатаОкончания", Тип("ПолеФормы"), ГруппаПериода);
	РеквизитДатаОкончанияДействия.Вид = ВидПоляФормы.ПолеВвода;
	РеквизитДатаОкончанияДействия.ПутьКДанным = "Объект.ВКМ_ДатаОкончанияДействия";
	РеквизитДатаОкончанияДействия.Заголовок = " ";
	
	РеквизитСумма = Элементы.Добавить("СуммаАбонентскойПланы", Тип("ПолеФормы"), ЭтотОбъект);
	РеквизитСумма.Вид = ВидПоляФормы.ПолеВвода;
	РеквизитСумма.Видимость = ВидАбоненскоеОбслуживание;
	РеквизитСумма.ПутьКДанным = "Объект.ВКМ_СуммаАбонентскойПлаты";
	
	РеквизитСтоимостьЧасаРаботы = Элементы.Добавить("СтоимостьЧасаРаботы", Тип("ПолеФормы"), ЭтотОбъект);
	РеквизитСтоимостьЧасаРаботы.Вид = ВидПоляФормы.ПолеВвода;
	РеквизитСтоимостьЧасаРаботы.Видимость = ВидАбоненскоеОбслуживание;
	РеквизитСтоимостьЧасаРаботы.ПутьКДанным = "Объект.ВКМ_СтоимостьЧасаРаботы";
	
	// --
	
КонецПроцедуры

&НаСервере
Процедура ВКМ_УстановитьВидимостьЭлементовВидаАбонентскаяПлата()
	
	// ++ Агаев Диплом 15.06.2024
	
	ВидАбоненскоеОбслуживание = Объект.ВидДоговора = Перечисления.ВидыДоговоровКонтрагентов.ВКМ_АбоненскоеОбслуживание;
	
	Элементы.ГруппаПериода.Видимость = ВидАбоненскоеОбслуживание;
	Элементы.СуммаАбонентскойПланы.Видимость = ВидАбоненскоеОбслуживание;
	Элементы.СтоимостьЧасаРаботы.Видимость = ВидАбоненскоеОбслуживание;
	
	Если ВидАбоненскоеОбслуживание Тогда
		
		Объект.ВКМ_ДатаНачалаДействия = "";
		Объект.ВКМ_ДатаОкончанияДействия = "";
		Объект.ВКМ_СуммаАбонентскойПлаты = 0;
		Объект.ВКМ_СтоимостьЧасаРаботы = 0;

	КонецЕсли;
	
	// --
	
КонецПроцедуры

#КонецОбласти
