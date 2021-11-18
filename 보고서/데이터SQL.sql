-- restaurant table 초기데이터  restaurant(resID:varchar(20), resPW:varchar(20), resName:varchar(20), resAddress:varchar(50), resNumber:varchar(14), deliveryPrice:int, reviewCnt:int, gradeAvg:smallint)


insert into restaurant values('r00001', 'dmdrmqtlf', '응급실 국물떡볶이', '경기도 안산시 본오동 889-9 101호', '031-415-1117', 3000, 92, 4.9);
insert into restaurant values('r00002', 'bonobono', '커피쿡', '경기도 안산시 본오동 948-20 103호', '031-406-0625', 2000, 116, 4.8);
insert into restaurant values('r00003', 'ummchicken', '투존치킨', '경기도 안산시 사동 1284-10', '031-406-9977', 4000, 267, 4.8);
insert into restaurant values('r00004', 'jokbaljjang123', '가장맛있는족발', '경기도 안산시 본오동 871-10 101호', '031-408-5849', 3000, 982, 4.9);
insert into restaurant values('bbqbp', 'bbq1234', '비비큐 반포중앙점', '서울 서초구 잠원동 73 121호', '050352593180', 2000, 1388, 4.6);
insert into restaurant values('burgerking111', 'bk1111', '버거킹 방배카페골목', '서울 서초구 방배동 755-4 지하1층', '02-599-9940', 0, 577, 4.6);
INSERT INTO restaurant values ('EggdropYT', 'Egg123', '에그드랍 영통구청점', '경기도 수원시 영통구 매탄동 1276 1층', '031-217-6293', 2000, 274, 4.9);
INSERT INTO restaurant VALUES ('ngnhd', 'pw5678', '누구나홀딱반한닭 화곡점', '서울 강서구 화곡동 372-10 1층', '050718661396', 2500, 72, 4.9);
INSERT INTO restaurant VALUES ('jjolsam', 'js1111', '쫄면주는삼겹본능 신정점', '서울 양천구 신정동 969-12 1층 일부', '050718606450', 2000, 2072, 4.8);
INSERT INTO restaurant VALUES ('honbab', 'hb7777', '1인도시락혼밥대왕 화곡점', '서울 강서구 화곡동 24-90 2층 1호', '050718656245', 4000, 641, 4.7);


-- food table 초기데이터 food(resID(FK), foodID:varchar(20), foodName:varchar(20), foodCategory:varchar(10), foodPrice:int, cookMinute:int)



