
import Foundation

class HeaderModel
{
    var title:String = ""
    var logo:String = ""
    var background:String = ""
    var image:String = ""
    
    func populate(dictionary:NSDictionary) {
        
        title = dictionary["title"] as! String
        logo = dictionary["logo"] as! String
        background = dictionary["background"] as! String
        image = dictionary["image"] as! String
    }
    
    
}

class CultureModelItem
{
    var title:String = ""
    var description:String = ""
    var image:String = ""
    
    func populate(dictionary:NSDictionary) {
        
        title = dictionary["title"] as! String
        description = dictionary["description"] as! String
        image = dictionary["image"] as! String
    }
    static func populateArray(array:NSArray) -> [CultureModelItem]
    {
        var result:[CultureModelItem] = []
        for item in array
        {
            let newItem = CultureModelItem()
            newItem.populate(dictionary: item as! NSDictionary)
            result.append(newItem)
        }
        return result
    }
    
}

class CultureModel
{
    var title:String = ""
    var description:String = ""
    var cultureItems:[CultureModelItem] = []
    
    func populate(dictionary:NSDictionary) {
        
        title = dictionary["title"] as! String
        description = dictionary["description"] as! String
        cultureItems = CultureModelItem.populateArray(array: dictionary["cultureItems"] as! [NSArray] as NSArray)
    }
    static func populateArray(array:NSArray) -> [CultureModel]
    {
        var result:[CultureModel] = []
        for item in array
        {
            let newItem = CultureModel()
            newItem.populate(dictionary: item as! NSDictionary)
            result.append(newItem)
        }
        return result
    }
    
}

class AreasModelItem
{
    var title:String = ""
    var image:String = ""
    
    func populate(dictionary:NSDictionary) {
        
        title = dictionary["title"] as! String
        image = dictionary["image"] as! String
    }
    static func populateArray(array:NSArray) -> [AreasModelItem]
    {
        var result:[AreasModelItem] = []
        for item in array
        {
            let newItem = AreasModelItem()
            newItem.populate(dictionary: item as! NSDictionary)
            result.append(newItem)
        }
        return result
    }
    
}

class AreasModel
{
    var title:String = ""
    var areasItems:[AreasModelItem] = []
    
    func populate(dictionary:NSDictionary) {
        
        title = dictionary["title"] as! String
        areasItems = AreasModelItem.populateArray(array: dictionary["areasItems"] as! [NSArray] as NSArray)
    }
    static func populateArray(array:NSArray) -> [AreasModel]
    {
        var result:[AreasModel] = []
        for item in array
        {
            let newItem = AreasModel()
            newItem.populate(dictionary: item as! NSDictionary)
            result.append(newItem)
        }
        return result
    }
    
}

class SocialModelItem
{
    var image:String = ""
    
    func populate(dictionary:NSDictionary) {
        
        image = dictionary["image"] as! String
    }
    static func populateArray(array:NSArray) -> [SocialModelItem]
    {
        var result:[SocialModelItem] = []
        for item in array
        {
            let newItem = SocialModelItem()
            newItem.populate(dictionary: item as! NSDictionary)
            result.append(newItem)
        }
        return result
    }
    
}

class SocialModel
{
    var title:String = ""
    var socialItems:[SocialModelItem] = []
    
    func populate(dictionary:NSDictionary) {
        
        title = dictionary["title"] as! String
        socialItems = SocialModelItem.populateArray(array: dictionary["socialItems"] as! [NSArray] as NSArray)
    }
    static func populateArray(array:NSArray) -> [SocialModel]
    {
        var result:[SocialModel] = []
        for item in array
        {
            let newItem = SocialModel()
            newItem.populate(dictionary: item as! NSDictionary)
            result.append(newItem)
        }
        return result
    }
    
}

class CarrearModel
{
    enum KindOfContent:Int {
        case Header = 0 ,Areas, Culture, Social
    }
    
    
    var header:HeaderModel = HeaderModel()
    var culture:CultureModel = CultureModel()
    var areas:AreasModel = AreasModel()
    var social:SocialModel = SocialModel()
    
    func populate(dictionary:NSDictionary) {
        
        header.populate(dictionary: dictionary["header"] as! NSDictionary)
        
        culture.populate(dictionary: dictionary["culture"] as! NSDictionary)
        areas.populate(dictionary: dictionary["areas"] as! NSDictionary)
        social.populate(dictionary:dictionary["social"] as! NSDictionary)
    }
    
    
    static func populate(dictionary:NSDictionary) -> CarrearModel
    {
        let result = CarrearModel()
        result.populate(dictionary: dictionary)
        return result
    }
    
}
