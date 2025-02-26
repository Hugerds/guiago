// Mocks generated by Mockito 5.4.5 from annotations
// in guia_go/test/modules/go_now/data/data_sources/motel_remote_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:guia_go/core/http_client/domain/interfaces/icustom_http_client.dart'
    as _i3;
import 'package:guia_go/core/instance_manager/domain/interfaces/iinstance_manager.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFuture_0<T1> extends _i1.SmartFake implements _i2.Future<T1> {
  _FakeFuture_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ICustomHttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockICustomHttpClient extends _i1.Mock implements _i3.ICustomHttpClient {
  MockICustomHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Future<dynamic> get(String? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(
            Invocation.method(#get, [url], {#headers: headers}),
            returnValue: _i2.Future<dynamic>.value(),
          )
          as _i2.Future<dynamic>);

  @override
  _i2.Future<dynamic> post(
    String? url, {
    Map<String, String>? headers,
    dynamic body,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#post, [url], {#headers: headers, #body: body}),
            returnValue: _i2.Future<dynamic>.value(),
          )
          as _i2.Future<dynamic>);

  @override
  _i2.Future<dynamic> put(
    String? url, {
    Map<String, String>? headers,
    dynamic body,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#put, [url], {#headers: headers, #body: body}),
            returnValue: _i2.Future<dynamic>.value(),
          )
          as _i2.Future<dynamic>);

  @override
  _i2.Future<dynamic> delete(String? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(
            Invocation.method(#delete, [url], {#headers: headers}),
            returnValue: _i2.Future<dynamic>.value(),
          )
          as _i2.Future<dynamic>);
}

/// A class which mocks [IInstanceManager].
///
/// See the documentation for Mockito's code generation for more information.
class MockIInstanceManager extends _i1.Mock implements _i4.IInstanceManager {
  MockIInstanceManager() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Future<void> dispose() =>
      (super.noSuchMethod(
            Invocation.method(#dispose, []),
            returnValue: _i2.Future<void>.value(),
            returnValueForMissingStub: _i2.Future<void>.value(),
          )
          as _i2.Future<void>);

  @override
  void register<T extends Object>(T? instance) => super.noSuchMethod(
    Invocation.method(#register, [instance]),
    returnValueForMissingStub: null,
  );

  @override
  _i2.Future<void> unregister<T extends Object>() =>
      (super.noSuchMethod(
            Invocation.method(#unregister, []),
            returnValue: _i2.Future<void>.value(),
            returnValueForMissingStub: _i2.Future<void>.value(),
          )
          as _i2.Future<void>);

  @override
  T resolve<T extends Object>() =>
      (super.noSuchMethod(
            Invocation.method(#resolve, []),
            returnValue: _i5.dummyValue<T>(
              this,
              Invocation.method(#resolve, []),
            ),
          )
          as T);

  @override
  _i2.Future<T> resolveWithParams<T extends Object>(
    Map<String, dynamic>? params,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#resolveWithParams, [params]),
            returnValue:
                _i5.ifNotNull(
                  _i5.dummyValueOrNull<T>(
                    this,
                    Invocation.method(#resolveWithParams, [params]),
                  ),
                  (T v) => _i2.Future<T>.value(v),
                ) ??
                _FakeFuture_0<T>(
                  this,
                  Invocation.method(#resolveWithParams, [params]),
                ),
          )
          as _i2.Future<T>);

  @override
  _i2.Future<void> clear() =>
      (super.noSuchMethod(
            Invocation.method(#clear, []),
            returnValue: _i2.Future<void>.value(),
            returnValueForMissingStub: _i2.Future<void>.value(),
          )
          as _i2.Future<void>);
}
