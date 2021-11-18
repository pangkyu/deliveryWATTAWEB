-- restaurant table �ʱⵥ����  restaurant(resID:varchar(20), resPW:varchar(20), resName:varchar(20), resAddress:varchar(50), resNumber:varchar(14), deliveryPrice:int, reviewCnt:int, gradeAvg:smallint)


insert into restaurant values('r00001', 'dmdrmqtlf', '���޽� ����������', '��⵵ �Ȼ�� ������ 889-9 101ȣ', '031-415-1117', 3000, 92, 4.9);
insert into restaurant values('r00002', 'bonobono', 'Ŀ����', '��⵵ �Ȼ�� ������ 948-20 103ȣ', '031-406-0625', 2000, 116, 4.8);
insert into restaurant values('r00003', 'ummchicken', '����ġŲ', '��⵵ �Ȼ�� �絿 1284-10', '031-406-9977', 4000, 267, 4.8);
insert into restaurant values('r00004', 'jokbaljjang123', '������ִ�����', '��⵵ �Ȼ�� ������ 871-10 101ȣ', '031-408-5849', 3000, 982, 4.9);
insert into restaurant values('bbqbp', 'bbq1234', '���ť �����߾���', '���� ���ʱ� ����� 73 121ȣ', '050352593180', 2000, 1388, 4.6);
insert into restaurant values('burgerking111', 'bk1111', '����ŷ ���ī����', '���� ���ʱ� ��赿 755-4 ����1��', '02-599-9940', 0, 577, 4.6);
INSERT INTO restaurant values ('EggdropYT', 'Egg123', '���׵�� ���뱸û��', '��⵵ ������ ���뱸 ��ź�� 1276 1��', '031-217-6293', 2000, 274, 4.9);
INSERT INTO restaurant VALUES ('ngnhd', 'pw5678', '������Ȧ�����Ѵ� ȭ����', '���� ������ ȭ� 372-10 1��', '050718661396', 2500, 72, 4.9);
INSERT INTO restaurant VALUES ('jjolsam', 'js1111', '�̸��ִ»�㺻�� ������', '���� ��õ�� ������ 969-12 1�� �Ϻ�', '050718606450', 2000, 2072, 4.8);
INSERT INTO restaurant VALUES ('honbab', 'hb7777', '1�ε��ö�ȥ���� ȭ����', '���� ������ ȭ� 24-90 2�� 1ȣ', '050718656245', 4000, 641, 4.7);


-- food table �ʱⵥ���� food(resID(FK), foodID:varchar(20), foodName:varchar(20), foodCategory:varchar(10), foodPrice:int, cookMinute:int)