insert into food values('r00001', 'f00001', '응급실 국물떡볶이', '분식', 14000,15);
insert into food values('r00001', 'f00002', '날치알 주먹밥', '분식', 3000, 10);
insert into food values('r00001', 'f00003', '응급실 불꽃닭발', '분식', 16000, 20);
insert into food values('r00001', 'f00004', '응급실 로제떡볶이', '분식', 9000, 15);
insert into food values('r00001', 'f00005', '응급실 국물오뎅', '분식', 14000, 10);
insert into food values('r00001', 'f00006', '응급실 닭볶음탕', '분식', 22000, 40);
insert into food values('r00001', 'f00007', '응급실 맵블라떡볶이', '분식', 14000, 20);
insert into food values('r00002', 'f00011', '슈크로베리', '음료', 5500, 10);
insert into food values('r00002', 'f00012', '듀엣베리 쉐이크', '음료', 5500, 10);
insert into food values('r00002', 'f00013', '커피쿡 아이스 아메리카노', '음료', 3000, 4);
insert into food values('r00002', 'f00014', '아이스 카페라떼', '음료', 3500, 8);
insert into food values('r00002', 'f00015', '핫 단호박 크림 라뗴', '음료', 3500, 10);
insert into food values('r00002', 'f00016', '플레인요거트', '음료', 4000, 10);
insert into food values('r00002', 'f00017', '자몽에이드', '음료', 4500, 5);
insert into food values('r00002', 'f00018', '한라봉에이드', '음료', 4500, 5);
insert into food values('r00003', 'f00021', '중화치킨대첩', '치킨', 22900, 20);
insert into food values('r00003', 'f00022', '한마리반반반', '치킨', 18900, 20);
insert into food values('r00003', 'f00023', '순살판타스틱', '치킨', 21900, 20);
insert into food values('r00003', 'f00024', '앵그리어니언치킨', '치킨', 18900, 20);
insert into food values('r00003', 'f00025', '어니언파닭', '치킨', 21900, 20);
insert into food values('r00003', 'f00026', '눈코찡치킨', '치킨', 21900, 20);
insert into food values('r00003', 'f00027', '미치고팔닭', '치킨', 25900, 20);
insert into food values('r00003', 'f00028', '후라이드치킨', '치킨', 17000, 20);
insert into food values('r00004', 'f00031', '보족세트', '족발', 38000, 20);
insert into food values('r00004', 'f00032', '오늘삶은 보들보들보쌈', '족발', 35000, 15);
insert into food values('r00004', 'f00033', '코끝톡쏘는 냉채족발과 막국수', '족발', 35000, 15);
insert into food values('r00004', 'f00034', '반반족발', '족발', 36000, 20);
insert into food values('r00004', 'f00035', '불향가득한 직화불족발', '족발', 34000, 25);
insert into food values('r00004', 'f00036', '허니마늘족발', '족발', 38000, 15);
insert into food values('r00004', 'f00037', '흑마늘족발', '족발', 38000, 15);
insert into food values('r00004', 'f00038', '뒷다리족발', '족발', 38000, 15);
insert into food values('bbqbp', 'bbqbpf1', '황금올리브', '치킨', 18000, 30);
insert into food values('bbqbp', 'bbqbpf2', '자메이카통다리구이', '치킨', 19500, 40);
insert into food values('bbqbp', 'bbqbpf3', '메이플버터갈릭', '치킨', 13900, 25);
insert into food values('burgerking111', 'burgerking111f1', '스태커3와퍼세트', '버거', 13900, 35);
insert into food values('burgerking111', 'burgerking111f2', '기네스머쉬룸와퍼세트', '버거', 11100, 30);
insert into food values('burgerking111', 'burgerking111f3', '아빠상어 세우버거 세트', '버거', 8100, 30);
INSERT INTO food values ('EggdropYT', 'EggdropYT1', '미스터에그', '토스트', 3900, 15);
INSERT INTO food values ('EggdropYT', 'EggdropYT2', '아메리칸햄치즈', '토스트', 4400, 15);
INSERT INTO food values ('EggdropYT', 'EggdropYT3', '베이컨더블치즈', '토스트', 4700, 15);
INSERT INTO food VALUES ('ngnhd', 'ngnhdf1', '바베큐쌈닭', '치킨', 21900, 30);
INSERT INTO food VALUES ('ngnhd', 'ngnhdf2', '후레쉬쌈닭', '치킨', 21900, 20);
INSERT INTO food VALUES ('ngnhd', 'ngnhdf3', '파닥파닭', '치킨', 20900, 30);
INSERT INTO food VALUES ('jjolsam', 'jjolsamf1', '구이삼겹 1인', '한식', 14000, 30);
INSERT INTO food VALUES ('jjolsam', 'jjolsamf2', '대창구이삽겹 1인', '한식', 20000, 30);
INSERT INTO food VALUES ('jjolsam', 'jjolsamf3', '김치구이삼겹 1인', '한식', 16500, 30);
INSERT INTO food VALUES ('honbab', 'honbabf1', '제주흑돼지김치찌개 1인', '한식', 8500, 20);
INSERT INTO food VALUES ('honbab', 'honbabf2', '육회비빔밥', '한식', 9500, 15);
INSERT INTO food VALUES ('honbab', 'honbabf3', '돼지불백도시락세트', '한식', 16400, 25);

-- customer table 초기데이터

insert into customer values('baesense', '1q2w3e4r!', '배성규', '경기도 안산시 상록구 반석로 44 신안아파트', '010-4099-8259');
insert into customer values('sin', '0000', '신동현', '서울시 서초구 신반포로32', '010-8909-5786');
INSERT INTO customer values ('ses0609', 'ses0609', '송은석', '수원시 영통구 효원로363 ', '010-3359-7237');
INSERT INTO customer VALUES ('psb0320', 'pw1234', '박수빈', '서울시 양천구 신월로 390', '010-4633-0345');



-- demand table 초기데이터 demand(resID, cusID, foodID, orderTime:dateTime, paymentOption:varchar(5), orderCnt:samllint, amount:int, orderStatus:varchar(4), cookStart:dateTime, dc:int, coupon:varchar(10), deliveryOption:varchar(4), deliverMinute:int)


