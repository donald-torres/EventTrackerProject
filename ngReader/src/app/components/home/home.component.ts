import { Component, OnInit } from '@angular/core';
import { ProgramService } from '../../services/program.service';
import { Program } from '../../models/program';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { PlatformService } from '../../services/platform.service';
import { Platform } from '../../models/platform';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css',
})
export class HomeComponent implements OnInit {
  programs: Program[] = [];
  selected: Program | null = null;
  newProgram: Program = new Program();
  editProgram: Program | null = null;
  add: any = null;

  constructor(
    private programService: ProgramService,
    private platformService: PlatformService
  ) {}

  ngOnInit(): void {
    this.reload();
  }

  loadPrograms() {
    this.programService.index().subscribe({
      next: (proList) => {
        this.programs = proList;
      },
      error: (problem) => {
        console.error('HomeComponent.loadPrograms(): error loading programs:');
        console.error(problem);
      },
    });
  }

  displayProgram(program: Program | null) {
    return (this.selected = program);
  }
  addProgram(newProgram: Program) {
    this.programService.create(newProgram).subscribe({
      next: (result) => {
        this.reload();
        this.add = null;
        this.newProgram = new Program();
      },
      error: (problem) => {
        console.error(
          'ProgramListComponent.addProgram(): error creating Program:'
        );
        console.error(problem);
      },
    });
  }

  setEditProgram() {
    this.editProgram = Object.assign({}, this.selected);
  }
  updateProgram(editProgram: Program) {
    this.programService.update(editProgram).subscribe({
      next: (result) => {
        this.reload();
        this.editProgram = null;
        this.selected = result;
      },
      error: (problem) => {
        console.error(
          'ProgramListComponent.updateProgram(): error updateing Program:'
        );
        console.error(problem);
      },
    });
  }

  deleteProgram(id: number) {
    this.programService.destroy(id).subscribe({
      next: (result) => {
        this.reload();
        this.selected = null;
      },
      error: (problem) => {
        console.error(
          'ProgramListComponent.deleteProgram(): error deleteing Program:'
        );
        console.error(problem);
      },
    });
  }

  reload() {
    this.programService.index().subscribe({
      next: (data) => {
        this.programs = data;
      },
      error: (problem) => {
        console.error(
          'ProgramListComponent.reload(): error reloading Programs:'
        );
        console.error(problem);
      },
    });
  }
}
