class Transactions {
  final String title;
  final String date;
  final String amount;


  Transactions({
    required this.title,
   
    required this.date,
    required this.amount,
   
  });
}



List<Transactions> latest =[

  Transactions
  (
   title: 'Amazon Payment' ,
     date: 'Apr 16th 14:40:58' ,
      amount: '205',
 ),

  Transactions
  (
   title: 'Amazon Payment' ,
  
     date: 'Apr 16th 09:04:11',
      amount: '345',
 ),

   Transactions
  (
   title: 'Card Payment',

     date: 'Apr 14th 11:44:58' ,
      amount: '96',
  ),

  Transactions
  (
   title: 'Transfer' ,
  
     date: 'Apr 14th 10:01:58' ,
      amount: '465',
  ),

];