//
//  AllRefuelsResponse.swift
//
//  Created by José María Jiménez on 18/03/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class AllRefuelsResponse: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let refuels = "refuels"
  }

  // MARK: Properties
  public var refuels: [Refuels]?

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
    refuels <- map[SerializationKeys.refuels]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = refuels { dictionary[SerializationKeys.refuels] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.refuels = aDecoder.decodeObject(forKey: SerializationKeys.refuels) as? [Refuels]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(refuels, forKey: SerializationKeys.refuels)
  }

}
