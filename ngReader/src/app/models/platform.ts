import { Program } from "./program";

export class Platform {

    id: number;
    name: string;
    programs: Program[];

    constructor(
        id: number = 0,
        name: string = '',
        programs: Array<Program> = new Array()
    ){
        this.id = id;
        this.name = name;
        this.programs = programs;
    }


}
