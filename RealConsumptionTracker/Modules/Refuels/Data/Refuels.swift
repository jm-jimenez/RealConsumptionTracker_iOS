//
//  Refuels.swift
//
//  Created by José María Jiménez on 18/03/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class Refuels: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let odometer = "odometer"
    static let id = "_id"
    static let euros = "euros"
    static let totalEuros = "totalEuros"
    static let litres = "litres"
    static let v = "__v"
    static let totalLitres = "totalLitres"
    static let date = "date"
    static let full = "full"
    static let totalOdometer = "totalOdometer"
  }

  // MARK: Properties
  public var odometer: Int?
  public var id: String?
  public var euros: Double?
  public var totalEuros: Double?
  public var litres: Double?
  public var v: Int?
  public var totalLitres: Double?
  public var date: String?
  public var full: Bool? = false
  public var totalOdometer: Int?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    odometer <- map[SerializationKeys.odometer]
    id <- map[SerializationKeys.id]
    euros <- map[SerializationKeys.euros]
    totalEuros <- map[SerializationKeys.totalEuros]
    litres <- map[SerializationKeys.litres]
    v <- map[SerializationKeys.v]
    totalLitres <- map[SerializationKeys.totalLitres]
    date <- map[SerializationKeys.date]
    full <- map[SerializationKeys.full]
    totalOdometer <- map[SerializationKeys.totalOdometer]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = odometer { dictionary[SerializationKeys.odometer] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = euros { dictionary[SerializationKeys.euros] = value }
    if let value = totalEuros { dictionary[SerializationKeys.totalEuros] = value }
    if let value = litres { dictionary[SerializationKeys.litres] = value }
    if let value = v { dictionary[SerializationKeys.v] = value }
    if let value = totalLitres { dictionary[SerializationKeys.totalLitres] = value }
    if let value = date { dictionary[SerializationKeys.date] = value }
    dictionary[SerializationKeys.full] = full
    if let value = totalOdometer { dictionary[SerializationKeys.totalOdometer] = value }
    return dictionary
  }
}
