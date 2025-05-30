import { Component, EventEmitter, Output } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { FormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatDialogModule } from '@angular/material/dialog';

@Component({
  selector: 'app-report-dialog',
  standalone: true,
  imports: [FormsModule, MatDialogModule, MatButtonModule],
  templateUrl: './report-dialog.component.html',
})
export class ReportDialogComponent {
  reportDescription: string = '';  

  constructor(
    public dialogRef: MatDialogRef<ReportDialogComponent>
  ) {}

  onCancel() {
    this.dialogRef.close(false);
  }

  onSubmit() {
    this.dialogRef.close(this.reportDescription);
  }
}

