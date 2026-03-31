import '../domain/contact_model.dart';

class ContactRepository {
  final List<ContactModel> _mockContacts = [
    const ContactModel(
      id: '1',
      name: 'Nguyen Van A',
      phone: '0901234567',
      email: 'vana@example.com',
    ),
    const ContactModel(
      id: '2',
      name: 'Tran Thi B',
      phone: '0912345678',
      email: 'thib@example.com',
    ),
    const ContactModel(
      id: '3',
      name: 'Le Van C',
      phone: '0923456789',
      email: 'vanc@example.com',
    ),
    const ContactModel(
      id: '4',
      name: 'Pham Thi D',
      phone: '0934567890',
      email: 'thid@example.com',
    ),
    const ContactModel(
      id: '5',
      name: 'Hoang Van E',
      phone: '0945678901',
      email: 'vane@example.com',
    ),
    const ContactModel(
      id: '6',
      name: 'Vo Thi F',
      phone: '0956789012',
      email: 'thif@example.com',
    ),
    const ContactModel(
      id: '7',
      name: 'Dang Van G',
      phone: '0967890123',
      email: 'vang@example.com',
    ),
    const ContactModel(
      id: '8',
      name: 'Bui Thi H',
      phone: '0978901234',
      email: 'thih@example.com',
    ),
    const ContactModel(
      id: '9',
      name: 'Ly Van I',
      phone: '0989012345',
      email: 'vani@example.com',
    ),
    const ContactModel(
      id: '10',
      name: 'Ngo Thi J',
      phone: '0990123456',
      email: 'thij@example.com',
    ),
    const ContactModel(
      id: '11',
      name: 'Do Van K',
      phone: '0900123456',
      email: 'vank@example.com',
    ),
    const ContactModel(
      id: '12',
      name: 'Truong Thi L',
      phone: '0911234567',
      email: 'thil@example.com',
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
