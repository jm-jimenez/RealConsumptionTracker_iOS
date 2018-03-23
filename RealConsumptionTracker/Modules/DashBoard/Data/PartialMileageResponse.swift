//
//  PartialMileageResponse.swift
//
//  Created by José María Jiménez on 17/03/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public final class PartialMileageResponse: Mappable, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let mileages = "mileages"
    static let days = "days"
  }

  // MARK: Properties
  public var mileages: [Float]?
  public var days: [Int]?

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
    mileages <- map[SerializationKeys.mileages]
    days <- map[SerializationKeys.days]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = mileages { dictionary[SerializationKeys.mileages] = value }
    if let value = days { dictionary[SerializationKeys.days] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.mileages = aDecoder.decodeObject(forKey: SerializationKeys.mileages) as? [Float]
    self.days = aDecoder.decodeObject(forKey: SerializationKeys.days) as? [Int]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(mileages, forKey: SerializationKeys.mileages)
    aCoder.encode(days, forKey: SerializationKeys.days)
  }

}
