import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mpay/feature/beneficiary/domain/entity/beneficiary.dart';
import 'package:mpay/feature/beneficiary/domain/repository/beneficiary_repository.dart';
import 'package:mpay/feature/beneficiary/presentation/bloc/beneficiary_bloc.dart';

import 'beneficiary_bloc_test.mocks.dart';

// Generate Mock Class
@GenerateMocks([BeneficiaryRepository])
void main() {
  late BeneficiaryBloc beneficiaryBloc;
  late MockBeneficiaryRepository mockBeneficiaryRepository;

  setUp(() {
    mockBeneficiaryRepository = MockBeneficiaryRepository();
    beneficiaryBloc = BeneficiaryBloc(repository: mockBeneficiaryRepository);
  });

  tearDown(() {
    beneficiaryBloc.close();
  });

  group('BeneficiaryBloc - GetAllBeneficiariesEvent', () {
    final List<Beneficiary> beneficiaries = [
      Beneficiary(id: '1', name: 'John Doe', accountNumber: '1234', bank: 'XYZ Bank'),
      Beneficiary(id: '2', name: 'Jane Smith', accountNumber: '5678', bank: 'ABC Bank'),
    ];

    blocTest<BeneficiaryBloc, BeneficiaryState>(
      'emits [BeneficiaryLoading, AllBeneficiariesLoaded] when beneficiaries are fetched successfully',
      build: () {
        when(mockBeneficiaryRepository.getAllBeneficiaries(userId: anyNamed('userId')))
            .thenAnswer((_) async => beneficiaries);
        return beneficiaryBloc;
      },
      act: (bloc) => bloc.add(GetAllBeneficiariesEvent(userId: 'user123')),
      expect: () => [
        BeneficiaryLoading(),
        AllBeneficiariesLoaded(beneficiaries),
      ],
      verify: (_) {
        verify(mockBeneficiaryRepository.getAllBeneficiaries(userId: 'user123'))
            .called(1);
      },
    );

    blocTest<BeneficiaryBloc, BeneficiaryState>(
      'emits [BeneficiaryLoading, BeneficiaryError] when fetching fails',
      build: () {
        when(mockBeneficiaryRepository.getAllBeneficiaries(userId: anyNamed('userId')))
            .thenThrow(Exception('Failed to fetch beneficiaries'));
        return beneficiaryBloc;
      },
      act: (bloc) => bloc.add(GetAllBeneficiariesEvent(userId: 'user123')),
      expect: () => [
        BeneficiaryLoading(),
        BeneficiaryError(message: 'Failed to fetch beneficiaries'),
      ],
    );
  });

  group('BeneficiaryBloc - AddBeneficiaryEvent', () {
    const newBeneficiary = Beneficiary(
      id: '3',
      name: 'Alice Doe',
      accountNumber: '91011',
      bank: 'LMN Bank',
    );

    blocTest<BeneficiaryBloc, BeneficiaryState>(
      'emits [BeneficiaryLoading, BeneficiaryAdded] when adding a beneficiary is successful',
      build: () {
        when(mockBeneficiaryRepository.addBeneficiary(newBeneficiary))
            .thenAnswer((_) async => true);
        return beneficiaryBloc;
      },
      act: (bloc) => bloc.add(AddBeneficiaryEvent(beneficiary: newBeneficiary)),
      expect: () => [
        BeneficiaryLoading(),
        BeneficiaryAdded(),
      ],
      verify: (_) {
        verify(mockBeneficiaryRepository.addBeneficiary(newBeneficiary))
            .called(1);
      },
    );

    blocTest<BeneficiaryBloc, BeneficiaryState>(
      'emits [BeneficiaryLoading, BeneficiaryError] when adding a beneficiary fails',
      build: () {
        when(mockBeneficiaryRepository.addBeneficiary(newBeneficiary))
            .thenThrow(Exception('Failed to add beneficiary'));
        return beneficiaryBloc;
      },
      act: (bloc) => bloc.add(AddBeneficiaryEvent(beneficiary: newBeneficiary)),
      expect: () => [
        BeneficiaryLoading(),
        BeneficiaryError(message: 'Failed to add beneficiary'),
      ],
    );
  });

  group('BeneficiaryBloc - PerformTopUpEvent', () {
    const userId = 'user123';
    const amount = 500.0;

    blocTest<BeneficiaryBloc, BeneficiaryState>(
      'emits [BeneficiaryLoading, TopUpSuccess] when top-up is successful',
      build: () {
        when(mockBeneficiaryRepository.performTopUp(userId: userId, amount: amount))
            .thenAnswer((_) async => true);
        return beneficiaryBloc;
      },
      act: (bloc) => bloc.add(PerformTopUpEvent(userId: userId, amount: amount)),
      expect: () => [
        BeneficiaryLoading(),
        TopUpSuccess(),
      ],
      verify: (_) {
        verify(mockBeneficiaryRepository.performTopUp(userId: userId, amount: amount))
            .called(1);
      },
    );

    blocTest<BeneficiaryBloc, BeneficiaryState>(
      'emits [BeneficiaryLoading, BeneficiaryError] when top-up fails',
      build: () {
        when(mockBeneficiaryRepository.performTopUp(userId: userId, amount: amount))
            .thenThrow(Exception('Failed to perform top-up'));
        return beneficiaryBloc;
      },
      act: (bloc) => bloc.add(PerformTopUpEvent(userId: userId, amount: amount)),
      expect: () => [
        BeneficiaryLoading(),
        BeneficiaryError(message: 'Failed to perform top-up'),
      ],
    );
  });
}
