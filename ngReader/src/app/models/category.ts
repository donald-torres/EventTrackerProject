import { Program } from "./program";

export class Category {
    
    id: number;
    type: string;
    description: string;
    programs: Program[];

    constructor(

        id: number = 0,
        type: string = '',
        description: string = '',
        programs: Array<Program> = new Array()
    ){

        this.id = id;
        this.type = type;
        this.description = description;
        this.programs = programs;

    }

}
