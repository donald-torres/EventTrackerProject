import { Category } from "./category";
import { Platform } from "./platform";

export class Program {
    id: number;
    name: string;
    description: string;
    imageUrl: string;
    stillAiring: boolean;
    length: number;
    episodeCount: number;
    totalRuntime: number;
    active: boolean;
    category: Category;
    platforms: Platform [];

    constructor(
        id: number = 0,
        name: string = '',
        description: string = '',
        imageUrl: string = '', 
        stillAiring: boolean = false,
        length: number = 0,
        episodeCount: number = 0,
        totalRuntime: number = 0,
        active: boolean = true,
        category: Category = new Category(),
        platforms:  Array<Platform> = new Array()
    ){
        this.id = id;
        this.name = name
        this.description = description
        this.imageUrl = imageUrl
        this.stillAiring = stillAiring
        this.length = length
        this.episodeCount = episodeCount
        this.totalRuntime = totalRuntime
        this.active = active
        this.category = category
        this.platforms = platforms
    }

}
