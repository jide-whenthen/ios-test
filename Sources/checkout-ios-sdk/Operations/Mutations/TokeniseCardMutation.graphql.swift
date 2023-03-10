// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension CheckoutSchema {
  class TokeniseCardMutation: GraphQLMutation {
    public static let operationName: String = "tokeniseCard"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        """
        mutation tokeniseCard($data: TokenInput!) {
          tokeniseCard(data: $data) {
            __typename
            id
            token
            createdDate
            customer {
              __typename
              id
              billingAddress {
                __typename
                line1
                line2
                city
                postalCode
                state
                country
              }
              description
              email
              name
              phone
              shippingAddress {
                __typename
                address {
                  __typename
                  line1
                  line2
                  city
                  postalCode
                  state
                  country
                }
                name
                phone
              }
              systemCreated
              systemUpdated
              defaultPaymentMethod
            }
          }
        }
        """
      ))

    public var data: TokenInput

    public init(data: TokenInput) {
      self.data = data
    }

    public var __variables: Variables? { ["data": data] }

    public struct Data: CheckoutSchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { CheckoutSchema.Objects.Mutation }
      public static var __selections: [Selection] { [
        .field("tokeniseCard", TokeniseCard.self, arguments: ["data": .variable("data")]),
      ] }

      public var tokeniseCard: TokeniseCard { __data["tokeniseCard"] }

      /// TokeniseCard
      ///
      /// Parent Type: `CardToken`
      public struct TokeniseCard: CheckoutSchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { CheckoutSchema.Objects.CardToken }
        public static var __selections: [Selection] { [
          .field("id", String.self),
          .field("token", String.self),
          .field("createdDate", DateTime.self),
          .field("customer", Customer?.self),
        ] }

        public var id: String { __data["id"] }
        public var token: String { __data["token"] }
        public var createdDate: DateTime { __data["createdDate"] }
        public var customer: Customer? { __data["customer"] }

        /// TokeniseCard.Customer
        ///
        /// Parent Type: `Customer`
        public struct Customer: CheckoutSchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { CheckoutSchema.Objects.Customer }
          public static var __selections: [Selection] { [
            .field("id", String?.self),
            .field("billingAddress", BillingAddress?.self),
            .field("description", String?.self),
            .field("email", String?.self),
            .field("name", String?.self),
            .field("phone", String?.self),
            .field("shippingAddress", ShippingAddress?.self),
            .field("systemCreated", DateTime?.self),
            .field("systemUpdated", DateTime?.self),
            .field("defaultPaymentMethod", String?.self),
          ] }

          public var id: String? { __data["id"] }
          public var billingAddress: BillingAddress? { __data["billingAddress"] }
          public var description: String? { __data["description"] }
          public var email: String? { __data["email"] }
          public var name: String? { __data["name"] }
          public var phone: String? { __data["phone"] }
          public var shippingAddress: ShippingAddress? { __data["shippingAddress"] }
          public var systemCreated: DateTime? { __data["systemCreated"] }
          public var systemUpdated: DateTime? { __data["systemUpdated"] }
          public var defaultPaymentMethod: String? { __data["defaultPaymentMethod"] }

          /// TokeniseCard.Customer.BillingAddress
          ///
          /// Parent Type: `BillingAddressApi`
          public struct BillingAddress: CheckoutSchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { CheckoutSchema.Objects.BillingAddressApi }
            public static var __selections: [Selection] { [
              .field("line1", String?.self),
              .field("line2", String?.self),
              .field("city", String?.self),
              .field("postalCode", String?.self),
              .field("state", String?.self),
              .field("country", String?.self),
            ] }

            public var line1: String? { __data["line1"] }
            public var line2: String? { __data["line2"] }
            public var city: String? { __data["city"] }
            public var postalCode: String? { __data["postalCode"] }
            public var state: String? { __data["state"] }
            public var country: String? { __data["country"] }
          }

          /// TokeniseCard.Customer.ShippingAddress
          ///
          /// Parent Type: `ShippingAddressApi`
          public struct ShippingAddress: CheckoutSchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { CheckoutSchema.Objects.ShippingAddressApi }
            public static var __selections: [Selection] { [
              .field("address", Address?.self),
              .field("name", String?.self),
              .field("phone", String?.self),
            ] }

            public var address: Address? { __data["address"] }
            public var name: String? { __data["name"] }
            public var phone: String? { __data["phone"] }

            /// TokeniseCard.Customer.ShippingAddress.Address
            ///
            /// Parent Type: `BillingAddressApi`
            public struct Address: CheckoutSchema.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ParentType { CheckoutSchema.Objects.BillingAddressApi }
              public static var __selections: [Selection] { [
                .field("line1", String?.self),
                .field("line2", String?.self),
                .field("city", String?.self),
                .field("postalCode", String?.self),
                .field("state", String?.self),
                .field("country", String?.self),
              ] }

              public var line1: String? { __data["line1"] }
              public var line2: String? { __data["line2"] }
              public var city: String? { __data["city"] }
              public var postalCode: String? { __data["postalCode"] }
              public var state: String? { __data["state"] }
              public var country: String? { __data["country"] }
            }
          }
        }
      }
    }
  }

}