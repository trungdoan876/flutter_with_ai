import '../domain/contact_model.dart';

class ContactRepository {
  final List<ContactModel> _mockContacts = [
    const ContactModel(
      id: '1',
      name: 'Nguyễn Văn A',
      phone: '0901 234 567',
      email: 'vana@example.com',
    ),
    const ContactModel(
      id: '2',
      name: 'Trần Thị B',
      phone: '0912 345 678',
      email: 'thib@example.com',
    ),
    const ContactModel(
      id: '3',
      name: 'Lê Văn C',
      phone: '0923 456 789',
      email: 'vanc@example.com',
    ),
    const ContactModel(
      id: '4',
      name: 'Phạm Thị D',
      phone: '0934 567 890',
      email: 'thid@example.com',
    ),
    const ContactModel(
      id: '5',
      name: 'Hoàng Văn E',
      phone: '0945 678 901',
      email: 'vane@example.com',
    ),
    const ContactModel(
      id: '6',
      name: 'Vũ Thị F',
      phone: '0956 789 012',
      email: 'thif@example.com',
    ),
    const ContactModel(
      id: '7',
      name: 'Đặng Văn G',
      phone: '0967 890 123',
      email: 'vang@example.com',
    ),
    const ContactModel(
      id: '8',
      name: 'Bùi Thị H',
      phone: '0978 901 234',
      email: 'thih@example.com',
    ),
    const ContactModel(
      id: '9',
      name: 'Lý Văn I',
      phone: '0989 012 345',
      email: 'vani@example.com',
    ),
    const ContactModel(
      id: '10',
      name: 'Ngô Thị K',
      phone: '0990 123 456',
      email: 'thik@example.com',
    ),
    const ContactModel(
      id: '11',
      name: 'Đỗ Văn L',
      phone: '0900 111 222',
      email: 'vanl@example.com',
    ),
    const ContactModel(
      id: '12',
      name: 'Hồ Thị M',
      phone: '0911 222 333',
      email: 'thim@example.com',
    ),
  ];

  Future<List<ContactModel>> getContacts() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockContacts;
  }

  Future<List<ContactModel>> searchContacts(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (query.isEmpty) return _mockContacts;
    
    return _mockContacts.where((contact) {
      final nameLower = contact.name.toLowerCase();
      final phoneLower = contact.phone.toLowerCase();
      final emailLower = contact.email.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          phoneLower.contains(searchLower) ||
          emailLower.contains(searchLower);
    }).toList();
  }
}
