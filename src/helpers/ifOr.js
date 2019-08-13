module.exports = function (options) {      
    var optsArray = Object.keys(options.hash).map((key)=>{
        return options.hash[key];
    });    
    for (let i=0;i<optsArray.length;i++){
        if (optsArray[i]){
            return options.fn(this);
        }            
    }
    return options.inverse(this);
};