insert into food values('r00001', 'f00001', '���޽� ����������', '�н�', 14000,15);
insert into food values('r00001', 'f00002', '��ġ�� �ָԹ�', '�н�', 3000, 10);
insert into food values('r00001', 'f00003', '���޽� �Ҳɴ߹�', '�н�', 16000, 20);
insert into food values('r00001', 'f00004', '���޽� ����������', '�н�', 9000, 15);
insert into food values('r00001', 'f00005', '���޽� ��������', '�н�', 14000, 10);
insert into food values('r00001', 'f00006', '���޽� �ߺ�����', '�н�', 22000, 40);
insert into food values('r00001', 'f00007', '���޽� �ʺ�󶱺���', '�н�', 14000, 20);
insert into food values('r00002', 'f00011', '��ũ�κ���', '����', 5500, 10);
insert into food values('r00002', 'f00012', '�࿧���� ����ũ', '����', 5500, 10);
insert into food values('r00002', 'f00013', 'Ŀ���� ���̽� �Ƹ޸�ī��', '����', 3000, 4);
insert into food values('r00002', 'f00014', '���̽� ī���', '����', 3500, 8);
insert into food values('r00002', 'f00015', '�� ��ȣ�� ũ�� ���', '����', 3500, 10);
insert into food values('r00002', 'f00016', '�÷��ο��Ʈ', '����', 4000, 10);
insert into food values('r00002', 'f00017', '�ڸ����̵�', '����', 4500, 5);
insert into food values('r00002', 'f00018', '�Ѷ�����̵�', '����', 4500, 5);
insert into food values('r00003', 'f00021', '��ȭġŲ��ø', 'ġŲ', 22900, 20);
insert into food values('r00003', 'f00022', '�Ѹ����ݹݹ�', 'ġŲ', 18900, 20);
insert into food values('r00003', 'f00023', '������Ÿ��ƽ', 'ġŲ', 21900, 20);
insert into food values('r00003', 'f00024', '�ޱ׸���Ͼ�ġŲ', 'ġŲ', 18900, 20);
insert into food values('r00003', 'f00025', '��Ͼ��Ĵ�', 'ġŲ', 21900, 20);
insert into food values('r00003', 'f00026', '������ġŲ', 'ġŲ', 21900, 20);
insert into food values('r00003', 'f00027', '��ġ���ȴ�', 'ġŲ', 25900, 20);
insert into food values('r00003', 'f00028', '�Ķ��̵�ġŲ', 'ġŲ', 17000, 20);
insert into food values('r00004', 'f00031', '������Ʈ', '����', 38000, 20);
insert into food values('r00004', 'f00032', '���û��� ���麸�麸��', '����', 35000, 15);
insert into food values('r00004', 'f00033', '�ڳ����� ��ä���߰� ������', '����', 35000, 15);
insert into food values('r00004', 'f00034', '�ݹ�����', '����', 36000, 20);
insert into food values('r00004', 'f00035', '���Ⱑ���� ��ȭ������', '����', 34000, 25);
insert into food values('r00004', 'f00036', '��ϸ�������', '����', 38000, 15);
insert into food values('r00004', 'f00037', '�渶������', '����', 38000, 15);
insert into food values('r00004', 'f00038', '�޴ٸ�����', '����', 38000, 15);
insert into food values('bbqbp', 'bbqbpf1', 'Ȳ�ݿø���', 'ġŲ', 18000, 30);
insert into food values('bbqbp', 'bbqbpf2', '�ڸ���ī��ٸ�����', 'ġŲ', 19500, 40);
insert into food values('bbqbp', 'bbqbpf3', '�����ù��Ͱ���', 'ġŲ', 13900, 25);
insert into food values('burgerking111', 'burgerking111f1', '����Ŀ3���ۼ�Ʈ', '����', 13900, 35);
insert into food values('burgerking111', 'burgerking111f2', '��׽��ӽ�����ۼ�Ʈ', '����', 11100, 30);
insert into food values('burgerking111', 'burgerking111f3', '�ƺ���� ������� ��Ʈ', '����', 8100, 30);
INSERT INTO food values ('EggdropYT', 'EggdropYT1', '�̽��Ϳ���', '�佺Ʈ', 3900, 15);
INSERT INTO food values ('EggdropYT', 'EggdropYT2', '�Ƹ޸�ĭ��ġ��', '�佺Ʈ', 4400, 15);
INSERT INTO food values ('EggdropYT', 'EggdropYT3', '����������ġ��', '�佺Ʈ', 4700, 15);
INSERT INTO food VALUES ('ngnhd', 'ngnhdf1', '�ٺ�ť�Ӵ�', 'ġŲ', 21900, 30);
INSERT INTO food VALUES ('ngnhd', 'ngnhdf2', '�ķ����Ӵ�', 'ġŲ', 21900, 20);
INSERT INTO food VALUES ('ngnhd', 'ngnhdf3', '�Ĵ��Ĵ�', 'ġŲ', 20900, 30);
INSERT INTO food VALUES ('jjolsam', 'jjolsamf1', '���̻�� 1��', '�ѽ�', 14000, 30);
INSERT INTO food VALUES ('jjolsam', 'jjolsamf2', '��â���̻�� 1��', '�ѽ�', 20000, 30);
INSERT INTO food VALUES ('jjolsam', 'jjolsamf3', '��ġ���̻�� 1��', '�ѽ�', 16500, 30);
INSERT INTO food VALUES ('honbab', 'honbabf1', '�����������ġ� 1��', '�ѽ�', 8500, 20);
INSERT INTO food VALUES ('honbab', 'honbabf2', '��ȸ�����', '�ѽ�', 9500, 15);
INSERT INTO food VALUES ('honbab', 'honbabf3', '�����ҹ鵵�ö���Ʈ', '�ѽ�', 16400, 25);

-- customer table �ʱⵥ����

insert into customer values('baesense', '1q2w3e4r!', '�輺��', '��⵵ �Ȼ�� ��ϱ� �ݼ��� 44 �žȾ���Ʈ', '010-4099-8259');
insert into customer values('sin', '0000', '�ŵ���', '����� ���ʱ� �Ź�����32', '010-8909-5786');
INSERT INTO customer values ('ses0609', 'ses0609', '������', '������ ���뱸 ȿ����363 ', '010-3359-7237');
INSERT INTO customer VALUES ('psb0320', 'pw1234', '�ڼ���', '����� ��õ�� �ſ��� 390', '010-4633-0345');



