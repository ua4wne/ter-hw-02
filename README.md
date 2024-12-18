## Задача 1

>Ответ: при инициализации проекта в файле main.tf были обнаружены две ошибки: не верно указан параметр platform_id и для выбранного platform_id не верно указан параметр cores

![init](task1/init.png)
![error1](task1/error1.png)
![platforms](task1/platforms.png)
![fix1](task1/fix1.png)
![error2](task1/error2.png)
![fix2](task1/fix2.png)

>После устранения ошибок, код запустился успешно. Подключаемся к консоли ВМ через ssh и выполняем команду  curl ifconfig.me

![apply](task1/apply.png)
![curl](task1/curl.png)
![vm](task1/vm.png)

>На скриншотах видно, что вывод команды curl ifconfig.me соответствует назначенному внешнему ip-адресу.

>Параметр preemptible = true позволяет сделать прерываемую ВМ, а параметр core_fraction=5 определяет долю вычислительного времени физических ядер, которую гарантирует vCPU. В данном случае она составит 5%. Установка таких параметров влияет на конечную стоимость ВМ делая ее минимальной.

## Задача 2

>Заменяем все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. Объявляем их в файле variables.tf

![var1](task2/var1.png)
![var2](task2/var2.png)

>После вносим необходимые изменения в файл main.tf

![result](task2/result.png)

>Проверяем terraform plan. Изменений нет.

![plan](task2/plan.png)

## Задача 3

>Создаем файл vms_platform.tf. Переносим в него все переменные первой ВМ и добавляем вторую ВМ. Запускаем terraform apply.

![apply](task3/apply.png)

>Смотрим результат выполнения

![vms](task3/vms.png)

## Задача 4

>Объявляем в файле outputs.tf один output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном формате.(без хардкода!!!). Запускаем terraform apply. Вывод команды terraform output

![outputs](task4/outputs.png)

## Задача 5

>В файле locals.tf описываем в одном local-блоке имя каждой ВМ, используя интерполяцию ${..} с НЕСКОЛЬКИМИ переменными.

![locals1](task5/locals1.png)

>Заменяем переменные внутри ресурса ВМ на созданные нами local-переменные.

![locals2](task5/locals2.png)
![locals3](task5/locals3.png)

>Применяем изменения.

![apply](task5/apply.png)

## Задача 6

>Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объединяем их в две map-переменные (по одной на ресурс).

![obj1](task6/obj1.png)
![obj2](task6/obj2.png)

>Создадим отдельную общую map(object) переменную для блока metadata для всех ВМ. Также комментируем все более не используемые переменные проекта.

![meta](task6/meta.png)

>Проверяем terraform plan. Изменений ожидаемо нет.

![plan](task6/plan.png)

## Задача 7*

1. Напишите, какой командой можно отобразить второй элемент списка test_list.
>Ответ: команда local.test_list[1]

![cmd1](task7/1.png)

2. Найдите длину списка test_list с помощью функции length(<имя переменной>).

>Ответ: команда length(local.test_list)

![cmd2](task7/2.png)

3. Напишите, какой командой можно отобразить значение ключа admin из map test_map.

>Ответ: команда local.test_map.admin

![cmd3](task7/3.png)

4. Напишите interpolation-выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.

>Ответ: выражение "${local.test_map.admin} is admin for ${local.test_list[2]} server based on OS ${local.servers.production.image} with ${local.servers.production.cpu} vcpu, ${local.servers.production.ram} ram and ${length(local.servers.production.disks)} virtual disks"

![cmd4](task7/4.png)

## Задача 8*

1. Напишите и проверьте переменную test и полное описание ее type в соответствии со значением из terraform.tfvars:

![type](task8/type.png)

2. Напишите выражение в terraform console, которое позволит вычленить строку "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117" из этой переменной.
>Ответ: выражение var.test[0].dev1[0]

![code](task8/code.png)

## Задача 9*
