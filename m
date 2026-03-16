Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DECC3CF032
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 17:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681595; cv=none; b=GRpZAj81xaN3clAXyoJ5JkMMx8wJlHd5YbDfNljMzo6MvKjDYG6ZDk+0pZtekuMp4iPmmYaqN45Dlgw1EKRG4dxUr/fxZNLyHQOc4qtcfUz60gZI8wo6hbps7pCaXHJ5sx+3zzKh7hrOanm68WbRLWI/rwZ6srd+y6AacWN2dt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681595; c=relaxed/simple;
	bh=CZ1jj/eiHUYjGjlvolJhpPQIMl/aN3JFj+jg+nCFVEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQTSWES8X7tO6LtJbEQG+chy7gTG8fOiib+mOOQCcwT6gf/gFVlTr6QMka6LiwyQLztKY9w3Ms1y4NlSACACn0BEJNkhWEdUN3E2RxSg7I6Upxgxr0oqdc/UfIrGT4mHcXD4VuKeZTC4OqfJqsBYcz2emxjfWGJ3xqWbyFavlBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5QHY4EM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5QHY4EM"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b97b7e0368eso192218466b.3
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773681591; x=1774286391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrOVP7ftGVSwzsjwgJO9DIOtGTWA2U/htQxTfqCFeYU=;
        b=Z5QHY4EMw7pa4wLUPbEWBfKlCivNMR+CiRr4ZckwZ53Atfavbyan9qta8SUB99FSTq
         ORO4a1HiTFiWQKaptg0di8cKeTODsWTTQ28tHa/Nk0pXdznLByXb6UbBw5X78MVINb4S
         izwnl667pGlIYfnNlEscJMs8oY33uUzH3oDdFCWiXLWcACEUKP7/yebPwyVKbPXIs57e
         jUauZxsE9EddMUBbSuECgQEu/eEhRMO1qUIFEsGWRXOoQmVROorNGgdvk8f6/QrZckyE
         IyO0Kv3aRmQhIoN59SlXHjeRHWenX1fRAXNucp4F4g0Pe3CyWXa4Ak3pIKwA1LyXe7Hd
         xonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681591; x=1774286391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hrOVP7ftGVSwzsjwgJO9DIOtGTWA2U/htQxTfqCFeYU=;
        b=A2vDf30XQ9fjQvZWX3cMy4YZA+ssgm+kuCnjEERzRXBQZ1m1x9+0lVg5dLj1ruzU4M
         KaRgJgJmjoItDeRKPNBLmf56MhGguiRf8rPXCW27TFQVYjfl2ImUfGE47puoCQfeXtqQ
         bsEAH9/muOhbYLo/4XpPeNXLyIY51XX8dVFsmoAYahQd02CCdg6540uxm2pVBHIiRmIF
         jn68/tcf+fvyDOxNJlBxW3ucI89+md4CrCnZ9tKvNmjG6kC6R1iaSXI48iTG7IP+gUDw
         rlsVUVRYJu1eRcy6EM9j/gnpRH9wRQaM0feklex2vMiTPlzdGN8VUBCo0T3kTH2Eo9Rk
         lhSA==
X-Forwarded-Encrypted: i=1; AJvYcCVOVMJaZZeQUqerz8fRp2QABRjBnsZC6hOyl5PRYp7h0rZgH3MV40zzLvdgxTwCpuYtGUxh6RRppgwdkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjMLNZPwh+GYkzcKtJ3zvBpGBwWrKcubaqf+lkT+orkDVh+Qnq
	07oZjogBn5RwIBMECo3Sr48BvpsjLTTgGNKkf8VmcxOE1rZJd9Cj7Og5XywEVuXL
X-Gm-Gg: ATEYQzw9W8fB8YoZY8nIgLtRffBWKn+EGr3xjVQdNyX40zQHEevc+7EN/Kvhe5qeB/8
	BdfBe4hI7jbDbLrZ6nojwnG4wWxwZASUu5Rns1pp2YEImRN/+GoXmQgoMsDouqCpb513We5fG17
	ywGiq4iH7pD4Ljv4XBH5k7u0f5PBukieHgsTzd2YqqIeYkVZRbIj1Nsj1jmB1ncebltjYc9PLb2
	DWbpijLXfOP71vy7NDPDiGBpQkpK/Syw2BEVCgsL2csqwK4fHQp4Wy/GlJ3xnC4zLbKLvUluVDt
	O1XBsQ5Z3+AiA9LsxOieaB42s9bafIEp4ueMcau5gudH38hevtGkmQEDt+Rd2js9yBEExl2K3sB
	7DeW0wh7oQ2Hkm3tM/cbLM4QaPzWkwcwKyMcFcMg6FIQgv3+4JpDv7WVcXOBHQ29F3YnxaAVRTP
	5MaPLXoa5/+UDtRDQNirftNJA13g==
X-Received: by 2002:a17:906:7953:b0:b97:73ae:e1f with SMTP id a640c23a62f3a-b9773ae1114mr769934166b.34.1773681590773;
        Mon, 16 Mar 2026 10:19:50 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97846174cfsm505940266b.22.2026.03.16.10.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:19:50 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 16 Mar 2026 19:19:45 +0200
Subject: [PATCH v4 1/7] dt-bindings: iio: light: vcnl4000: add regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-vcnl4000-regulators-v4-1-854fc2eaf54b@gmail.com>
References: <20260316-vcnl4000-regulators-v4-0-854fc2eaf54b@gmail.com>
In-Reply-To: <20260316-vcnl4000-regulators-v4-0-854fc2eaf54b@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

These sensors can accept 2 supplies - one for the sensor and one for IR
LED [1]. Add supply properties for the sensor - 2 for the sensors and
one external, for their I2C bus, to ensure the sensor is powered on
before proceeding with setup.

[1] https://www.vishay.com/docs/84274/vcnl4040.pdf

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
index 2ba4d5de4ec4..a1b4c02db246 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
@@ -33,6 +33,10 @@ properties:
   interrupts:
     maxItems: 1
 
+  vdd-supply: true
+  vddio-supply: true
+  vled-supply: true
+
   reg:
     maxItems: 1
 
@@ -54,6 +58,9 @@ examples:
             compatible = "vishay,vcnl4200";
             reg = <0x51>;
             proximity-near-level = <220>;
+            vdd-supply = <&reg_vdd>;
+            vddio-supply = <&reg_vddio>;
+            vled-supply = <&reg_vled>;
         };
     };
 ...

-- 
2.53.0

