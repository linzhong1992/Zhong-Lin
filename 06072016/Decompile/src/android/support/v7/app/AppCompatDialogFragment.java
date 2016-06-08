package android.support.v7.app;

import android.support.v4.app.*;
import android.os.*;
import android.app.*;
import android.content.*;

public class AppCompatDialogFragment extends DialogFragment
{
    @Override
    public Dialog onCreateDialog(final Bundle bundle) {
        return new AppCompatDialog((Context)this.getActivity(), this.getTheme());
    }
    
    @Override
    public void setupDialog(final Dialog dialog, final int n) {
        if (!(dialog instanceof AppCompatDialog)) {
            super.setupDialog(dialog, n);
            return;
        }
        final AppCompatDialog appCompatDialog = (AppCompatDialog)dialog;
        switch (n) {
            default: {}
            case 3: {
                dialog.getWindow().addFlags(24);
            }
            case 1:
            case 2: {
                appCompatDialog.supportRequestWindowFeature(1);
            }
        }
    }
}
