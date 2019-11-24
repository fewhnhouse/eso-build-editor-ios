//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class BuildsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Builds {
      builds {
        __typename
        id
        name
        applicationArea
        description
        role
        race
        esoClass
        published
        accessRights
      }
    }
    """

  public let operationName = "Builds"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("builds", type: .list(.nonNull(.object(Build.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(builds: [Build]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "builds": builds.flatMap { (value: [Build]) -> [ResultMap] in value.map { (value: Build) -> ResultMap in value.resultMap } }])
    }

    public var builds: [Build]? {
      get {
        return (resultMap["builds"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Build] in value.map { (value: ResultMap) -> Build in Build(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Build]) -> [ResultMap] in value.map { (value: Build) -> ResultMap in value.resultMap } }, forKey: "builds")
      }
    }

    public struct Build: GraphQLSelectionSet {
      public static let possibleTypes = ["Build"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("applicationArea", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("role", type: .scalar(String.self)),
        GraphQLField("race", type: .scalar(String.self)),
        GraphQLField("esoClass", type: .scalar(String.self)),
        GraphQLField("published", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("accessRights", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, applicationArea: String? = nil, description: String? = nil, role: String? = nil, race: String? = nil, esoClass: String? = nil, published: Bool, accessRights: String) {
        self.init(unsafeResultMap: ["__typename": "Build", "id": id, "name": name, "applicationArea": applicationArea, "description": description, "role": role, "race": race, "esoClass": esoClass, "published": published, "accessRights": accessRights])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var applicationArea: String? {
        get {
          return resultMap["applicationArea"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "applicationArea")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var role: String? {
        get {
          return resultMap["role"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "role")
        }
      }

      public var race: String? {
        get {
          return resultMap["race"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "race")
        }
      }

      public var esoClass: String? {
        get {
          return resultMap["esoClass"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "esoClass")
        }
      }

      public var published: Bool {
        get {
          return resultMap["published"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "published")
        }
      }

      public var accessRights: String {
        get {
          return resultMap["accessRights"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessRights")
        }
      }
    }
  }
}

public final class BuildQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Build($id: ID!) {
      build(id: $id) {
        __typename
        id
        name
        applicationArea
        description
        role
        race
        esoClass
        published
        accessRights
        newBarOne {
          __typename
          id
          index
          skill {
            __typename
            ...SkillFragment
          }
        }
        newBarTwo {
          __typename
          id
          index
          skill {
            __typename
            ...SkillFragment
          }
        }
        ultimateOne {
          __typename
          ...SkillFragment
        }
        ultimateTwo {
          __typename
          ...SkillFragment
        }
        smallPieceSelection {
          __typename
          ...SetSelectionFragment
        }
        bigPieceSelection {
          __typename
          ...SetSelectionFragment
        }
        jewelrySelection {
          __typename
          ...SetSelectionFragment
        }
        frontbarSelection {
          __typename
          ...SetSelectionFragment
        }
        backbarSelection {
          __typename
          ...SetSelectionFragment
        }
        mundusStone {
          __typename
          id
          name
          value
          effect
          icon
        }
        buff {
          __typename
          id
          name
          buffDescription
          icon
        }
      }
    }
    """

  public let operationName = "Build"

  public var queryDocument: String { return operationDefinition.appending(SkillFragment.fragmentDefinition).appending(SetSelectionFragment.fragmentDefinition).appending(SetFragment.fragmentDefinition).appending(ModificationFragment.fragmentDefinition) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("build", arguments: ["id": GraphQLVariable("id")], type: .object(Build.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(build: Build? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "build": build.flatMap { (value: Build) -> ResultMap in value.resultMap }])
    }

    public var build: Build? {
      get {
        return (resultMap["build"] as? ResultMap).flatMap { Build(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "build")
      }
    }

    public struct Build: GraphQLSelectionSet {
      public static let possibleTypes = ["Build"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("applicationArea", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("role", type: .scalar(String.self)),
        GraphQLField("race", type: .scalar(String.self)),
        GraphQLField("esoClass", type: .scalar(String.self)),
        GraphQLField("published", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("accessRights", type: .nonNull(.scalar(String.self))),
        GraphQLField("newBarOne", type: .list(.nonNull(.object(NewBarOne.selections)))),
        GraphQLField("newBarTwo", type: .list(.nonNull(.object(NewBarTwo.selections)))),
        GraphQLField("ultimateOne", type: .object(UltimateOne.selections)),
        GraphQLField("ultimateTwo", type: .object(UltimateTwo.selections)),
        GraphQLField("smallPieceSelection", type: .list(.nonNull(.object(SmallPieceSelection.selections)))),
        GraphQLField("bigPieceSelection", type: .list(.nonNull(.object(BigPieceSelection.selections)))),
        GraphQLField("jewelrySelection", type: .list(.nonNull(.object(JewelrySelection.selections)))),
        GraphQLField("frontbarSelection", type: .list(.nonNull(.object(FrontbarSelection.selections)))),
        GraphQLField("backbarSelection", type: .list(.nonNull(.object(BackbarSelection.selections)))),
        GraphQLField("mundusStone", type: .object(MundusStone.selections)),
        GraphQLField("buff", type: .object(Buff.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, applicationArea: String? = nil, description: String? = nil, role: String? = nil, race: String? = nil, esoClass: String? = nil, published: Bool, accessRights: String, newBarOne: [NewBarOne]? = nil, newBarTwo: [NewBarTwo]? = nil, ultimateOne: UltimateOne? = nil, ultimateTwo: UltimateTwo? = nil, smallPieceSelection: [SmallPieceSelection]? = nil, bigPieceSelection: [BigPieceSelection]? = nil, jewelrySelection: [JewelrySelection]? = nil, frontbarSelection: [FrontbarSelection]? = nil, backbarSelection: [BackbarSelection]? = nil, mundusStone: MundusStone? = nil, buff: Buff? = nil) {
        self.init(unsafeResultMap: ["__typename": "Build", "id": id, "name": name, "applicationArea": applicationArea, "description": description, "role": role, "race": race, "esoClass": esoClass, "published": published, "accessRights": accessRights, "newBarOne": newBarOne.flatMap { (value: [NewBarOne]) -> [ResultMap] in value.map { (value: NewBarOne) -> ResultMap in value.resultMap } }, "newBarTwo": newBarTwo.flatMap { (value: [NewBarTwo]) -> [ResultMap] in value.map { (value: NewBarTwo) -> ResultMap in value.resultMap } }, "ultimateOne": ultimateOne.flatMap { (value: UltimateOne) -> ResultMap in value.resultMap }, "ultimateTwo": ultimateTwo.flatMap { (value: UltimateTwo) -> ResultMap in value.resultMap }, "smallPieceSelection": smallPieceSelection.flatMap { (value: [SmallPieceSelection]) -> [ResultMap] in value.map { (value: SmallPieceSelection) -> ResultMap in value.resultMap } }, "bigPieceSelection": bigPieceSelection.flatMap { (value: [BigPieceSelection]) -> [ResultMap] in value.map { (value: BigPieceSelection) -> ResultMap in value.resultMap } }, "jewelrySelection": jewelrySelection.flatMap { (value: [JewelrySelection]) -> [ResultMap] in value.map { (value: JewelrySelection) -> ResultMap in value.resultMap } }, "frontbarSelection": frontbarSelection.flatMap { (value: [FrontbarSelection]) -> [ResultMap] in value.map { (value: FrontbarSelection) -> ResultMap in value.resultMap } }, "backbarSelection": backbarSelection.flatMap { (value: [BackbarSelection]) -> [ResultMap] in value.map { (value: BackbarSelection) -> ResultMap in value.resultMap } }, "mundusStone": mundusStone.flatMap { (value: MundusStone) -> ResultMap in value.resultMap }, "buff": buff.flatMap { (value: Buff) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var applicationArea: String? {
        get {
          return resultMap["applicationArea"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "applicationArea")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var role: String? {
        get {
          return resultMap["role"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "role")
        }
      }

      public var race: String? {
        get {
          return resultMap["race"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "race")
        }
      }

      public var esoClass: String? {
        get {
          return resultMap["esoClass"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "esoClass")
        }
      }

      public var published: Bool {
        get {
          return resultMap["published"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "published")
        }
      }

      public var accessRights: String {
        get {
          return resultMap["accessRights"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessRights")
        }
      }

      public var newBarOne: [NewBarOne]? {
        get {
          return (resultMap["newBarOne"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [NewBarOne] in value.map { (value: ResultMap) -> NewBarOne in NewBarOne(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [NewBarOne]) -> [ResultMap] in value.map { (value: NewBarOne) -> ResultMap in value.resultMap } }, forKey: "newBarOne")
        }
      }

      public var newBarTwo: [NewBarTwo]? {
        get {
          return (resultMap["newBarTwo"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [NewBarTwo] in value.map { (value: ResultMap) -> NewBarTwo in NewBarTwo(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [NewBarTwo]) -> [ResultMap] in value.map { (value: NewBarTwo) -> ResultMap in value.resultMap } }, forKey: "newBarTwo")
        }
      }

      public var ultimateOne: UltimateOne? {
        get {
          return (resultMap["ultimateOne"] as? ResultMap).flatMap { UltimateOne(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "ultimateOne")
        }
      }

      public var ultimateTwo: UltimateTwo? {
        get {
          return (resultMap["ultimateTwo"] as? ResultMap).flatMap { UltimateTwo(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "ultimateTwo")
        }
      }

      public var smallPieceSelection: [SmallPieceSelection]? {
        get {
          return (resultMap["smallPieceSelection"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [SmallPieceSelection] in value.map { (value: ResultMap) -> SmallPieceSelection in SmallPieceSelection(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [SmallPieceSelection]) -> [ResultMap] in value.map { (value: SmallPieceSelection) -> ResultMap in value.resultMap } }, forKey: "smallPieceSelection")
        }
      }

      public var bigPieceSelection: [BigPieceSelection]? {
        get {
          return (resultMap["bigPieceSelection"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [BigPieceSelection] in value.map { (value: ResultMap) -> BigPieceSelection in BigPieceSelection(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [BigPieceSelection]) -> [ResultMap] in value.map { (value: BigPieceSelection) -> ResultMap in value.resultMap } }, forKey: "bigPieceSelection")
        }
      }

      public var jewelrySelection: [JewelrySelection]? {
        get {
          return (resultMap["jewelrySelection"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [JewelrySelection] in value.map { (value: ResultMap) -> JewelrySelection in JewelrySelection(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [JewelrySelection]) -> [ResultMap] in value.map { (value: JewelrySelection) -> ResultMap in value.resultMap } }, forKey: "jewelrySelection")
        }
      }

      public var frontbarSelection: [FrontbarSelection]? {
        get {
          return (resultMap["frontbarSelection"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [FrontbarSelection] in value.map { (value: ResultMap) -> FrontbarSelection in FrontbarSelection(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [FrontbarSelection]) -> [ResultMap] in value.map { (value: FrontbarSelection) -> ResultMap in value.resultMap } }, forKey: "frontbarSelection")
        }
      }

      public var backbarSelection: [BackbarSelection]? {
        get {
          return (resultMap["backbarSelection"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [BackbarSelection] in value.map { (value: ResultMap) -> BackbarSelection in BackbarSelection(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [BackbarSelection]) -> [ResultMap] in value.map { (value: BackbarSelection) -> ResultMap in value.resultMap } }, forKey: "backbarSelection")
        }
      }

      public var mundusStone: MundusStone? {
        get {
          return (resultMap["mundusStone"] as? ResultMap).flatMap { MundusStone(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mundusStone")
        }
      }

      public var buff: Buff? {
        get {
          return (resultMap["buff"] as? ResultMap).flatMap { Buff(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "buff")
        }
      }

      public struct NewBarOne: GraphQLSelectionSet {
        public static let possibleTypes = ["SkillSelection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("index", type: .nonNull(.scalar(Int.self))),
          GraphQLField("skill", type: .object(Skill.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, index: Int, skill: Skill? = nil) {
          self.init(unsafeResultMap: ["__typename": "SkillSelection", "id": id, "index": index, "skill": skill.flatMap { (value: Skill) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var index: Int {
          get {
            return resultMap["index"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "index")
          }
        }

        public var skill: Skill? {
          get {
            return (resultMap["skill"] as? ResultMap).flatMap { Skill(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "skill")
          }
        }

        public struct Skill: GraphQLSelectionSet {
          public static let possibleTypes = ["Skill"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(SkillFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, skillId: Int, castTime: String, cost: String, effect_1: String, effect_2: String? = nil, icon: String? = nil, name: String, parent: Int? = nil, range: String? = nil, skillline: Int, slug: String, target: String? = nil, type: Int, unlocksAt: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Skill", "id": id, "skillId": skillId, "cast_time": castTime, "cost": cost, "effect_1": effect_1, "effect_2": effect_2, "icon": icon, "name": name, "parent": parent, "range": range, "skillline": skillline, "slug": slug, "target": target, "type": type, "unlocks_at": unlocksAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var skillFragment: SkillFragment {
              get {
                return SkillFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct NewBarTwo: GraphQLSelectionSet {
        public static let possibleTypes = ["SkillSelection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("index", type: .nonNull(.scalar(Int.self))),
          GraphQLField("skill", type: .object(Skill.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, index: Int, skill: Skill? = nil) {
          self.init(unsafeResultMap: ["__typename": "SkillSelection", "id": id, "index": index, "skill": skill.flatMap { (value: Skill) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var index: Int {
          get {
            return resultMap["index"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "index")
          }
        }

        public var skill: Skill? {
          get {
            return (resultMap["skill"] as? ResultMap).flatMap { Skill(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "skill")
          }
        }

        public struct Skill: GraphQLSelectionSet {
          public static let possibleTypes = ["Skill"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(SkillFragment.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, skillId: Int, castTime: String, cost: String, effect_1: String, effect_2: String? = nil, icon: String? = nil, name: String, parent: Int? = nil, range: String? = nil, skillline: Int, slug: String, target: String? = nil, type: Int, unlocksAt: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Skill", "id": id, "skillId": skillId, "cast_time": castTime, "cost": cost, "effect_1": effect_1, "effect_2": effect_2, "icon": icon, "name": name, "parent": parent, "range": range, "skillline": skillline, "slug": slug, "target": target, "type": type, "unlocks_at": unlocksAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var skillFragment: SkillFragment {
              get {
                return SkillFragment(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }

      public struct UltimateOne: GraphQLSelectionSet {
        public static let possibleTypes = ["Skill"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SkillFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, skillId: Int, castTime: String, cost: String, effect_1: String, effect_2: String? = nil, icon: String? = nil, name: String, parent: Int? = nil, range: String? = nil, skillline: Int, slug: String, target: String? = nil, type: Int, unlocksAt: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Skill", "id": id, "skillId": skillId, "cast_time": castTime, "cost": cost, "effect_1": effect_1, "effect_2": effect_2, "icon": icon, "name": name, "parent": parent, "range": range, "skillline": skillline, "slug": slug, "target": target, "type": type, "unlocks_at": unlocksAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var skillFragment: SkillFragment {
            get {
              return SkillFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct UltimateTwo: GraphQLSelectionSet {
        public static let possibleTypes = ["Skill"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SkillFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, skillId: Int, castTime: String, cost: String, effect_1: String, effect_2: String? = nil, icon: String? = nil, name: String, parent: Int? = nil, range: String? = nil, skillline: Int, slug: String, target: String? = nil, type: Int, unlocksAt: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Skill", "id": id, "skillId": skillId, "cast_time": castTime, "cost": cost, "effect_1": effect_1, "effect_2": effect_2, "icon": icon, "name": name, "parent": parent, "range": range, "skillline": skillline, "slug": slug, "target": target, "type": type, "unlocks_at": unlocksAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var skillFragment: SkillFragment {
            get {
              return SkillFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct SmallPieceSelection: GraphQLSelectionSet {
        public static let possibleTypes = ["SetSelection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SetSelectionFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var setSelectionFragment: SetSelectionFragment {
            get {
              return SetSelectionFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct BigPieceSelection: GraphQLSelectionSet {
        public static let possibleTypes = ["SetSelection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SetSelectionFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var setSelectionFragment: SetSelectionFragment {
            get {
              return SetSelectionFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct JewelrySelection: GraphQLSelectionSet {
        public static let possibleTypes = ["SetSelection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SetSelectionFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var setSelectionFragment: SetSelectionFragment {
            get {
              return SetSelectionFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct FrontbarSelection: GraphQLSelectionSet {
        public static let possibleTypes = ["SetSelection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SetSelectionFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var setSelectionFragment: SetSelectionFragment {
            get {
              return SetSelectionFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct BackbarSelection: GraphQLSelectionSet {
        public static let possibleTypes = ["SetSelection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(SetSelectionFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var setSelectionFragment: SetSelectionFragment {
            get {
              return SetSelectionFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct MundusStone: GraphQLSelectionSet {
        public static let possibleTypes = ["MundusStone"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("value", type: .nonNull(.scalar(String.self))),
          GraphQLField("effect", type: .nonNull(.scalar(String.self))),
          GraphQLField("icon", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, value: String, effect: String, icon: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MundusStone", "id": id, "name": name, "value": value, "effect": effect, "icon": icon])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var value: String {
          get {
            return resultMap["value"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var effect: String {
          get {
            return resultMap["effect"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "effect")
          }
        }

        public var icon: String? {
          get {
            return resultMap["icon"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "icon")
          }
        }
      }

      public struct Buff: GraphQLSelectionSet {
        public static let possibleTypes = ["Buff"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("buffDescription", type: .nonNull(.scalar(String.self))),
          GraphQLField("icon", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, buffDescription: String, icon: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Buff", "id": id, "name": name, "buffDescription": buffDescription, "icon": icon])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var buffDescription: String {
          get {
            return resultMap["buffDescription"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "buffDescription")
          }
        }

        public var icon: String? {
          get {
            return resultMap["icon"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "icon")
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation Login($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        __typename
        user {
          __typename
          id
          name
        }
        token
      }
    }
    """

  public let operationName = "Login"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .object(Login.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes = ["AuthPayload"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("token", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(user: User? = nil, token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "AuthPayload", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Me {
      me {
        __typename
        id
        name
        email
      }
    }
    """

  public let operationName = "Me"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("me", type: .object(Me.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, email: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }
    }
  }
}

public final class RaidsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Raids {
      raids {
        __typename
        id
        name
        description
        applicationArea
        published
        accessRights
        roles {
          __typename
          id
          name
        }
        owner {
          __typename
          id
          name
        }
      }
    }
    """

  public let operationName = "Raids"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("raids", type: .list(.nonNull(.object(Raid.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(raids: [Raid]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "raids": raids.flatMap { (value: [Raid]) -> [ResultMap] in value.map { (value: Raid) -> ResultMap in value.resultMap } }])
    }

    public var raids: [Raid]? {
      get {
        return (resultMap["raids"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Raid] in value.map { (value: ResultMap) -> Raid in Raid(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Raid]) -> [ResultMap] in value.map { (value: Raid) -> ResultMap in value.resultMap } }, forKey: "raids")
      }
    }

    public struct Raid: GraphQLSelectionSet {
      public static let possibleTypes = ["Raid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("applicationArea", type: .scalar(String.self)),
        GraphQLField("published", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("accessRights", type: .nonNull(.scalar(String.self))),
        GraphQLField("roles", type: .list(.nonNull(.object(Role.selections)))),
        GraphQLField("owner", type: .object(Owner.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, description: String? = nil, applicationArea: String? = nil, published: Bool, accessRights: String, roles: [Role]? = nil, owner: Owner? = nil) {
        self.init(unsafeResultMap: ["__typename": "Raid", "id": id, "name": name, "description": description, "applicationArea": applicationArea, "published": published, "accessRights": accessRights, "roles": roles.flatMap { (value: [Role]) -> [ResultMap] in value.map { (value: Role) -> ResultMap in value.resultMap } }, "owner": owner.flatMap { (value: Owner) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var applicationArea: String? {
        get {
          return resultMap["applicationArea"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "applicationArea")
        }
      }

      public var published: Bool {
        get {
          return resultMap["published"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "published")
        }
      }

      public var accessRights: String {
        get {
          return resultMap["accessRights"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessRights")
        }
      }

      public var roles: [Role]? {
        get {
          return (resultMap["roles"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Role] in value.map { (value: ResultMap) -> Role in Role(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Role]) -> [ResultMap] in value.map { (value: Role) -> ResultMap in value.resultMap } }, forKey: "roles")
        }
      }

      public var owner: Owner? {
        get {
          return (resultMap["owner"] as? ResultMap).flatMap { Owner(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "owner")
        }
      }

      public struct Role: GraphQLSelectionSet {
        public static let possibleTypes = ["Role"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Role", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct Owner: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class RaidQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Raid($id: ID!) {
      raid(id: $id) {
        __typename
        id
        name
        description
        applicationArea
        published
        accessRights
        roles {
          __typename
          id
          name
          builds {
            __typename
            id
            index
            build {
              __typename
              ...BuildFragment
            }
          }
        }
        owner {
          __typename
          id
          name
        }
      }
    }
    """

  public let operationName = "Raid"

  public var queryDocument: String { return operationDefinition.appending(BuildFragment.fragmentDefinition) }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("raid", arguments: ["id": GraphQLVariable("id")], type: .object(Raid.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(raid: Raid? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "raid": raid.flatMap { (value: Raid) -> ResultMap in value.resultMap }])
    }

    public var raid: Raid? {
      get {
        return (resultMap["raid"] as? ResultMap).flatMap { Raid(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "raid")
      }
    }

    public struct Raid: GraphQLSelectionSet {
      public static let possibleTypes = ["Raid"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("applicationArea", type: .scalar(String.self)),
        GraphQLField("published", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("accessRights", type: .nonNull(.scalar(String.self))),
        GraphQLField("roles", type: .list(.nonNull(.object(Role.selections)))),
        GraphQLField("owner", type: .object(Owner.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, description: String? = nil, applicationArea: String? = nil, published: Bool, accessRights: String, roles: [Role]? = nil, owner: Owner? = nil) {
        self.init(unsafeResultMap: ["__typename": "Raid", "id": id, "name": name, "description": description, "applicationArea": applicationArea, "published": published, "accessRights": accessRights, "roles": roles.flatMap { (value: [Role]) -> [ResultMap] in value.map { (value: Role) -> ResultMap in value.resultMap } }, "owner": owner.flatMap { (value: Owner) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var applicationArea: String? {
        get {
          return resultMap["applicationArea"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "applicationArea")
        }
      }

      public var published: Bool {
        get {
          return resultMap["published"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "published")
        }
      }

      public var accessRights: String {
        get {
          return resultMap["accessRights"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessRights")
        }
      }

      public var roles: [Role]? {
        get {
          return (resultMap["roles"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Role] in value.map { (value: ResultMap) -> Role in Role(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Role]) -> [ResultMap] in value.map { (value: Role) -> ResultMap in value.resultMap } }, forKey: "roles")
        }
      }

      public var owner: Owner? {
        get {
          return (resultMap["owner"] as? ResultMap).flatMap { Owner(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "owner")
        }
      }

      public struct Role: GraphQLSelectionSet {
        public static let possibleTypes = ["Role"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("builds", type: .list(.nonNull(.object(Build.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, builds: [Build]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Role", "id": id, "name": name, "builds": builds.flatMap { (value: [Build]) -> [ResultMap] in value.map { (value: Build) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var builds: [Build]? {
          get {
            return (resultMap["builds"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Build] in value.map { (value: ResultMap) -> Build in Build(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Build]) -> [ResultMap] in value.map { (value: Build) -> ResultMap in value.resultMap } }, forKey: "builds")
          }
        }

        public struct Build: GraphQLSelectionSet {
          public static let possibleTypes = ["SortedBuild"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("index", type: .nonNull(.scalar(Int.self))),
            GraphQLField("build", type: .nonNull(.object(Build.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, index: Int, build: Build) {
            self.init(unsafeResultMap: ["__typename": "SortedBuild", "id": id, "index": index, "build": build.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var index: Int {
            get {
              return resultMap["index"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "index")
            }
          }

          public var build: Build {
            get {
              return Build(unsafeResultMap: resultMap["build"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "build")
            }
          }

          public struct Build: GraphQLSelectionSet {
            public static let possibleTypes = ["Build"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(BuildFragment.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String? = nil, applicationArea: String? = nil, description: String? = nil, role: String? = nil, race: String? = nil, esoClass: String? = nil, published: Bool, accessRights: String) {
              self.init(unsafeResultMap: ["__typename": "Build", "id": id, "name": name, "applicationArea": applicationArea, "description": description, "role": role, "race": race, "esoClass": esoClass, "published": published, "accessRights": accessRights])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var buildFragment: BuildFragment {
                get {
                  return BuildFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }
      }

      public struct Owner: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public struct SkillSelectionFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment SkillSelectionFragment on SkillSelection {
      __typename
      id
      index
      skill {
        __typename
        ...SkillFragment
      }
    }
    """

  public static let possibleTypes = ["SkillSelection"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("index", type: .nonNull(.scalar(Int.self))),
    GraphQLField("skill", type: .object(Skill.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, index: Int, skill: Skill? = nil) {
    self.init(unsafeResultMap: ["__typename": "SkillSelection", "id": id, "index": index, "skill": skill.flatMap { (value: Skill) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var index: Int {
    get {
      return resultMap["index"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "index")
    }
  }

  public var skill: Skill? {
    get {
      return (resultMap["skill"] as? ResultMap).flatMap { Skill(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "skill")
    }
  }

  public struct Skill: GraphQLSelectionSet {
    public static let possibleTypes = ["Skill"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(SkillFragment.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, skillId: Int, castTime: String, cost: String, effect_1: String, effect_2: String? = nil, icon: String? = nil, name: String, parent: Int? = nil, range: String? = nil, skillline: Int, slug: String, target: String? = nil, type: Int, unlocksAt: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "Skill", "id": id, "skillId": skillId, "cast_time": castTime, "cost": cost, "effect_1": effect_1, "effect_2": effect_2, "icon": icon, "name": name, "parent": parent, "range": range, "skillline": skillline, "slug": slug, "target": target, "type": type, "unlocks_at": unlocksAt])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var skillFragment: SkillFragment {
        get {
          return SkillFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct SetSelectionFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment SetSelectionFragment on SetSelection {
      __typename
      id
      icon
      slot
      type
      weaponType
      selectedSet {
        __typename
        ...SetFragment
      }
      trait {
        __typename
        ...ModificationFragment
      }
      glyph {
        __typename
        ...ModificationFragment
      }
    }
    """

  public static let possibleTypes = ["SetSelection"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("icon", type: .scalar(String.self)),
    GraphQLField("slot", type: .scalar(String.self)),
    GraphQLField("type", type: .scalar(String.self)),
    GraphQLField("weaponType", type: .scalar(String.self)),
    GraphQLField("selectedSet", type: .object(SelectedSet.selections)),
    GraphQLField("trait", type: .object(Trait.selections)),
    GraphQLField("glyph", type: .object(Glyph.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, icon: String? = nil, slot: String? = nil, type: String? = nil, weaponType: String? = nil, selectedSet: SelectedSet? = nil, trait: Trait? = nil, glyph: Glyph? = nil) {
    self.init(unsafeResultMap: ["__typename": "SetSelection", "id": id, "icon": icon, "slot": slot, "type": type, "weaponType": weaponType, "selectedSet": selectedSet.flatMap { (value: SelectedSet) -> ResultMap in value.resultMap }, "trait": trait.flatMap { (value: Trait) -> ResultMap in value.resultMap }, "glyph": glyph.flatMap { (value: Glyph) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var icon: String? {
    get {
      return resultMap["icon"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "icon")
    }
  }

  public var slot: String? {
    get {
      return resultMap["slot"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "slot")
    }
  }

  public var type: String? {
    get {
      return resultMap["type"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  public var weaponType: String? {
    get {
      return resultMap["weaponType"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "weaponType")
    }
  }

  public var selectedSet: SelectedSet? {
    get {
      return (resultMap["selectedSet"] as? ResultMap).flatMap { SelectedSet(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "selectedSet")
    }
  }

  public var trait: Trait? {
    get {
      return (resultMap["trait"] as? ResultMap).flatMap { Trait(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "trait")
    }
  }

  public var glyph: Glyph? {
    get {
      return (resultMap["glyph"] as? ResultMap).flatMap { Glyph(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "glyph")
    }
  }

  public struct SelectedSet: GraphQLSelectionSet {
    public static let possibleTypes = ["Set"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(SetFragment.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, setId: Int, name: String, location: String, type: String, slug: String, bonusItem_1: String? = nil, bonusItem_2: String? = nil, bonusItem_3: String? = nil, bonusItem_4: String? = nil, bonusItem_5: String? = nil, hasJewels: Int, hasWeapons: Int, hasHeavyArmor: Int, hasLightArmor: Int, hasMediumArmor: Int, traitsNeeded: Int? = nil, esoId: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "Set", "id": id, "setId": setId, "name": name, "location": location, "type": type, "slug": slug, "bonus_item_1": bonusItem_1, "bonus_item_2": bonusItem_2, "bonus_item_3": bonusItem_3, "bonus_item_4": bonusItem_4, "bonus_item_5": bonusItem_5, "has_jewels": hasJewels, "has_weapons": hasWeapons, "has_heavy_armor": hasHeavyArmor, "has_light_armor": hasLightArmor, "has_medium_armor": hasMediumArmor, "traits_needed": traitsNeeded, "eso_id": esoId])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var setFragment: SetFragment {
        get {
          return SetFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Trait: GraphQLSelectionSet {
    public static let possibleTypes = ["Modification"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(ModificationFragment.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, type: String, itemType: String, modificationType: String, description: String, icon: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Modification", "id": id, "type": type, "itemType": itemType, "modificationType": modificationType, "description": description, "icon": icon])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var modificationFragment: ModificationFragment {
        get {
          return ModificationFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Glyph: GraphQLSelectionSet {
    public static let possibleTypes = ["Modification"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(ModificationFragment.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, type: String, itemType: String, modificationType: String, description: String, icon: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Modification", "id": id, "type": type, "itemType": itemType, "modificationType": modificationType, "description": description, "icon": icon])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var modificationFragment: ModificationFragment {
        get {
          return ModificationFragment(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct SkillFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment SkillFragment on Skill {
      __typename
      id
      skillId
      cast_time
      cost
      effect_1
      effect_2
      icon
      name
      parent
      range
      skillline
      slug
      target
      type
      unlocks_at
    }
    """

  public static let possibleTypes = ["Skill"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("skillId", type: .nonNull(.scalar(Int.self))),
    GraphQLField("cast_time", type: .nonNull(.scalar(String.self))),
    GraphQLField("cost", type: .nonNull(.scalar(String.self))),
    GraphQLField("effect_1", type: .nonNull(.scalar(String.self))),
    GraphQLField("effect_2", type: .scalar(String.self)),
    GraphQLField("icon", type: .scalar(String.self)),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("parent", type: .scalar(Int.self)),
    GraphQLField("range", type: .scalar(String.self)),
    GraphQLField("skillline", type: .nonNull(.scalar(Int.self))),
    GraphQLField("slug", type: .nonNull(.scalar(String.self))),
    GraphQLField("target", type: .scalar(String.self)),
    GraphQLField("type", type: .nonNull(.scalar(Int.self))),
    GraphQLField("unlocks_at", type: .scalar(Int.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, skillId: Int, castTime: String, cost: String, effect_1: String, effect_2: String? = nil, icon: String? = nil, name: String, parent: Int? = nil, range: String? = nil, skillline: Int, slug: String, target: String? = nil, type: Int, unlocksAt: Int? = nil) {
    self.init(unsafeResultMap: ["__typename": "Skill", "id": id, "skillId": skillId, "cast_time": castTime, "cost": cost, "effect_1": effect_1, "effect_2": effect_2, "icon": icon, "name": name, "parent": parent, "range": range, "skillline": skillline, "slug": slug, "target": target, "type": type, "unlocks_at": unlocksAt])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var skillId: Int {
    get {
      return resultMap["skillId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "skillId")
    }
  }

  public var castTime: String {
    get {
      return resultMap["cast_time"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "cast_time")
    }
  }

  public var cost: String {
    get {
      return resultMap["cost"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "cost")
    }
  }

  public var effect_1: String {
    get {
      return resultMap["effect_1"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "effect_1")
    }
  }

  public var effect_2: String? {
    get {
      return resultMap["effect_2"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "effect_2")
    }
  }

  public var icon: String? {
    get {
      return resultMap["icon"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "icon")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var parent: Int? {
    get {
      return resultMap["parent"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "parent")
    }
  }

  public var range: String? {
    get {
      return resultMap["range"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "range")
    }
  }

  public var skillline: Int {
    get {
      return resultMap["skillline"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "skillline")
    }
  }

  public var slug: String {
    get {
      return resultMap["slug"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "slug")
    }
  }

  public var target: String? {
    get {
      return resultMap["target"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "target")
    }
  }

  public var type: Int {
    get {
      return resultMap["type"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  public var unlocksAt: Int? {
    get {
      return resultMap["unlocks_at"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "unlocks_at")
    }
  }
}

public struct SetFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment SetFragment on Set {
      __typename
      id
      setId
      name
      location
      type
      slug
      bonus_item_1
      bonus_item_2
      bonus_item_3
      bonus_item_4
      bonus_item_5
      has_jewels
      has_weapons
      has_heavy_armor
      has_light_armor
      has_medium_armor
      traits_needed
      eso_id
    }
    """

  public static let possibleTypes = ["Set"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("setId", type: .nonNull(.scalar(Int.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("location", type: .nonNull(.scalar(String.self))),
    GraphQLField("type", type: .nonNull(.scalar(String.self))),
    GraphQLField("slug", type: .nonNull(.scalar(String.self))),
    GraphQLField("bonus_item_1", type: .scalar(String.self)),
    GraphQLField("bonus_item_2", type: .scalar(String.self)),
    GraphQLField("bonus_item_3", type: .scalar(String.self)),
    GraphQLField("bonus_item_4", type: .scalar(String.self)),
    GraphQLField("bonus_item_5", type: .scalar(String.self)),
    GraphQLField("has_jewels", type: .nonNull(.scalar(Int.self))),
    GraphQLField("has_weapons", type: .nonNull(.scalar(Int.self))),
    GraphQLField("has_heavy_armor", type: .nonNull(.scalar(Int.self))),
    GraphQLField("has_light_armor", type: .nonNull(.scalar(Int.self))),
    GraphQLField("has_medium_armor", type: .nonNull(.scalar(Int.self))),
    GraphQLField("traits_needed", type: .scalar(Int.self)),
    GraphQLField("eso_id", type: .scalar(Int.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, setId: Int, name: String, location: String, type: String, slug: String, bonusItem_1: String? = nil, bonusItem_2: String? = nil, bonusItem_3: String? = nil, bonusItem_4: String? = nil, bonusItem_5: String? = nil, hasJewels: Int, hasWeapons: Int, hasHeavyArmor: Int, hasLightArmor: Int, hasMediumArmor: Int, traitsNeeded: Int? = nil, esoId: Int? = nil) {
    self.init(unsafeResultMap: ["__typename": "Set", "id": id, "setId": setId, "name": name, "location": location, "type": type, "slug": slug, "bonus_item_1": bonusItem_1, "bonus_item_2": bonusItem_2, "bonus_item_3": bonusItem_3, "bonus_item_4": bonusItem_4, "bonus_item_5": bonusItem_5, "has_jewels": hasJewels, "has_weapons": hasWeapons, "has_heavy_armor": hasHeavyArmor, "has_light_armor": hasLightArmor, "has_medium_armor": hasMediumArmor, "traits_needed": traitsNeeded, "eso_id": esoId])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var setId: Int {
    get {
      return resultMap["setId"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "setId")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var location: String {
    get {
      return resultMap["location"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "location")
    }
  }

  public var type: String {
    get {
      return resultMap["type"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  public var slug: String {
    get {
      return resultMap["slug"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "slug")
    }
  }

  public var bonusItem_1: String? {
    get {
      return resultMap["bonus_item_1"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "bonus_item_1")
    }
  }

  public var bonusItem_2: String? {
    get {
      return resultMap["bonus_item_2"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "bonus_item_2")
    }
  }

  public var bonusItem_3: String? {
    get {
      return resultMap["bonus_item_3"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "bonus_item_3")
    }
  }

  public var bonusItem_4: String? {
    get {
      return resultMap["bonus_item_4"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "bonus_item_4")
    }
  }

  public var bonusItem_5: String? {
    get {
      return resultMap["bonus_item_5"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "bonus_item_5")
    }
  }

  public var hasJewels: Int {
    get {
      return resultMap["has_jewels"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "has_jewels")
    }
  }

  public var hasWeapons: Int {
    get {
      return resultMap["has_weapons"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "has_weapons")
    }
  }

  public var hasHeavyArmor: Int {
    get {
      return resultMap["has_heavy_armor"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "has_heavy_armor")
    }
  }

  public var hasLightArmor: Int {
    get {
      return resultMap["has_light_armor"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "has_light_armor")
    }
  }

  public var hasMediumArmor: Int {
    get {
      return resultMap["has_medium_armor"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "has_medium_armor")
    }
  }

  public var traitsNeeded: Int? {
    get {
      return resultMap["traits_needed"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "traits_needed")
    }
  }

  public var esoId: Int? {
    get {
      return resultMap["eso_id"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "eso_id")
    }
  }
}

public struct ModificationFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment ModificationFragment on Modification {
      __typename
      id
      type
      itemType
      modificationType
      description
      icon
    }
    """

  public static let possibleTypes = ["Modification"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("type", type: .nonNull(.scalar(String.self))),
    GraphQLField("itemType", type: .nonNull(.scalar(String.self))),
    GraphQLField("modificationType", type: .nonNull(.scalar(String.self))),
    GraphQLField("description", type: .nonNull(.scalar(String.self))),
    GraphQLField("icon", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, type: String, itemType: String, modificationType: String, description: String, icon: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Modification", "id": id, "type": type, "itemType": itemType, "modificationType": modificationType, "description": description, "icon": icon])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var type: String {
    get {
      return resultMap["type"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  public var itemType: String {
    get {
      return resultMap["itemType"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "itemType")
    }
  }

  public var modificationType: String {
    get {
      return resultMap["modificationType"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "modificationType")
    }
  }

  public var description: String {
    get {
      return resultMap["description"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var icon: String? {
    get {
      return resultMap["icon"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "icon")
    }
  }
}

public struct BuildFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment BuildFragment on Build {
      __typename
      id
      name
      applicationArea
      description
      role
      race
      esoClass
      published
      accessRights
    }
    """

  public static let possibleTypes = ["Build"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("applicationArea", type: .scalar(String.self)),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("role", type: .scalar(String.self)),
    GraphQLField("race", type: .scalar(String.self)),
    GraphQLField("esoClass", type: .scalar(String.self)),
    GraphQLField("published", type: .nonNull(.scalar(Bool.self))),
    GraphQLField("accessRights", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String? = nil, applicationArea: String? = nil, description: String? = nil, role: String? = nil, race: String? = nil, esoClass: String? = nil, published: Bool, accessRights: String) {
    self.init(unsafeResultMap: ["__typename": "Build", "id": id, "name": name, "applicationArea": applicationArea, "description": description, "role": role, "race": race, "esoClass": esoClass, "published": published, "accessRights": accessRights])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var applicationArea: String? {
    get {
      return resultMap["applicationArea"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "applicationArea")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var role: String? {
    get {
      return resultMap["role"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "role")
    }
  }

  public var race: String? {
    get {
      return resultMap["race"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "race")
    }
  }

  public var esoClass: String? {
    get {
      return resultMap["esoClass"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "esoClass")
    }
  }

  public var published: Bool {
    get {
      return resultMap["published"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "published")
    }
  }

  public var accessRights: String {
    get {
      return resultMap["accessRights"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "accessRights")
    }
  }
}
