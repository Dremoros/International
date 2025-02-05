import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive/hive.dart';

// Mock Supabase Client
class MockSupabaseClient extends Mock implements SupabaseClient {}

// Mock Hive Box
class MockHiveBox<T> extends Mock implements Box<T> {}

// Mock Realtime Subscription
class MockRealtimeSubscription extends Mock implements RealtimeSubscription {}