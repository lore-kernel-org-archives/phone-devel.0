Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42E35E938
	for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773504401; cv=none; b=UUfHV5AzSl0QPMoaeLP80OnykAJqCcFaSbGeztlvg6RcS5L4hPgVTaHAMfAUyO7td6T7mlKkBKrH0uEMIitJ0ckV5iSGeIba84QatZ0eG6CNLWNNavyq76l99nsTY23RA/1sepzrOOZsgBAwkYEHyylyh2lxW7fLuhQrSVBFCuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773504401; c=relaxed/simple;
	bh=lHEF6gffcSJSnQo4z2EbBuNrPboTiVaWCanIyhfeSeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QWxt/DLD8wMes4QQOZQBlaN4EEiiQ+J2gq4BF63FlKc2kYuMdTJm27Faldnr71q1Cj1EMFgnCXi1KC1q1qaGIAu99Kvb73m6w3bh8zJ+kbFwZ8v5jvKIN74+yTV8tq2HikKthD33dtmSBJBN78JsrwKB0Zy5QH83KP/Apg2/bAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW3Jcuom; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW3Jcuom"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-661d929219bso3670157a12.0
        for <phone-devel@vger.kernel.org>; Sat, 14 Mar 2026 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773504399; x=1774109199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+I3WG1paH1NyUuAIPAj7t3lCASphrEGmzEIZovUf74=;
        b=iW3JcuomsN5uwmuYAgh8XnBNYkOXoV3luzhQ99V+l6Bwv9qacQzW3RN3a7QjIyj8Z7
         //Lic3exO5wkJneyPI+S8GhXCw4QL9DBj3FtVDphK4BhybgDFUKLJvxOGmD57hbqnx+r
         AwyKTAEjeEoJQKkqIlk3JjHiyfZPcBtzU8rFgAjNXIJ3lJCy312oquV3M/x6X4yr1Ioj
         EgqqPO/MEoeFbg6FGahv3uU5wO+YK5fTmJtKrfavIuyM/wxeFuxmk4IZ4BQcCXWoO3CD
         oqoJAiY4WY2X7TMsLvZyEgpTYXfSyhx8YLdbRX3j+SUEXKrIqPwO8lKnylTdoGkVgnOa
         kT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773504399; x=1774109199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+I3WG1paH1NyUuAIPAj7t3lCASphrEGmzEIZovUf74=;
        b=RM6F/9hp9FdagwDo1OBQ41jxSkY0TR7kQbqOuFSYn93f5PG6n/yYNW2ktHCefShbb7
         Gd0QkP1uTST634gZaFkrKl4cmM8w43AzDqAqnPM2EcqwvMiTUMsJ5nfpjUA5Quj3NTaS
         U/Y9vS67FR+5saR1i7OGxRgu9Xu0HWdHl7vcZG2iM3DCLVWS+rnnQtgUtmFB4X6/+p4Y
         Hf+AGvVhg0RwN7F5au7ruTXClVqn5hdu3jgDrsYu7zg702BRw+mPh6AtVneHxauOKk/k
         9nmQEkgyimPDzALw2JNpYYFZY0YOwS/qgUuHEpjOFu0xsBP2eVHQSrAqAQ6zeUArL9EJ
         C9/A==
X-Forwarded-Encrypted: i=1; AJvYcCVnRxIwoHWLuuz20FzvQztfzYg4lO911/tjrJ7+5l2A/UUy+ZcGgTDBwoCooQWMs1gMjKTdNgNQg6SIeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxstxkqz7Xjrn9io1Gc6USexyBMHPdm9UfKAPysihz/ubev/aEB
	q7ssdjwgUMPWLX9Qo6cMSwGlfqwuKpD6+7BcoXSgrAZNxYoEpAxs2P14
X-Gm-Gg: ATEYQzw1GvH+GiDbvJxTaPTJnXu+DGONPHjtAHyylRt9IinkHtXJO5V/IJOtTnjNrt5
	oLmlAIE0fHjnK2mxWfw6XPyARQRW6a9rRZGsk/hDzmS+l7UOGfBf1HGRjZIrAZUqXkER6z3xfxU
	WcEFJS/RReNRfCW82JMM5rjoYqHmVSg+LFS1L+w4xW90QvRMC+zjrWC3Yx4HGF6Tghc0hAy6c0o
	jHlzDK+QXleJO2K4uweBX38kV2WHxJf0VQ70zuVED8lBPPPZWaZrYvpCBx6pr7BhTszfUriMfIu
	YN0hXAdqst5z1jrU7aub7oQAtDI50jflLwPY9LH8JGh4HcE30rWNTd0B3A1BBBIoWPDjkYhRzrT
	3WN6f/w1WMEK1ss7aMIQBbfmM5cHH1ExN7Mjjt5SPCNg35Xgo5nmJ6NO3G/P+IXXjVjkdb4pz/f
	nYoVoZNZBgsbOzDWulvnT6dGQbXw==
X-Received: by 2002:a17:906:3419:b0:b8e:8874:8384 with SMTP id a640c23a62f3a-b9764f8b1fbmr330896066b.4.1773504398404;
        Sat, 14 Mar 2026 09:06:38 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978b8625d3sm151722366b.52.2026.03.14.09.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 09:06:38 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 14 Mar 2026 18:06:30 +0200
Subject: [PATCH v3 1/6] dt-bindings: iio: light: vcnl4000: add regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-vcnl4000-regulators-v3-1-3c4a48d30676@gmail.com>
References: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
In-Reply-To: <20260314-vcnl4000-regulators-v3-0-3c4a48d30676@gmail.com>
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

This commit adds supply properties for the sensor, I2C bus and IR LED
anode supplies [1], which can be found in vcnl4000 ambient light and
proximity sensors, to ensure the sensor is powered on before proceeding
with setup.

[1] https://www.vishay.com/docs/84274/vcnl4040.pdf

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

