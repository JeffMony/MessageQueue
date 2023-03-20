package com.jeffmony.nativeevent.demo;

import android.Manifest;
import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.github.florent37.runtimepermission.RuntimePermission;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        RuntimePermission.askPermission(this)
                .request(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                .onAccepted((result -> {
                })).ask();
        findViewById(R.id.image_btn).setOnClickListener(v -> {
            // Intent intent = new Intent(MainActivity.this, ImageRenderActivity.class);
            // startActivity(intent);
        });
    }
}