insert into demand values('r00002', 'baesense', 'f00004', '2021-04-24 18:39:20', '선결제', 1, 4000, '배달완료', '2021-04-24 18:46:59', NULL, NULL, '픽업', 20);
insert into demand values('r00004', 'baesense', 'f00006', '2021-03-26 12:00:02', '선결제', 1, 38000, '배달완료', '2021-03-26 12:20:44', NULL, NULL, '배달', 10);
insert into demand values('bbqbp', 'sin', 'bbqbpf3', '2021-03-08 20:40:32', '선결제', 1, 18000, '배달완료', '2021-03-08 20:46:00', 1000, '요기패밀리', '배달', 20);
insert into demand values('burgerking111', 'sin', 'burgerking111f3', '2021-04-18 12:20:02', '현장결제', 2, 27800, '배달완료', '2021-04-18 12:21:02', NULL, NULL, '배달', 10);
INSERT INTO demand values ('EggdropYT', 'ses0609', 'EggdropYT1', '2021-03-27 14:11:00', '선결제', 1, 6400, '배달취소', NULL, NULL, NULL, NULL, NULL);
INSERT INTO demand values ('EggdropYT', 'ses0609', 'EggdropYT1', '2021-03-27 14:14:00', '선결제', 2, 11100, '배달완료', '2021-04-16 14:44:00', NULL, NULL, '배달', 30);
INSERT INTO demand VALUES ('ngnhd', 'psb0320', 'ngnhdf1','2021-04-16 19:14:36', '선결제', 1, 24400, '배달완료', '2021-04-16 19:15:00', NULL, NULL, '배달', 30);
INSERT INTO demand VALUES ('jjolsam', 'psb0320', 'jjolsamf2','2020-11-28 17:35:12', '선결제', 1, 18000, '배달완료', '2020-11-28 17:36:00', 2000, NULL, '배달', 20);
INSERT INTO demand VALUES ('honbab', 'psb0320','honbabf3', '2020-05-14 10:31:05', '현장결제', 1, 20400, '배달완료', '2020-05-14 10:32:00', NULL, NULL, '배달', 30);


-- review table 초기데이터 review(resID, cusID, foodID, orderTime, reviewTime:dateTime, review:varchar(100), grade:samllint)

insert into review values('r00002', 'baesense', 'f00004', '2021-04-24 18:39:20', '2021-04-24 21:30:30', '사막에서 길가다 오아시스의 맛을 봤었다면 마치 이거 같았을겁니다 ㅠㅠb', 5);
insert into review values('r00004', 'baesense', 'f00006', '2021-03-26 12:00:02', '2021-03-27 00:12:38', '족발땡겨서 시켜먹었는데 여기만한 곳은 지구를 뒤져봐도 없을겁니다~',4);
insert into review values('burgerking111', 'sin', 'burgerking111f3', '2021-04-18 12:20:02', '2021-04-18 14:00:02', '패티가 맛있네요',5);
insert into review values('EggdropYT', 'ses0609', 'EggdropYT1', '2021-03-27 14:14:00', '2021-04-16 14:57:31', '맛있게 잘 먹었습니다~!', 5);
INSERT INTO review VALUES( 'honbab', 'psb0320','honbabf3', '2020-05-14 10:31:05', '2020-05-14 19:35:00', '믿고 먹습니다! 삼겹살, 떡, 쫄면 김치찌개에 서비스까지 다 맛있어요!', 5);
INSERT INTO review VALUES( 'jjolsam', 'psb0320', 'jjolsamf2', '2020-11-28 17:35:12', '2020-11-28 19:35:00', '믿고 먹습니다! 삼겹살, 떡, 쫄면 김치찌개에 서비스까지 다 맛있어요!', 5);


-- cancel table 초기데이터 cancel(resID, cusID, foodID, orderTime, paymentOption:varchar(5), orderCnt:samllint, amount:int, orderStatus:varchar(4), cookStart:dateTime, dc:int, coupon:varchar(10), deliveryOption:varchar(4), deliverMinute:int, cancelTime:dateTime, reason:varchar(100))

INSERT INTO cancel values ('EggdropYT', 'ses0609', 'EggdropYT1',  '2021-03-27 14:11:00', '선결제', 1, 6400, '배달취소', NULL, NULL, NULL, NULL, NULL, '2021-03-27 14:12:30', '덜 시켰네요');