-- demand table �ʱⵥ���� demand(resID, cusID, foodID, orderTime:dateTime, paymentOption:varchar(5), orderCnt:samllint, amount:int, orderStatus:varchar(4), cookStart:dateTime, dc:int, coupon:varchar(10), deliveryOption:varchar(4), deliverMinute:int)


insert into demand values('r00002', 'baesense', 'f00004', '2021-04-24 18:39:20', '������', 1, 4000, '��޿Ϸ�', '2021-04-24 18:46:59', NULL, NULL, '�Ⱦ�', 20);
insert into demand values('r00004', 'baesense', 'f00006', '2021-03-26 12:00:02', '������', 1, 38000, '��޿Ϸ�', '2021-03-26 12:20:44', NULL, NULL, '���', 10);
insert into demand values('bbqbp', 'sin', 'bbqbpf3', '2021-03-08 20:40:32', '������', 1, 18000, '��޿Ϸ�', '2021-03-08 20:46:00', 1000, '����йи�', '���', 20);
insert into demand values('burgerking111', 'sin', 'burgerking111f3', '2021-04-18 12:20:02', '�������', 2, 27800, '��޿Ϸ�', '2021-04-18 12:21:02', NULL, NULL, '���', 10);
INSERT INTO demand values ('EggdropYT', 'ses0609', 'EggdropYT1', '2021-03-27 14:11:00', '������', 1, 6400, '������', NULL, NULL, NULL, NULL, NULL);
INSERT INTO demand values ('EggdropYT', 'ses0609', 'EggdropYT1', '2021-03-27 14:14:00', '������', 2, 11100, '��޿Ϸ�', '2021-04-16 14:44:00', NULL, NULL, '���', 30);
INSERT INTO demand VALUES ('ngnhd', 'psb0320', 'ngnhdf1','2021-04-16 19:14:36', '������', 1, 24400, '��޿Ϸ�', '2021-04-16 19:15:00', NULL, NULL, '���', 30);
INSERT INTO demand VALUES ('jjolsam', 'psb0320', 'jjolsamf2','2020-11-28 17:35:12', '������', 1, 18000, '��޿Ϸ�', '2020-11-28 17:36:00', 2000, NULL, '���', 20);
INSERT INTO demand VALUES ('honbab', 'psb0320','honbabf3', '2020-05-14 10:31:05', '�������', 1, 20400, '��޿Ϸ�', '2020-05-14 10:32:00', NULL, NULL, '���', 30);


-- review table �ʱⵥ���� review(resID, cusID, foodID, orderTime, reviewTime:dateTime, review:varchar(100), grade:samllint)

insert into review values('r00002', 'baesense', 'f00004', '2021-04-24 18:39:20', '2021-04-24 21:30:30', '�縷���� �氡�� ���ƽý��� ���� �þ��ٸ� ��ġ �̰� �������̴ϴ� �Ф�b', 5);
insert into review values('r00004', 'baesense', 'f00006', '2021-03-26 12:00:02', '2021-03-27 00:12:38', '���߶��ܼ� ���ѸԾ��µ� ���⸸�� ���� ������ �������� �����̴ϴ�~',4);
insert into review values('burgerking111', 'sin', 'burgerking111f3', '2021-04-18 12:20:02', '2021-04-18 14:00:02', '��Ƽ�� ���ֳ׿�',5);
insert into review values('EggdropYT', 'ses0609', 'EggdropYT1', '2021-03-27 14:14:00', '2021-04-16 14:57:31', '���ְ� �� �Ծ����ϴ�~!', 5);
INSERT INTO review VALUES( 'honbab', 'psb0320','honbabf3', '2020-05-14 10:31:05', '2020-05-14 19:35:00', '�ϰ� �Խ��ϴ�! ����, ��, �̸� ��ġ��� ���񽺱��� �� ���־��!', 5);
INSERT INTO review VALUES( 'jjolsam', 'psb0320', 'jjolsamf2', '2020-11-28 17:35:12', '2020-11-28 19:35:00', '�ϰ� �Խ��ϴ�! ����, ��, �̸� ��ġ��� ���񽺱��� �� ���־��!', 5);


-- cancel table �ʱⵥ���� cancel(resID, cusID, foodID, orderTime, paymentOption:varchar(5), orderCnt:samllint, amount:int, orderStatus:varchar(4), cookStart:dateTime, dc:int, coupon:varchar(10), deliveryOption:varchar(4), deliverMinute:int, cancelTime:dateTime, reason:varchar(100))

INSERT INTO cancel values ('EggdropYT', 'ses0609', 'EggdropYT1',  '2021-03-27 14:11:00', '������', 1, 6400, '������', NULL, NULL, NULL, NULL, NULL, '2021-03-27 14:12:30', '�� ���׳׿�');