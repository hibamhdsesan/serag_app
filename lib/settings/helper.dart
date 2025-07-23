String formatNullableDate(DateTime? dateTime) {
  if (dateTime == null) return 'لا يوجد تاريخ';
  return "${dateTime.year}-${dateTime.month.toString().padLeft(2,'0')}-${dateTime.day.toString().padLeft(2,'0')}";
}
