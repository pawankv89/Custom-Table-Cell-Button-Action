//
//  MovieDataSource.swift
//  DynamicCellHeight Demo
//
//  Created by Pawan kumar on 31/03/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//


import UIKit

class MovieDataSource: NSObject {
    
    class func moviesList() -> [Movie] {
        let moviesList = [
            
            Movie(name:"Uri: The Surgical Strike" , details: "Indian army special forces carries a covert operation, avenging the killing of fellow army men at their base by a terrorist group."),
            Movie(name:"Gully Boy" , details: "A coming-of-age story based on the lives of street rappers in Mumbai."),
            Movie(name:"Badla " , details: "A dynamic young entrepreneur finds herself locked in a hotel room with the corpse of her dead lover. She hires a prestigious lawyer to defend her and they work together to figure out what actually happened."),
            Movie(name:"The Accidental Prime Minister" , details: "Explores Manmohan Singh's tenure as the Prime Minister of India and the kind of control he had over the cabinet and the country."),
            Movie(name:"Manikarnika: The Queen of Jhansi" , details: "Story of Rani Lakshmibai, one of the leading figures of the Indian Rebellion of 1857 and her resistance to the British Rule."),
            Movie(name:"Total Dhamaal" , details: "A group of people learn about a hidden treasure and then they race to find it and claim it."),
            Movie(name:"Kesari" , details: "Based on an incredible true story of the Battle of Saragarhi in which an army of 21 Sikhs fought against 10,000 Afghans in 1897."),
            Movie(name:"Luka Chuppi" , details: "It tells the story of a television reporter in Mathura who falls in love with a headstrong woman."),
            Movie(name:"Thackeray" , details: "Biographical account of Shiv Sena Supremo, Balasaheb Thackeray."),
            Movie(name:"Sonchiriya" , details: "Set in the Chambal valley, the film follows the story of a legion of dreaded, warring dacoits who once terrorized the Indian heartlands."),
            Movie(name:"Why Cheat India" , details: "The movie focuses on existing malpractices in country's education system, the whole concept of buying your way through education, jobs and earnings. Even with an evolving education system, the country faces scams like SSC and HSC paper leaks, CBSE re-examination, Vyaapam, etc. The movie tries to shift the attention of people to understand the vulnerability of hardworking and gifted students who get left out."),
            Movie(name:"Ek Ladki Ko Dekha Toh Aisa Laga" , details: "Some love stories are not simple, Sweety's is one such story. She has to contend with her over-enthusiastic family that wants to get her married, a young writer who is completely smitten by her, a secret that she harbours close to her heart and ultimately the truth that her true love might not find acceptance in her family and society. Resolving these issues proves hilarious, touching and life changing. Balbir Chaudhary is a well to do businessman in small town Moga in Punjab living with his mother and children Babloo and Sweety.Sahil Mirza son of well known producer is a failed writer director.He saves Sweety from a person but later realizes he was her bother Babloo trying to stop her for something.Sahil reaches Moga with Chatro to search Sweety and conducts an acting workshop. Baldev and his family feel Sweety is having and affair with a Muslim boy and put boundaries for her in outside world .Sahil inspires Sweety's grandmother and is invited to her birthday party with Chatro where Baldev mistakes him as the same Muslim boy.All the while Sahil thinks that Sweety is in love with him.But she discloses to him that she is different from everyone and in relationship with a girl."),
            Movie(name:"Mard Ko Dard Nahin Hota" , details: "It is a story of a young boy Surya who has a rare condition of Congenital Insensitivity to pain meaning he can not feel pain, and he sets out to learn martial arts and hunt down muggers."),
            Movie(name:"Photograph" , details: "A struggling street photographer in Mumbai, pressured to marry by his grandmother, convinces a shy stranger to pose as his fiancée. The pair develop a connection that transforms them in ways they could not expect."),
            Movie(name:"Mere Pyare Prime Minister" , details: "A story about four children living in a Mumbai slum in India. An eight-year old Kanhu writes a letter to the Prime Minister after a dramatic incident with his mother. A small boy has to achieve the impossible.")
        ]
        return moviesList
    }
}

