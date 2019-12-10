import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { RegistroService } from "../registro/registro.service";
import { Router } from '@angular/router';
import { IProfesor } from "./profesor";

@Component({
  selector: 'app-profesor',
  templateUrl: './profesor.component.html',
  styleUrls: ['./profesor.component.css']
})
export class ProfesorComponent implements OnInit {

    constructor(private fb: FormBuilder,
      private registroService: RegistroService,
      private router: Router) { }

    formGroup: FormGroup;

    ngOnInit() {
      this.formGroup = this.fb.group({
        nombre: "",
        profesion: ""
      });
    }

    save() {
      let profesor: IProfesor = Object.assign({}, this.formGroup.value);

        this.registroService.createProfesor(profesor).subscribe(profesor => this.onSaveSuccess(),
        error => console.error(error));
    }

    onSaveSuccess() {
      this.router.navigate(["/registro"]);
    }

}
