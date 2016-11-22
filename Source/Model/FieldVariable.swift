/*
* Copyright 2015 Google Inc. All Rights Reserved.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Foundation

/**
An input for specifying a variable.
*/
@objc(BKYFieldVariable)
public final class FieldVariable: Field {
  // MARK: - Properties

  /// The variable in this field
  public internal(set) var variable: String {
    didSet { didSetEditableProperty(&variable, oldValue) }
  }

  // MARK: - Initializers

  /**
   Initializes the variable field.

   - parameter name: The name of this field.
   - parameter variable: The initial variable name to set for this field.
   */
  public init(name: String, variable: String) {
    self.variable = variable

    super.init(name: name)
  }

  // MARK: - Super

  public override func copyField() -> Field {
    return FieldVariable(name: name, variable: variable)
  }

  public override func setValueFromSerializedText(_ text: String) throws {
    if text != "" {
      self.variable = text
    } else {
      throw BlocklyError(.xmlParsing, "Cannot set a variable to empty text")
    }
  }

  public override func serializedText() throws -> String? {
    return self.variable
  }
}
