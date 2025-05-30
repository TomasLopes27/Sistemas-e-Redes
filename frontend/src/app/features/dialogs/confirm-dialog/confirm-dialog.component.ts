import { Component, EventEmitter, Output } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { MatDialogModule } from '@angular/material/dialog';
import { MatButtonModule } from '@angular/material/button';

@Component({
  selector: 'app-confirm-dialog',
  standalone: true,
  templateUrl: './confirm-dialog.component.html',
  styleUrls: ['./confirm-dialog.component.scss'],
  imports: [MatDialogModule, MatButtonModule]
})
export class ConfirmDialogComponent {
  @Output() confirmed = new EventEmitter<boolean>();

  constructor(private dialogRef: MatDialogRef<ConfirmDialogComponent>) {}

  confirm() {
    this.confirmed.emit(true);
    this.dialogRef.close(true);
  }

  cancel() {
    this.confirmed.emit(false);
    this.dialogRef.close(false);
  }
}

