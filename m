Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4734CFA1
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921554; cv=none; b=Y/ZE+IhpO2sqeU3WCins9jQQpxTZ5MXUsVc6E96aU4OxbN6bPM+8dzCDQwZYVscH6LODn3R52WrtLVOK6hm8UIw4EY8bsG7Ygt9jGm4AmRpUun5CafpweKTf+l6vnTL+hpfi7NBTtI8A7rcaAhwJbY8yV+SvCBNA4kYK/ipdPpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921554; c=relaxed/simple;
	bh=aiPXxbkBtL2g1i14xqt2LGY7RPn85iUFNe9a0NClGa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NaR2gfw0UJ8J9Fj2ZTFUTYKE5J2sQWAth3J8Xp5tnr/zNrhE8iuCbm/VZ8+OPUFRKJ9s4YwQqA89XpSkJpFYUBSr/vRmGFK6pm0JuMwTZYbxW/2M6WhsF0veY/ly5U6z7SfeGveIfcRhmem+QUM1REZep4Ltn9mCXouA7JSwRgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwXrFg59; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwXrFg59"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9825ba7e8dso36719466b.3
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921548; x=1774526348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZa0s7hz2156Ccpdoak30m2Gw7JDYqAQedbI9A51ZyU=;
        b=jwXrFg5916CCvzLfTU0t6sbRD+c7bpyZTKNdYFN3nwU52oGcjtegr1wh7G2cQLyPoc
         TaRQR4cDmr40W7OatWJ76qncMx0H12GXhR7oonw2qjjHtwFNwQfmc8gabdZwI8xgbtEY
         2/AGBzv1m9TC38AAqiwBbymy54FmRJu5Fcma7/0YJgYAKFi+OafHExB1nFaBO/q3YP4f
         ov76Qf52i9tXV+ilupxpyridYtx43+zMxGTTo8mMD30MCUQpo1rZKiQgy0l1idVvAGF8
         Sfb620oTBsEGo8w/HEwm8zck8uynOVgBpKZnKi5qI+a1wDKTsYyn3qc5nxV9vp73gUyD
         SxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921548; x=1774526348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZa0s7hz2156Ccpdoak30m2Gw7JDYqAQedbI9A51ZyU=;
        b=jssxpxlQMX1idM1mqChHHMSLLKgH24zK/oZyKSETDjhi569BBLzMuoR5SSiE4LlKwj
         cNTJKwgp+G7EKyFNsLe1xd5Ms3Vo9MWrls904NRbLEpcIVDKf25GhJotzXGjXE4iysbw
         Um/NpnA+JQfUNJkwC76bgrtA42iir8gNSPy5Qgq+uBmTzgTCGo2rjtYvgg0J7+GNewoj
         GD43xgDh2E2tJrJjJtqqhLUTYuxK+RKyyKYxC1D6ZtMoY5023UxwJzjMzGGNS6izKdd9
         iZhWQsj3vnSqlCRzRyufKEcXWV8SKy+zLcKfC+QyRJvUojoR30UiTHqVccIvmnXJuTbX
         Szfg==
X-Forwarded-Encrypted: i=1; AJvYcCUb09MVwzQpaHx5Q+NKn+89amsp331Rzg8KBMZ/FzUYaKA8EqFNe5lhSMMG5SsGiN+3FHqM13yMOnxZGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIiiyZIPjUJiACfInFFPvgiRWKTge/kYVwqQaB1reqS4yrKFJv
	KS0oBWvcuenLqjiKis8IzOTRiIYD6FbLFCGaQFeoKDg2KhFqc1Kdtfhg
X-Gm-Gg: ATEYQzx+g76wk83/BU8k3tALYj1RV97W/6qNy8w/RxSJY+l63CBM/7aD9B+B3dp0j+P
	2NXTWTPqMqqZRyA0cDPjbnUnACh2AbrkTYRtGFfSc1ph73ciV21TBsw7N3AYk9faATTN8/jiX62
	FvDPortgqRk7Ezv4LSACtlXFRBAbd3IGAT/Rq0+CdmvUyYLtBPO/Q0MKS0sL6YTNYbTaU/mkBrR
	3016fSQV1txAVdp/8kxwosiQ6yfPxHdeYIqPqzEwaqXZ82NZyXwEq2JjtGYzzBLaT5KIRBFZITo
	jNtzFsPjoVmeBe0U2s85BFkm8MGAsBSznR5ExRgKLpBzLkF6W4+KlPnamVbJzMfZ01En4QhK/p8
	xYxFRbfku9uFxnIC6VAik+/y+WR9IabUkfGlOSLi7RojaYdww1tUOUSvaDGBxMpxsr/vvZ3gXNq
	f5E2NdDt0muKehRdgq40r/I2cU45jlE+2w+xYR
X-Received: by 2002:a17:907:728e:b0:b98:667:2e1d with SMTP id a640c23a62f3a-b9806672ff4mr337932966b.25.1773921547845;
        Thu, 19 Mar 2026 04:59:07 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16d3380sm461399166b.42.2026.03.19.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:59:07 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 19 Mar 2026 13:58:39 +0200
Subject: [PATCH v5 1/8] dt-bindings: iio: light: vcnl4000: add regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-vcnl4000-regulators-v5-1-a025d3332805@gmail.com>
References: <20260319-vcnl4000-regulators-v5-0-a025d3332805@gmail.com>
In-Reply-To: <20260319-vcnl4000-regulators-v5-0-a025d3332805@gmail.com>
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
one external, for their open drain interrupt line, to ensure the sensor
is powered on before proceeding with setup.

[1] https://www.vishay.com/docs/84274/vcnl4040.pdf

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
index 2ba4d5de4ec4..44882a90bc76 100644
--- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
+++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
@@ -33,6 +33,10 @@ properties:
   interrupts:
     maxItems: 1
 
+  vdd-supply: true
+  vio-supply: true
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

