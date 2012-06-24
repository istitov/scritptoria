#!/usr/bin/env python
# -*- coding: utf-8 -*-
#author: Vasiliy Lebedev
#  
import os
import struct
import matplotlib.pyplot


#Превращаем Big-Endian в float
def calc(data_str):
	num = struct.unpack('>d', data_str)
	#print num	
	return num

#Открываем бинарник, загружаем данные, пересчитываем данные, закрываем бинарник. На входе - имя файла без расширения, на выходе - массив данных в формате float
def data_array(file_name):
	full_bin_data = open(file_name + '.DTA', 'rb')
	mag_data = []
	try: #Читаем по SIZE бит, пока читается
		SIZE = 8
		#byte_read = full_bin_data.read(96)		
		byte_read = full_bin_data.read(SIZE)
		while byte_read:
			num = calc(byte_read)
			line = str(num)[:-2]
			line = line[1:]
			#print float(line)		
			mag_data.append(float(line))
			byte_read = full_bin_data.read(SIZE)
			
	finally:
		full_bin_data.close()
	return mag_data

#Открываем файл заголовка, считываем построчно, 17ю-19ю, считываем значения во float, считаем значение поля, выдаём массив
def field(file_name):
	all_text_data = open(file_name + '.DSC')
	all_text = all_text_data.readlines()
	all_text_data.close()
	min_field = float(all_text[18].split('\t')[1])
	max_field = float(all_text[19].split('\t')[1])
	string_number = float(all_text[17].split('\t')[1])
	field_data = []
	i = 0.
	deriv = (max_field - min_field)/(string_number-1)
	print deriv, string_number
	while i < string_number:
		field_data.append(min_field + deriv*i)
		i = i+1
	return field_data

#Собственно обработка данных одного файла. Получаем имя_файла, отправляем его предыдущим модулям, получаем два массива данных.
def main_function(file_name):
	field_array = field(file_name)
	intensity_array = data_array(file_name)
	if len(field_array) <> len(intensity_array): #Если вдруг бинарник кончится раньше, чем надо - длина будет не та, вызываем ошибку. В принципе зная направление поля можно обрезать массив поля и построить кусок спектра, если он вдруг нужен.
		raise NameError, "Lenghs of arrays isn't equal"
	fin_data_file = open(file_name + '_fin.txt', 'w') #Создаём файл с результатами, если был - заменяем без предупреждения!
	fin_data_file.write("Field, Gauss" +'\t'+"Intensity, "+'\n')
	i = 0
	while i<len(field_array):
		fin_data_file.write(str(field_array[i]) +'\t'+str(intensity_array[i])+'\n')
		i = i+1
	fin_data_file.flush() #На всякий случай напрямую объявляем запись данных и закрываем файл
	fin_data_file.close() 
	#Рисуем график. Можно добавить кучу параметров в духе "Сделать красиво", пока так, на посмотреть
	matplotlib.rcParams['figure.figsize'] = (8.0, 6.0)
	matplotlib.pyplot.plot(field_array, intensity_array)
	#matplotlib.pyplot.show() #Показывает интерактивное окошко с графиком. Есть один нюанс - если работать с этим окном, то автосохранение не сработает, сохранять надо вручную из этого окна
	matplotlib.pyplot.savefig(file_name + '.png', format = 'png') #Сохраняет файл. При ручном просмотре-сохранении лучше закомментить
	matplotlib.pyplot.close() #Закрываем модуль. Иначе следующие будут спектры просто накладываться
	
#def start_function():
	
#print data_array('Ni_55Mn_20Sn_25-70K-10')
#print field('Ni_55Mn_20Sn_25-70K-10')
main_function('Ni_55Mn_20Sn_25-70K-10')
