import { Component, OnInit, Inject } from "@angular/core";
import { RegistroService } from "../registro/registro.service";
import { IRegistro } from "./registro";
import { IAlumno } from "../alumno/alumno";
import { MatDialog } from '@angular/material/dialog';
import {RegistroDialogComponent} from "../registro-dialog/registro-dialog.component";

@Component({
  selector: "app-registro",
  templateUrl: "./registro.component.html",
  styleUrls: ["./registro.component.css"]
})

export class RegistroComponent implements OnInit {

    registro: IRegistro[];
    detregistro: IRegistro;
    alumno: IAlumno[];

    constructor(
      private registroService: RegistroService,
      public dialog: MatDialog) {
    }

    ngOnInit() {
      this.registroService.getAlumnos().subscribe(alumnoWs => this.alumno = alumnoWs,
        error => console.error(error),
        () => { console.log(this.alumno) });
    }

    onOptionsSelected(event) {
      this.registroService.getRegistro(event.target.value).subscribe(registroWs => this.registro = registroWs,
        error => console.error(error),
        () => { console.log(this.registro) });
    }

    openDialog(event, registroId): void {
      const dialogRef = this.dialog.open(RegistroDialogComponent, {
        width: "500px",
        data: { registroId }
      });
    }
}

